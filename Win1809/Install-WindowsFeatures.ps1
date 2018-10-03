Function Install-WindowsFeatures
{
[CmdletBinding()]
param (
        [string]$Filter = '',
        [validateSet('Installed',"NotPresent")]
        [string]$State
        )

If ($state)
{
Get-WindowsCapability -Online -name ($filter + '*') |
 Select-Object DisplayName, State, Name | where {$_.state -eq $state} |
  Out-GridView -Title "Select Features on Demand" -OutputMode Multiple | ForEach-Object {Add-WindowsCapability -Online -Name $_.name} 
  }
else
{
Get-WindowsCapability -Online -name ($filter + '*') |
 Select-Object DisplayName, State, Name |
  Out-GridView -Title "Select Features on Demand" -OutputMode Multiple | ForEach-Object {Add-WindowsCapability -Online -Name $_.name} 
}

}

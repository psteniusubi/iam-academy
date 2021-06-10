$site = Get-SSOObject -Type "site" "iam-academy" -ErrorAction Stop
$site | Get-SSOLink -LinkName "one" | Select-SSOLink -Link | Remove-SSOObject | Out-Null
$site | Remove-SSOObject | Out-Null

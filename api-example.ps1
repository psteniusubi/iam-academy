# GET /group/System/Authenticated Users
$users = Get-SSOObject -Type "group" "System","Authenticated Users"
# GET /method/password.1
$password1 = Get-SSOObject -Type "method" "password.1"

# PUT /site/iam-academy
$site = Set-SSOObject -Type "site" "iam-academy"
# PUT /site/iam-academy/$link/method/password.1
$site | Set-SSOLink $password1 | Out-Null

# PUT /aplication/iam-academy/example
$application = $site | Set-SSOChild -ChildType "application" "example" -Enabled
# PUT /aplication/iam-academy/example/$link/method/password.1
$application | Set-SSOLink $password1 -Enabled | Out-Null
# PUT /aplication/iam-academy/example/$link/allowedTo/...
$application | Set-SSOLink -LinkName "allowedTo" $users | Out-Null

# PUT /policy/iam-academy/policy
$policy = $site | Set-SSOChild -ChildType "policy" "policy"
# PUT /aplication/iam-academy/example/$link/policy/iam-academy/policy
$application | Set-SSOLink $policy | Out-Null

# PUT /aplication/iam-academy/example/$attribute/metadata
$metadata = @{
"Name"="metadata"
"ContentType"="application/json"
"Body"='{"redirect_uris":["http://localhost/example"]}'
}
$registration = $application | Set-SSOAttribute @metadata 
$registration | ConvertTo-Json

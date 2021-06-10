# https://github.com/psteniusubi/Ubisecure.OAuth2
# https://github.com/psteniusubi/Ubisecure.SSO.Management

Import-Module "Ubisecure.OAuth2"
Import-Module "Ubisecure.SSO.Management"

$sso_config = @{
    "ManageUri"="https://manage.example.ubidemo.com"
    "Uri"="https://login.example.ubidemo.com"
}

$registration = @"
{
    "client_id": "public",
    "client_secret": "public",
    "redirect_uris": [ "http://localhost/public" ]
}
"@

New-OAuthClientConfig -Json $registration | New-SSOLogon @sso_config -Browser "default" -ForceAuthn:$false

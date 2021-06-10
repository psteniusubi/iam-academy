Import-Module "Ubisecure.OAuth2"
Import-Module "Ubisecure.SSO.Management"

$sso_config = @{
    "ManageUri"="https://manage.example.ubidemo.com"
    "Uri"="https://login.example.ubidemo.com"
}

$registration = @{
    "ClientId"="public"
    "ClientSecret"=(ConvertTo-SecureString -String "public" -AsPlainText -Force)
    "RedirectUri"="http://localhost/public"
}

New-OAuthClientConfig @registration | New-SSOLogon @sso_config -Browser "default" -ForceAuthn:$false

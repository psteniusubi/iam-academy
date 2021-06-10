Import-Module "Ubisecure.OAuth2"
Import-Module "Ubisecure.SSO.Management"

$sso_config = @{
    "ManageUri"="https://sso.example.com:8443"
    "Uri"="https://sso.example.com:8443"
}

$registration = @{
    "ClientId"="public"
    "ClientSecret"=(ConvertTo-SecureString -String "public" -AsPlainText -Force)
    "RedirectUri"="http://localhost/public"
}

New-OAuthClientConfig @registration | New-SSOLogon @sso_config -Browser "default" 

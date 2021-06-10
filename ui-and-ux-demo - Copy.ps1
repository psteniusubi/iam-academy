Invoke-RestMethod "https://sso.example.com:8443/uas/discovery?entityID=sso-api-sample" | ConvertTo-Json
Invoke-RestMethod "https://sso.example.com:8443/uas/discovery?entityID=cn=Ubilogin,ou=System" | ConvertTo-Json
Invoke-RestMethod "https://sso.example.com:8443/uas/template/default/json" | ConvertTo-Json
(Invoke-WebRequest "https://sso.example.com:8443/uas/template/default/style.css").Content

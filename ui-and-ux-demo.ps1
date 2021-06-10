Invoke-RestMethod "https://login.example.ubidemo.com/uas/discovery?entityID=sso-api-sample" | ConvertTo-Json
Invoke-RestMethod "https://login.example.ubidemo.com/uas/discovery?entityID=cn=Ubilogin,ou=System" | ConvertTo-Json
Invoke-RestMethod "https://login.example.ubidemo.com/uas/template/default/json" | ConvertTo-Json
(Invoke-WebRequest "https://login.example.ubidemo.com/uas/template/default/style.css").Content
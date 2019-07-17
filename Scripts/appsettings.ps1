$appSettings = "EmbyStat.Web\appsettings.json"
$version = "$($env:GitVersion_SemVer)"

Write-Host "Updating version to $version";
(GC $appSettings).Replace("0.0.0.0", "$version") | Set-Content $appSettings


Write-Host "Updating RollbarENV to dev";
(GC $appSettings).Replace("RollbarENV", "dev") | Set-Content $appSettings

Write-Host "Updating Rollbar key to $($env:webapp-rollbar-key)";
(GC $appSettings).Replace("XXXXXXXXXX", "$($env:webapp-rollbar-key)") | Set-Content $appSettings
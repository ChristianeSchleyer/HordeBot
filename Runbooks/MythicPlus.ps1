#Das ist eine Testzeile

$hordebot = Get-AutomationVariable -Name 'Horde Bot API Key'
$telegram = "https://api.telegram.org/bot"+$hordebot+"/sendMessage?chat_id="

$usercsv = @"
name,chatid
Bottest,-200423768
OaC,-274206339
Kreischi,485357179
"@

$users = ConvertFrom-Csv $usercsv


$raiderio = "https://raider.io/api/v1/mythic-plus/affixes?region=eu&locale=de"

$resp = Invoke-WebRequest -Uri $raiderio -Method Get -UseBasicParsing

$char = $resp.RawContentStream.ToArray()
$str = [Text.Encoding]::UTF8.GetString($char)

$affixes = ConvertFrom-Json $str | Select-Object title
$affixes = $affixes.title -split ", "
$message = "&text=Die Mythic Plus Affixe der neuen Woche sind "+$affixes[0]+", "+$affixes[1]+" und "+$affixes[2]+"! Viel Spaß =)"

$user = $users[2]
$uri = $telegram+$user.chatid+$message
Invoke-WebRequest -Method Post -Uri $uri -UseBasicParsing

<#
foreach ($user in $users)
{
    #send-message
    $uri = $telegram+$user.chatid+$message
    Invoke-WebRequest -Method Post -Uri $uri
    Das ist ein Test
}
#>
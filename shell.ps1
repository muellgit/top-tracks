echo "SC id to internal ID"
if (!$args[0]) { Write-Host "no id given. exit."; exit;}
$url = "https://soundcloud.com/" + $args[0]
Invoke-WebRequest -OutFile index.html $url
echo $url >> sc_introducing_sets.txt
$b = select-string users:\d+ "$pwd\index.html" -All | % { $_.Matches } | % { $_.Value }
$c = $b.split(":")
$d = $c[1]
$url = "http://www.soundcloud.com/discover/sets/introducing:" + $d
echo $url >> sc_introducing_sets.txt

#open in FF
& 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe' $url
##open in IE
#$InternetExplorer=new-object -com internetexplorer.application
#$InternetExplorer.navigate2($url)
#$InternetExplorer.visible=$true
#---
#rm  index.html
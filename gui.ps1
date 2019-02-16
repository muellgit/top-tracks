<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>
function myfunc {#Write your logic code here
if (!$TextBox1.Text) { Write-Host "no id given. exit."; exit;}
else{
$url = "https://soundcloud.com/" + $TextBox1.Text
Invoke-WebRequest -OutFile index.html $url
echo $url >> sc_introducing_sets.txt
$b = select-string users:\d+ "$pwd\index.html" -All | % { $_.Matches } | % { $_.Value }
$c = $b.split(":")
$d = $c[1]
$url = "http://www.soundcloud.com/discover/sets/introducing:" + $d
echo $url >> sc_introducing_sets.txt 
$TextBox1.Text = $url
echo $url | clip
}
}



Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '499,117'
$Form.text                       = "Form"
$Form.TopMost                    = $false

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 436
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(30,30)
$TextBox1.Font                   = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Go"
$Button1.width                   = 60
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(30,64)
$Button1.Font                    = 'Microsoft Sans Serif,10'


$Form.controls.AddRange(@($TextBox1,$Button1))

$Button1.Add_Click({ myfunc })

$Form.ShowDialog()
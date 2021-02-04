function Clear-Host (){

$RawUI = $Host.UI.RawUI
$RawUI.CursorPosition = @{X=0;Y=0}
$RawUI.SetBufferContents(
    @{Top = -1; Bottom = -1; Right = -1; Left = -1},
    @{Character = ' '; ForegroundColor = $rawui.ForegroundColor; BackgroundColor = $rawui.BackgroundColor})
# .Link
# https://go.microsoft.com/fwlink/?LinkID=225747
# .ExternalHelp System.Management.Automation.dll-help.xml

}

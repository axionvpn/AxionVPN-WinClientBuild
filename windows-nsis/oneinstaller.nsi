Name "AxionVPN MultiInstaller"
OutFile "AxionVPN-install-tmp.exe"

SetCompressor lzma

!define MUI_ICON "icon.ico"
!define MUI_UNICON "icon.ico"

; Modern user interface
!include "MUI2.nsh"
!include Sections.nsh
!include x64.nsh



!insertmacro MUI_LANGUAGE "English"



AutoCloseWindow true

Section dummySection

SectionEnd





Function InstallVPN



${If} ${RunningX64}
    # 64 bit code
   Exec $PLUGINSDIR\AxionVPN-install-x.y.z-x86_64.exe

${Else}
    # 32 bit code
   ;MessageBox MB_OK '32-bit hardware'
   ;ExecWait '"$pluginsdir\Axion\AxionVPN-install-1.0.0-i686.exe"'
   Exec $PLUGINSDIR\AxionVPN-install-x.y.z-i686.exe
   ;MessageBox MB_OK 'Done Execing 32-bit'
${EndIf} 


SetOutPath $exedir

FunctionEnd





Function .onInit

   InitPluginsDir
   SetOutPath "$pluginsdir" ;

   ;MessageBox MB_OK 'Plug ins Dir: $PLUGINSDIR'


   File /oname=$PLUGINSDIR\AxionVPN-install-x.y.z-x86_64.exe "AxionVPN-install-x.y.z-x86_64.exe"
   File /oname=$PLUGINSDIR\AxionVPN-install-x.y.z-i686.exe "AxionVPN-install-x.y.z-i686.exe"

   Call InstallVPN
FunctionEnd


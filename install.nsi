Name "GWBash Installer"
InstallDir "$TEMP\GWBash\"
RequestExecutionLevel admin
Page directory
Page license
LicenseData LICENSE
Page components
Page instfiles
UninstPage instfiles
Section 
   SetOutPath $INSTDIR
   inetc::get https://downloads.sourceforge.net/project/mingw/Installer/mingw-get-setup.exe?ts=gAAAAABk-FFZ3Bperx5stlQnpaA14EK_si85cUo0qYMmIHCa5MmQTmaiMSCgN8VhUJlTaCIoQy5VcQkVzealKJIkhpFuJ4iqeA%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fmingw%2Ffiles%2Flatest%2Fdownload mingw-get-setup.exe
   ExecWait mingw-get-setup.exe
   inetc::get https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.2.2-1/rubyinstaller-devkit-3.2.2-1-x64.exe rubyinstaller-devkit-3.2.2-1-x64.exe
   ExecWait rubyinstaller-3.2.2-1-x64.exe
   DetailPrint "You must install them manually in the PATH!"
   File Gemfile
   File gwbash.rb
   Exec "C:\Ruby32\bin\bundle.exe"
   File /oname="LICENSE.txt" LICENSE
   CreateShortCut "$DESKTOP\gwbash.lnk" "gwbash.rb"
   WriteUninstaller "uninst.exe"
SectionEnd

Section "Uninstall"
   RMDir /r $INSTDIR
SectionEnd
; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "McStas Application bundle"
#define MyAppVersion "@VERSION@"
#define MyAppPublisher "McStas"
#define MyAppURL "http://www.mcstas.org"
#define MyAppExeName "setup.exe"


[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9EB3C862-0C7C-489E-841F-76B6555E580A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
CreateAppDir=no
LicenseFile=license_etc\COPYING.rtf
InfoBeforeFile=license_etc\Description.rtf
InfoAfterFile=license_etc\Description.rtf
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "postsetup.bat"; DestDir: "{tmp}"
Source: "python-install.bat"; DestDir: "{tmp}"
Source: "dist\mcstas-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-comps-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-manuals-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-perl-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-perl-cmdline-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mcrun-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mcgui-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mccodelib-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mcplot-pyqtgraph-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mcplot-matplotlib-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-matlab-mcplot-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mcdisplay-webgl-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mcdisplay-pyqtgraph-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "dist\mcstas-tools-python-mcdisplay-mantid-NSIS64-@VERSION@-mingw64.exe"; DestDir: "{tmp}"
Source: "Support\Miniconda3-latest-Windows-x86_64.exe"; DestDir: "{tmp}"
[Run]
Filename: "{tmp}\python-install.bat"
Filename: "{tmp}\postsetup.bat"
Filename: "{tmp}\mcstas-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-comps-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "c:\mcstas-@VERSION@\lib\libs\libnxs\compile.bat"
Filename: "c:\mcstas-@VERSION@\lib\libs\mcpl\compile.bat"
Filename: "c:\mcstas-@VERSION@\lib\libs\neutronics\compile.bat"
Filename: "{tmp}\mcstas-manuals-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-perl-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-perl-cmdline-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mcrun-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mcgui-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mccodelib-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mcplot-pyqtgraph-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mcplot-matplotlib-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-matlab-mcplot-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mcdisplay-webgl-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mcdisplay-pyqtgraph-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"
Filename: "{tmp}\mcstas-tools-python-mcdisplay-mantid-NSIS64-@VERSION@-mingw64.exe"; Parameters: "/S"

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

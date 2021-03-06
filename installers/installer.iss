; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Bing Wallpaper"
#define MyAppVersion "1.17.10.11"
#define MyAppPublisher "Miguel A. Rozalen & Francisco J. Rodriguez"
#define MyAppURL "https://miguelrozalen.github.io/bing-wallpaper/"
#define MyAppExeName "BingWallpaper.exe"
#define MyAppExeServiceName "BingWallpaperServiceManager.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{EAC5177C-9ECE-4B13-A3F9-12D631671B0D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
AppCopyright=GNU General Public License v3.0 2017 Miguel �. Rozal�n & Francisco J. Rodr�guez
DisableProgramGroupPage=yes
LicenseFile=C:\Users\mikel\Desktop\bing-wallpaper\LICENSE
OutputBaseFilename=bing-wallpaper-setup_{#MyAppVersion}
SetupIconFile=C:\Users\mikel\Desktop\bing-wallpaper\icon\bing-wallpaper-icon.ico
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
VersionInfoVersion ={#MyAppVersion}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "greek"; MessagesFile: "compiler:Languages\Greek.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "scottishgaelic"; MessagesFile: "compiler:Languages\ScottishGaelic.isl"
Name: "serbiancyrillic"; MessagesFile: "compiler:Languages\SerbianCyrillic.isl"
Name: "serbianlatin"; MessagesFile: "compiler:Languages\SerbianLatin.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaper.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaper.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaper.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaper.vshost.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaper.vshost.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaperServiceManager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaperServiceManager.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\BingWallpaperServiceManager.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\CommandLine.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\CommandLine.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Hardcodet.Wpf.TaskbarNotification.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Hardcodet.Wpf.TaskbarNotification.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Hardcodet.Wpf.TaskbarNotification.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\JetBrains.Annotations.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\JetBrains.Annotations.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Microsoft.Win32.TaskScheduler.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Microsoft.Win32.TaskScheduler.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Newtonsoft.Json.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\mikel\Desktop\bing-wallpaper\bin\Windows.winmd"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeServiceName}"; Parameters: "-n Bing%Wallpaper -d Bing%Wallpaper%Desktop%Windows -r True -p Every%Day"; Description: "{cm:LaunchProgram,{#StringChange(MyAppExeServiceName, '&', '&&')}}"; Flags: runascurrentuser nowait postinstall skipifsilent
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: runascurrentuser nowait postinstall skipifsilent

[UninstallRun]
Filename: "{app}\{#MyAppExeServiceName}"; Parameters: "-c True";
  
[Code]
procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
    WizardForm.RunList.Visible := False;
end;

function InitializeUninstall(): Boolean;
  var ErrorCode: Integer;
begin
  ShellExec('open','taskkill.exe','/f /im {#MyAppExeName}','',SW_HIDE,ewNoWait,ErrorCode);
  ShellExec('open','tskill.exe',' {#MyAppName}','',SW_HIDE,ewNoWait,ErrorCode);
  result := True;
end;
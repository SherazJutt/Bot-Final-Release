/*
  ;-------------------------------
  AHK Source Code Encryptor v3.3  By FeiYue

  (required AHK v1.1.34+)

  1. This tool can encrypt the AHK script into a self decode script.

  2. Then you can use Ahk2Exe to compile the script into a program,
     combined with mpress.exe or upx.exe packers.
     Don't use Unicode 32/64-bit.bin, but use AHK v1.1.34+.exe

  3. When you want to use the directory relative to the script(eg 001.jpg),
     Don't use A_ScriptDir, A_ScriptFullPath, but use A_ScriptDir2, A_ScriptFullPath2.
     It is recommended to change the path to absolute path  %A_ScriptDir2%\001.jpg.

  4. When you want to Reload your own script, the built-in Reload command will fail,
     You can use Reload() function instead (it's added when encrypted).

;-------------------------------
*/

#NoEnv
#SingleInstance force
ListLines, Off
SetBatchLines, -1
Version = 3.3

fs=
(` %

; You can compile and set icons by using Ahk2Exe.exe

#NoEnv
#NoTrayIcon
#SingleInstance off
SetBatchLines, -1
ScriptGuard1()
ScriptGuard1()  ; By TAC109
{
  if (!A_IsCompiled)
    return
  For i,ahk in ["#1", ">AUTOHOTKEY SCRIPT<"]
  if (rc:=DllCall("FindResource", "Ptr",0, "Str",ahk, "Ptr",10, "Ptr"))
  && (sz:=DllCall("SizeofResource", "Ptr",0, "Ptr",rc, "Uint"))
  && (pt:=DllCall("LoadResource", "Ptr",0, "Ptr",rc, "Ptr"))
  && (pt:=DllCall("LockResource", "Ptr",pt, "Ptr"))
  && (DllCall("VirtualProtect", "Ptr",pt, "Ptr",sz, "UInt",0x40, "UInt*",rc))
  && (InStr(StrGet(pt,20,"CP0"), "<COMPILER:"))
    DllCall("RtlZeroMemory", "Ptr",pt, "UInt",sz)
}

full_command_line := DllCall("GetCommandLine", "str")
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
  Try
  {
    if (A_IsCompiled)
      Run *RunAs "%A_ScriptFullPath%" /restart
    else
      Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
  }
  ExitApp
}

s=
Exec(s)
ExitApp

Exec(str, args="") {
  static MyFunc, base
  SetBatchLines, -1
  if (!MyFunc)
  {
    x32:=""
    . "5557565381ECBC0100008B9C24D00100008BBC24D80100008BAC24DC0100008B"
    . "433C01D88038500F853B080000807801450F85310800008B7078C744247C0000"
    . "000001DE89F08B4E188B761C8B50208B40248974243C8944244031C085C98D34"
    . "137518E9C2070000908DB4260000000083C00139C10F84AF0700008B1486813C"
    . "134765745075E9817C1304726F634175DF8B7424408D04430FB704308B74243C"
    . "8D04838B343085F68974247C0F84780700008D84249D000000BA6500000001DE"
    . "66899424A5000000C784249D00000057726974C78424A10000006546696C8944"
    . "2404891C24FFD683EC08894424488D8424B2000000C78424B2000000476C6F62"
    . "C78424B6000000616C416CC78424BA0000006C6F630089442404891C24FFD683"
    . "EC08B965650000894424588D8424A700000066898C24AF000000C78424A70000"
    . "00476C6F62C78424AB000000616C4672C68424B10000000089442404891C24FF"
    . "D683EC0889442454B873410000C78424CA0000004372656166898424D6000000"
    . "8D8424CA000000C78424CE00000074655072C78424D20000006F636573C68424"
    . "D80000000089442404891C24FFD683EC088944245C8D84240A010000C784240A"
    . "01000043726561C784240E01000074654E61C78424120100006D656450C78424"
    . "1601000069706541C684241A0100000089442404891C24FFD683EC0889442460"
    . "8D84241B010000C784241B010000436F6E6EC784241F0100006563744EC78424"
    . "23010000616D6564C784242701000050697065C684242B010000008944240489"
    . "1C24FFD683EC08894424648D8424BE000000C78424BE000000436C6F73C78424"
    . "C20000006548616EC78424C6000000646C650089442404891C24FFD683EC0889"
    . "4424408D842454010000C784245401000051756572C784245801000079506572"
    . "C784245C010000666F726DC7842460010000616E6365C7842464010000436F75"
    . "6EC78424680100007465720089442404891C24FFD683EC08894424688D84248B"
    . "000000C784248B0000006C737472C784248F00000063617441C6842493000000"
    . "0089442404891C24FFD683EC088944243C8D842494000000C78424940000006C"
    . "737472C78424980000006C656E41C684249C0000000089442404891C24FFD683"
    . "EC0889442444B865410000C784242C0100004765744D668984243C0100008D84"
    . "242C010000C78424300100006F64756CC78424340100006546696CC784243801"
    . "0000654E616DC684243E0100000089442404891C24FFD683EC088D74247C8944"
    . "246CC744241000000000C744240800000000897C24048974240CC70424000000"
    . "00FF54244883EC148B44247C85C08944244C0F85110500008D04AD040000003D"
    . "FF7F0000894424500F864E0400008944247C89442404C7042400000000FF5424"
    . "5883EC0885C089C30F84450500008D842480000000C784243F0100005C5C2E5C"
    . "C784244301000070697065C78424470100005C41484BC784244B010000313233"
    . "34C784244F01000035363738C684245301000000890424FF54246883EC048B84"
    . "24800000008944247C8D84243F010000890424FF54244483EC048DB4243F0100"
    . "008B4C247C8D14068DB404370100009089C883EA01C1E90483E00F83C0418802"
    . "39D675EC8D4301894C247CC60322C7442408FF030000C7042400000000894424"
    . "04FF54246C83EC0CB8202200008DB424D9000000C78424D900000022202F73C7"
    . "8424DD00000063726970C78424E100000074202F6666898424E5000000897424"
    . "04C68424E700000000891C24FF54243C83EC088D8C243F010000891C24894C24"
    . "04FF54243C83EC0889742404C68424DB00000000891C24FF54243C83EC08891C"
    . "24FF54244483EC0489C68B8C24D4010000890C24FF54244401C683EC0481FEFF"
    . "7F00000F8EE50200008D84243F0100008B742460C744241C00000000C7442418"
    . "00000000C744241400000000C744241000000000C744240CFF000000C7442408"
    . "00000000C744240402000000890424FFD683EC208D8C243F0100008944243CC7"
    . "44241C00000000C744241800000000C744241400000000C744241000000000C7"
    . "44240CFF000000C744240800000000C744240402000000890C24FFD683EC2089"
    . "C6837C243CFF0F841703000083F8FF0F840E0300008D8C246C0100008D9424B0"
    . "010000C744247C4400000089C88D7600C6000083C00139D075F68D8424E80000"
    . "00C784246C01000044000000894C2420C744241C00000000C744241800000000"
    . "89442424C744241400000000C744241000000000C744240C00000000C7442408"
    . "00000000895C2404C7042400000000FF54245C83EC2885C00F84550200008B84"
    . "24E8000000890424FF54244083EC048B8424EC000000890424FF54244083EC04"
    . "85ED742431C08D76008DBC27000000008B148789148383C00139C575F38B4424"
    . "5083E8048944244C8B44244CC78424F80000006F000000BA6F000000C78424FC"
    . "00000071000000C784240001000075000000C784240401000077000000C70403"
    . "0000000031C0EB14908DB4260000000089C283E2038B9494F800000069D28300"
    . "000089C183E10301C283C00183F86489948CF800000075D885ED0F841A010000"
    . "31D289D083E003698C84F80000008300000001D1898C84F80000008B0493D1C0"
    . "29C8D1C029C88944247C89049383C20139D575CE8B7C243C8B6C2464C7442404"
    . "00000000893C2489E8FFD083EC08893C248B7C244089F8FFD083EC0489E8C744"
    . "240400000000893424FFD083EC088B6C24508D44247CC744241000000000895C"
    . "24048934248944240C896C2408FF54244883EC1489F8893424FFD08D542BFC83"
    . "EC0489D8C7000000000083C00439C275F3891C24FF54245483EC0431C081C4BC"
    . "0100005B5E5F5DC21000B8FEFFFFFF81C4BC0100005B5E5F5DC21000C744247C"
    . "00800000B800800000E9A4FBFFFF8B8424D4010000891C2489442404FF54243C"
    . "83EC08E901FDFFFF81C4BC010000B8FFFFFFFF5B5E5F5DC210008B7C243C8B6C"
    . "2464C744240400000000893C2489E8FFD083EC08893C248B7C244089F8FFD083"
    . "EC0489E8C744240400000000893424FFD083EC088D44247CC744241000000000"
    . "895C24048934248944240C8B44245089442408FF54244883EC1489F8893424FF"
    . "D083EC04E928FFFFFFB8FCFFFFFFE93CFFFFFF8B44243C8B7C244089042489F8"
    . "FFD083EC0489F8893424FFD083EC04891C24FF542454B8F8FFFFFF83EC04E90C"
    . "FFFFFF8B44243C8B7C244089042489F8FFD083EC0489F8893424FFD083EC0489"
    . "1C24FF542454B8F9FFFFFF83EC04E9DCFEFFFFB8FAFFFFFFE9D2FEFFFF909090"
    x64:=""
    . "4157415641554154555756534881EC78020000B8FFFFFFFF48899424C8020000"
    . "8B513C4989CD4D89C44589CE4801CA803A500F85F3060000807A01450F85E906"
    . "00008B8288000000C784249C000000000000004801C88B48188B5020448B481C"
    . "8B582431C085C94D8D4415007511E9CC0600004883C00139C10F86C006000041"
    . "8B148041817C15004765745075E541817C1504726F634175DA498D4445000FB7"
    . "0418498D448500428B1C0885DB899C249C0000000F848506000048B857726974"
    . "6546696CBA6500000048BE476C6F62616C416C4C01EB66899424D80000004C89"
    . "E9488D9424D000000048898424D000000048BF6D65645069706541FFD34889B4"
    . "24F000000048BE476C6F62616C4672488D9424F00000004C89E94889442458C7"
    . "8424F80000006C6F6300FFD34889B424E0000000B96565000048BE4372656174"
    . "65507266898C24E8000000488D9424E00000004C89E94989C7C68424EA000000"
    . "00FFD341B8734100004889B4241001000048BE4372656174654E616644898424"
    . "1C010000488D9424100100004C89E94889442460C78424180100006F636573C6"
    . "84241E01000000FFD34889B424400100004889BC244801000048BE436F6E6E65"
    . "63744E48BF616D656450697065488D9424400100004C89E94889442468C68424"
    . "5001000000FFD34889B424600100004889BC246801000048BE436C6F73654861"
    . "6E48BF5175657279506572488D9424600100004C89E94889442470C684247001"
    . "000000FFD34889B42400010000488D9424000100004C89E94889842480000000"
    . "C7842408010000646C6500FFD34889BC24C001000048BF666F726D616E636548"
    . "8D9424C00100004889BC24C801000048BF436F756E746572004C89E94889BC24"
    . "D00100004889C6FFD348B96C73747263617441488D9424B00000004889C74889"
    . "8C24B0000000C68424B8000000004C89E9FFD348B96C7374726C656E41488D94"
    . "24C00000004889C548898C24C0000000C68424C8000000004C89E9FFD348B947"
    . "65744D6F64756C41B965410000488D94248001000048898C248001000048B965"
    . "46696C654E616D6644898C249001000048898C248801000048894424504C89E9"
    . "C684249201000000FFD3488D9C249C00000048894424784531C031C948C74424"
    . "20000000004C89E248899C24880000004989D9488B442458FFD0448B94249C00"
    . "00004585D20F854C040000468D2CB5040000004181FDFF7F00000F86C6030000"
    . "4489AC249C0000004489EA31C941FFD74885C04889C30F846104000048B85C5C"
    . "2E5C70697065488D8C24A0000000C78424B00100003536373848898424A00100"
    . "0048B85C41484B31323334C68424B40100000048898424A8010000FFD78B8424"
    . "A0000000488DBC24A00100004889F98984249C000000488B442450FFD08B8C24"
    . "9C0000008D50FF448D48F70F1F44000089C84189D083EA0183E00FC1E90483C0"
    . "414439CA42888404A001000075E241B8FF030000898C249C0000004C8DBC2420"
    . "01000031C9488D5301C60322488B442478FFD048B822202F73637269704C89FA"
    . "4889D94889842420010000B820220000C784242801000074202F66668984242C"
    . "010000C684242E01000000FFD54889FA4889D9FFD54C89FA4889D9C684242201"
    . "000000FFD54889D9488B442450FFD04189C7488B8C24C8020000488B442450FF"
    . "D04101C74181FFFF7F00000F8E8A0200004531C04889F941B9FF000000BA0200"
    . "00004C8B7C247048C744243800000000C744243000000000C744242800000000"
    . "C74424200000000041FFD74889C54531C04889F948C744243800000000C74424"
    . "300000000041B9FF000000C744242800000000C744242000000000BA02000000"
    . "41FFD74883FDFF4889C70F848F0200004883F8FF0F8485020000488D8C240002"
    . "0000C784249C00000068000000488D51684889C8C600004883C0014839D075F4"
    . "488D8424E001000048894C24404531C94531C031C9C784240002000068000000"
    . "488944244848C7442438000000004889DA48C744243000000000C74424280000"
    . "0000C744242000000000488B442468FFD085C00F84E8010000488B8C24E00100"
    . "00FFD6488B8C24E8010000FFD631C04585F67417418B14848914834883C00141"
    . "39C677F04489F048C1E002C7040300000000C78424300100006F000000BA6F00"
    . "0000C784243401000071000000C78424380100007500000031C0C784243C0100"
    . "0077000000EB15660F1F84000000000089C283E2038B94943001000069D28300"
    . "000089C183E10301C283C00183F86489948C3001000075D831D24585F60F84EA"
    . "0000004889D083E003698C84300100008300000001D1898C84300100008B0493"
    . "D1C029C8D1C029C88984249C0000008904934883C2014139D677C84C8BBC2480"
    . "00000031D24889E94C89F8FFD04889E9FFD631D24889F94C89F8FFD04889DA4C"
    . "8B8C24880000004589E84889F948C744242000000000488B442458FFD04889F9"
    . "FFD6418D56FF4889D8488D5493046690C700000000004883C0044839C275F148"
    . "89D9488B442460FFD031C04881C4780200005B5E5F5D415C415D415E415FC3B8"
    . "FEFFFFFFEBE5C784249C00000000800000BA00800000E930FCFFFF488B9424C8"
    . "0200004889D9FFD5E964FDFFFF4C8BBC24800000004889E94C89F8FFD04889E9"
    . "FFD631D24889F94C89F8FFD04889F948C7442420000000004C8B8C2488000000"
    . "4589E84889DA488B442458FFD04889F9FFD6E968FFFFFFB8FCFFFFFFE96AFFFF"
    . "FF4889E9FFD64889F9FFD64889D9488B442460FFD0B8F8FFFFFFE94CFFFFFF48"
    . "89E9FFD64889F9FFD64889D9488B442460FFD0B8F9FFFFFFE92EFFFFFFB8FAFF"
    . "FFFFE924FFFFFF909090909090909090"
    hex:=(A_PtrSize=8 ? x64 : x32)
    VarSetCapacity(MyFunc, len:=StrLen(hex)//2)
    Loop, % len
      NumPut("0x" SubStr(hex,2*A_Index-1,2), MyFunc, A_Index-1, "uchar")
    DllCall("VirtualProtect", "Ptr",&MyFunc, "Ptr",len, "uint",0x40, "Ptr*",0)
    base:=DllCall("GetModuleHandle", "Str","Kernel32", "Ptr")
    IfExist, %A_ScriptFullPath%
      EnvSet, My_ScriptFullPath, %A_ScriptFullPath%
  }
  Loop, % A_Args.Length()
    args.=" """ A_Args[A_Index] """"
  s:=RegExReplace(str,"\s"), RegExReplace(s,"u","",size)
  VarSetCapacity(str,(size+1)*4,0), s:=SubStr(s,InStr(s,"u")+1)
  Loop, Parse, s, u
    NumPut(A_LoopField, str, (A_Index-1)*4, "uint")
  hThread:=DllCall("CreateThread", "Ptr",0, "Ptr",0, "Ptr"
    , RegisterCallback("Thread","F"), "Ptr",0, "uint",0, "Ptr",0)
  r:=DllCall(&MyFunc, "Ptr",base, "AStr",args, "Ptr",&str, "int",size)
  if (hThread)
  {
    DllCall("TerminateThread", "Ptr",hThread, "Ptr",0)
    DllCall("CloseHandle", "Ptr",hThread)
  }
  return r
}

Thread(p)
{
  SetBatchLines, -1
  DllCall("Sleep", "int",3000)
  ExitApp
}

)

if A_Args.Length()>0
{
  file:=A_Args[1]
  IfExist, %file%
    Gosub, Encrypt
  ExitApp
}
Gui, +AlwaysOnTop
Gui, Color, DDEEFF
Gui, Font, cRed s28
Gui, Add, Text,, Drag the AHK script here to Encrypt`n`n
Gui, Show,, AHK Source Code Encryptor v%Version% - By FeiYue
OnMessage(0x201, "LButton_Down")
LButton_Down() {
  SendMessage, 0xA1, 2
}
return

GuiClose:
ExitApp

GuiDropFiles:
  Gui, +OwnDialogs
  Loop, Parse, A_GuiEvent, `n
  {
    file:=A_LoopField
    MsgBox, 4100, Tip, Do you want to encrypt this file ?`n`n%file%
    IfMsgBox, Yes
    {
      Gosub, Encrypt
      MsgBox, 4096, Tip, Encryption is completed !
    }
  }
return

Encrypt:
  FileRead, s, %file%
  s:=RegExReplace(Encode(s), ".{1,60}", "s.=""$0""`n")
  s:=RegExReplace(fs, "i)Exec\([^\n]+\s+ExitApp", s "`n$0")
  f:=RegExReplace(file,"\.[^.\\]+$") . "-encoded.ahk"
  FileDelete, %f%
  FileAppend, %s%, %f%
  s:=""
return

Encode(s) {
  static MyFunc
  if (!MyFunc)
  {
    x32:=""
      . "5756BA6F0000005331C083EC108B5C24208B742424C704246F000000C7442404"
      . "71000000C744240875000000C744240C77000000EB128D76008DBC2700000000"
      . "89C283E2038B149469D28300000089C183E10301C283C00183F86489148C75E0"
      . "31D285F674318D76008DBC270000000089D783E7036904BC830000008D0C108B"
      . "0493890CBC01C8D1C801C8D1C889049383C20139D675D983C41031C05B5E5FC3"
    x64:=""
      . "4883EC1841B86F00000031C0C704246F000000C744240471000000C744240875"
      . "000000C744240C77000000EB0E0F1F004189C04183E003468B04844569C08300"
      . "00004189C14183E1034101C083C00183F8644689048C75D84531C085D2743390"
      . "4D89C24183E2034269049483000000468D0C00428B048146890C944401C8D1C8"
      . "4401C8D1C8428904814983C0014439C277CE31C04883C418C390909090909090"
    hex:=(A_PtrSize=8 ? x64 : x32)
    VarSetCapacity(MyFunc, len:=StrLen(hex)//2)
    Loop, % len
      NumPut("0x" SubStr(hex,2*A_Index-1,2), MyFunc, A_Index-1, "uchar")
    DllCall("VirtualProtect", "Ptr",&MyFunc, "Ptr",len, "uint",0x40, "Ptr*",0)
  }
  add=
  (` %
;-----------------------
ListLines, Off
global A_ScriptDir2, A_ScriptFullPath2
EnvGet, file, My_ScriptFullPath
A_ScriptFullPath2:=file
A_ScriptDir2:=RegExReplace(file, "\\[^\\]*$")
SetWorkingDir, %A_ScriptDir2%
OnlyOne(file)
OnlyOne(flag="") {
  DetectHiddenWindows, % (dhw:=A_DetectHiddenWindows) ? "On":"On"
  hash:=0
  Loop, Parse, flag
    hash:=(hash*31+Ord(A_LoopField))&0xFFFFFFFF
  Name:="Ahk_OnlyOne_" hash
  While Mutex:=DllCall("OpenMutex", "int",0x100000, "int",0, "str",Name)
  {
    DllCall("CloseHandle", "Ptr",Mutex)
    WinGet, list, List, <<%flag%>> ahk_class AutoHotkey
    Loop, % list
    IfWinExist, % "ahk_id " . list%A_Index%
    {
      WinGet, pid, PID
      WinClose,,, 3
      IfWinExist
      {
        Process, Close, %pid%
        Process, WaitClose, %pid%, 3
      }
    }
  }
  DllCall("CreateMutex", "Ptr",0, "int",0, "str",Name)
  IfEqual, A_LastError, 0xB7, ExitApp
  WinSetTitle, ahk_id %A_ScriptHwnd%,, <<%flag%>>
  DetectHiddenWindows, %dhw%
}
Reload(args="") {
  Loop % A_Args.Length()
    args.=" """ A_Args[A_Index] """"
  EnvGet, file, My_ScriptFullPath
  if (file="")
    return
  if RegExMatch(file, "i)\.(exe|com|scr|bat|cmd)\s*$")
    Run, "%file%" /f %args%,, UseErrorLevel
  else
    Run, "%A_AhkPath%" /f "%file%" %args%,, UseErrorLevel
  ExitApp
}
ListLines, On
  ;-----------------------
  )
  s:="`n" add "`n" s "`nExitApp`n#SingleInstance off`n"
  ;  . togetcode(s)
  s:=(A_IsUnicode ? chr(0xfeff) : chr(0xEF) chr(0xBB) chr(0xBF))
    . RegExReplace(s,"\R","`r`n") . "`t`t`t"
  size:=VarSetCapacity(s,-1)//4
  DllCall(&MyFunc, "Ptr",&s, "uint",size, "Cdecl")
  VarSetCapacity(str, size*11*(!!A_IsUnicode+1))
  Loop, % size
    str.="u" . NumGet(s, (A_Index-1)*4, "uint")
  return str
}

; If you need to read the script itself, you need it
togetcode(s) {
  s:=StrReplace(StrReplace(s,"`r"), "#", "#0")
  r:="`n"";``"
  Loop, Parse, r
    s:=StrReplace(s, A_LoopField, "#" A_Index)
  s:=RegExReplace(s, ".{1,60}", "s.=""$0""`n")
  s:= "`n getcode(k) {"
    . "`n ListLines, Off"
    . "`n IfNotEqual, k, abc@123.com, return"
    . "`n s= `n" . s
    . "`n r:=""``n"""";````"" "
    . "`n Loop, Parse, r"
    . "`n s:=StrReplace(s, ""#"" A_Index, A_LoopField)"
    . "`n s:=StrReplace(s, ""#0"", ""#"")"
    . "`n return s"
    . "`n } `n"
  return s
}

;======== The End ========

;

getfs() {
  fs=
(` %

#include <windows.h>

typedef HANDLE (WINAPI * _GetProcAddress)(
  HMODULE hModule,
  LPCSTR  lpProcName );

typedef BOOL (WINAPI * _WriteFile)(
  HANDLE       hFile,
  LPCVOID      lpBuffer,
  DWORD        nNumberOfBytesToWrite,
  LPDWORD      lpNumberOfBytesWritten,
  LPOVERLAPPED lpOverlapped );

typedef HGLOBAL (WINAPI * _GlobalAlloc)(
  UINT   uFlags,
  SIZE_T dwBytes );

typedef HGLOBAL (WINAPI * _GlobalFree)(
  HGLOBAL hMem );

typedef BOOL (WINAPI * _CreateProcessA)(
  LPCSTR                lpApplicationName,
  LPSTR                 lpCommandLine,
  LPSECURITY_ATTRIBUTES lpProcessAttributes,
  LPSECURITY_ATTRIBUTES lpThreadAttributes,
  BOOL                  bInheritHandles,
  DWORD                 dwCreationFlags,
  LPVOID                lpEnvironment,
  LPCSTR                lpCurrentDirectory,
  LPSTARTUPINFOA        lpStartupInfo,
  LPPROCESS_INFORMATION lpProcessInformation );

typedef HANDLE (WINAPI * _CreateNamedPipeA)(
  LPCSTR                lpName,
  DWORD                 dwOpenMode,
  DWORD                 dwPipeMode,
  DWORD                 nMaxInstances,
  DWORD                 nOutBufferSize,
  DWORD                 nInBufferSize,
  DWORD                 nDefaultTimeOut,
  LPSECURITY_ATTRIBUTES lpSecurityAttributes );

typedef BOOL (WINAPI * _ConnectNamedPipe)(
  HANDLE       hNamedPipe,
  LPOVERLAPPED lpOverlapped );

typedef BOOL (WINAPI * _CloseHandle)(
  HANDLE hObject );

typedef BOOL (WINAPI * _QueryPerformanceCounter)(
  LARGE_INTEGER *lpPerformanceCount );

typedef LPSTR (WINAPI * _lstrcatA)(
  LPSTR  lpString1,
  LPCSTR lpString2 );

typedef int (WINAPI * _lstrlenA)(
  LPCSTR lpString );

typedef DWORD (WINAPI * _GetModuleFileNameA)(
  HMODULE hModule,
  LPSTR lpFilename,
  DWORD nSize );

//-----------------------------

int WINAPI DecodeAndRun(
  HMODULE hMod, LPCSTR args, LPDWORD str, DWORD size )
{
  DWORD i, j, k, name_num;
  PUCHAR base, addr;
  LPDWORD Addr_func, Addr_name, hMen;
  PUSHORT Addr_ord;
  HANDLE p1, p2;
  //-----------------------------
  base = (PUCHAR)hMod;
  addr = base+(*(LPDWORD)(base+0x3C));
  if (addr[0] != 'P' || addr[1] != 'E')
    return -1;
  k = (sizeof(HANDLE)==8 ? 0x88 : 0x78);
  addr = base+(*(LPDWORD)(addr+k));
  name_num  = *(LPDWORD)(addr+0x18);
  Addr_func = (LPDWORD)(base+(*(LPDWORD)(addr+0x1C)));
  Addr_name = (LPDWORD)(base+(*(LPDWORD)(addr+0x20)));
  Addr_ord  = (PUSHORT)(base+(*(LPDWORD)(addr+0x24)));
  char str0[] = "GetProcAddress";
  for (i=0, k=0; i<name_num; i++)
  {
    j=Addr_name[i];
    if ( (*(LPDWORD)(base+j)) == (*(LPDWORD)(str0))
    && (*(LPDWORD)(base+j+4)) == (*(LPDWORD)(str0+4)) )
    {
      k=Addr_func[Addr_ord[i]];
      break;
    }
  }
  if (k==0)
    return -2;
  //-----------------------------
  _GetProcAddress GetProcAddress = (_GetProcAddress)(base+k);

  char str1[] = "WriteFile";
  _WriteFile WriteFile = (_WriteFile)GetProcAddress(hMod,str1);

  char str2[] = "GlobalAlloc";
  _GlobalAlloc GlobalAlloc = (_GlobalAlloc)GetProcAddress(hMod,str2);

  char str3[] = "GlobalFree";
  _GlobalFree GlobalFree = (_GlobalFree)GetProcAddress(hMod,str3);

  char str4[] = "CreateProcessA";
  _CreateProcessA CreateProcessA = (_CreateProcessA)GetProcAddress(hMod,str4);

  char str5[] = "CreateNamedPipeA";
  _CreateNamedPipeA CreateNamedPipeA = (_CreateNamedPipeA)GetProcAddress(hMod,str5);

  char str6[] = "ConnectNamedPipe";
  _ConnectNamedPipe ConnectNamedPipe = (_ConnectNamedPipe)GetProcAddress(hMod,str6);

  char str7[] = "CloseHandle";
  _CloseHandle CloseHandle = (_CloseHandle)GetProcAddress(hMod,str7);

  char str8[] = "QueryPerformanceCounter";
  _QueryPerformanceCounter QueryPerformanceCounter = (_QueryPerformanceCounter)GetProcAddress(hMod,str8);

  char str9[] = "lstrcatA";
  _lstrcatA lstrcatA = (_lstrcatA)GetProcAddress(hMod,str9);

  char str10[] = "lstrlenA";
  _lstrlenA lstrlenA = (_lstrlenA)GetProcAddress(hMod,str10);

  char str11[] = "GetModuleFileNameA";
  _GetModuleFileNameA GetModuleFileNameA = (_GetModuleFileNameA)GetProcAddress(hMod,str11);

  //-----------------------------
  WriteFile(0, str, 0, &k, 0);
  if (k!=0)
    return -4;
  k=(size+1)*4; if (k<32768) k=32768;
  hMen=(LPDWORD)GlobalAlloc(0, k);
  if (hMen==0)
    return -6;
  //-----------------------------
  // "ahk_path" /script /f "pipe_name" args
  //-----------------------------
  char pipe_name[] = "\\\\.\\pipe\\AHK12345678";
  LARGE_INTEGER count;
  QueryPerformanceCounter(&count);
  k=count.LowPart; j=lstrlenA(pipe_name);
  for (i=1; i<=8; i++, k>>=4)
    pipe_name[j-i]=(k&0xF)+'A';
  //-----------------------------
  LPSTR cmdline=(LPSTR)hMen; cmdline[0]='\"';
  GetModuleFileNameA(0, cmdline+1, 1023);
  char t1[]="\" /script /f \"";
  lstrcatA(cmdline, t1);
  lstrcatA(cmdline, pipe_name); t1[2]=0;
  lstrcatA(cmdline, t1);
  if (lstrlenA(cmdline)+lstrlenA(args)<32768)
    lstrcatA(cmdline, args);
  //-----------------------------
  p1=CreateNamedPipeA(pipe_name, 2, 0, 255, 0, 0, 0, 0);
  p2=CreateNamedPipeA(pipe_name, 2, 0, 255, 0, 0, 0, 0);
  if ((HANDLE)-1 == p1 || (HANDLE)-1 == p2)
  {
    CloseHandle(p1);
    CloseHandle(p2);
    GlobalFree(hMen);
    return -7;
  }
  STARTUPINFOA si;
  PROCESS_INFORMATION pi;
  k=sizeof(STARTUPINFOA); addr=(PUCHAR)&si;
  for (i=0; i<k; i++)
    addr[i]=0;
  si.cb=k;
  if (!CreateProcessA(0, cmdline, 0,0,0, 0,0,0, &si, &pi))
  {
    CloseHandle(p1);
    CloseHandle(p2);
    GlobalFree(hMen);
    return -8;
  }
  CloseHandle(pi.hProcess);
  CloseHandle(pi.hThread);
  for (i=0; i<size; i++)
    hMen[i]=str[i];
  hMen[i]=0;
  //-----------------------------
  // Copy the contents of Decode()
  //-----------------------------
  // My private encryption algorithm is not published here.
  // You can write your own encryption algorithm. Such as:
  unsigned int hash=0;
  for (i=0; i<100; i++)
    hash = hash * 31 + i;
  for (i=0; i<size; i++)
    hMen[i] = (hMen[i] ^ (hash + i)) - 666;
  //-----------------------------
  ConnectNamedPipe(p1, 0);
  CloseHandle(p1);
  ConnectNamedPipe(p2, 0);
  WriteFile(p2, hMen, (size+1)*4, &k, 0);
  CloseHandle(p2);
  for (i=0; i<size; i++)
    hMen[i]=0;
  GlobalFree(hMen);
  return 0;
}

//******** Encode() ********

int Encode(unsigned int * hMen, unsigned int size)
{
  // My private encryption algorithm is not published here.
  // You can write your own encryption algorithm. Such as:
  unsigned int i, hash=0;
  for (i=0; i<100; i++)
    hash = hash * 31 + i;
  for (i=0; i<size; i++)
    hMen[i] = (hMen[i] + 666) ^ (hash + i);
}

//******** Decode() ********

int Decode(unsigned int * hMen, unsigned int size)
{
  // My private encryption algorithm is not published here.
  // You can write your own encryption algorithm. Such as:
  unsigned int i, hash=0;
  for (i=0; i<100; i++)
    hash = hash * 31 + i;
  for (i=0; i<size; i++)
    hMen[i] = (hMen[i] ^ (hash + i)) - 666;
}

)
  return fs
}

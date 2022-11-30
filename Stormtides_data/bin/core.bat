
@echo off
mode con cols=48 lines=35
setlocal enabledelayedexpansion
set select=1
net use Y: /delete
set msplash=y
set nsplash=y
goto startgame
set s1=-
set s2=-
set s3=-
set s4=-
// MARK: Starting Menu
color 0f
:startgame
title StormTides Byte
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo Welcome to [34mStorm[36mTides[0m  ^|  %version%
echo %linevar2%
echo [0m
echo [%s1%] Load Save[0m
echo [%s2%] New Save[0m
echo [%s3%] Controls[0m
echo.
echo %linevar%
echo [%s4%] Exit[0m
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto login2
if "%select%"=="2" set select=1&goto new
if "%select%"=="3" set select=1&goto controls
if "%select%"=="4" exit
)
goto startgame

:controls
cls
mode con cols=48 lines=35
if %select% gtr 7 set select=1
if %select% lss 1 set select=7
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Controls 
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Up: W[0m
echo [%s2%] Down: S[0m
echo [%s3%] Select: D[0m
echo [%s4%] Inv: I[0m
echo [%s5%] Menu: M[0m
echo [%s6%] Back: A[0m
echo.
echo %linevar%
echo [%s7%] Back[0m
choice /c:wsd /n /m ""
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto controls
if "%select%"=="2" set select=2&goto controls
if "%select%"=="3" set select=3&goto controls
if "%select%"=="4" set select=4&goto controls
if "%select%"=="5" set select=5&goto controls
if "%select%"=="6" set select=5&goto controls
if "%select%"=="7" set select=1&goto startgame
)
goto controls

:error3
echo No slots left...
pause>nul
goto startgame


:edit
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m@[97m
echo Load Save[0m
echo %linevar%
if exist "%dir_path%\save1\save1.sav" < %dir_path%\save1\save1.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save1\save1.sav" echo [%s1%] 1  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save1\save1.sav" echo [%s1%] 1  [90mNew Save[0m[0m

if exist "%dir_path%\save2\save2.sav" < %dir_path%\save2\save2.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save2\save2.sav" echo [%s2%] 2  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save2\save2.sav" echo [%s2%] 2  [90mNew Save[0m[0m

if exist "%dir_path%\save3\save3.sav" < %dir_path%\save3\save3.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save3\save3.sav" echo [%s3%] 3  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save3\save3.sav" echo [%s3%] 3  [90mNew Save[0m[0m

if exist "%dir_path%\save4\save4.sav" < %dir_path%\save4\save4.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save4\save4.sav" echo [%s4%] 4  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save4\save4.sav" echo [%s4%] 4  [90mNew Save[0m[0m

if exist "%dir_path%\save5\save5.sav" < %dir_path%\save5\save5.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save5\save5.sav" echo [%s5%] 5  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save5\save5.sav" echo [%s5%] 5  [90mNew Save[0m[0m
set sv=%select%
echo %linevar%
echo [%s6%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto editsv
if "%select%"=="2" set select=2&goto editsv
if "%select%"=="3" set select=3&goto editsv
if "%select%"=="4" set select=4&goto editsv
if "%select%"=="5" set select=5&goto editsv
if "%select%"=="6" set select=1&goto startgame
)
goto edit

:editsv
set sv=%select%
if exist "%dir_path%\save%sv%\save%sv%.sav" goto editsave
if not exist "%dir_path%\save%sv%\save%sv%.sav" goto edit

:editsave
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m@[97m
echo Edit Save[0m
echo %linevar%

if exist "%dir_path%\save%sv%\save%sv%.sav" < %dir_path%\save%sv%\save%sv%.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save%sv%\save%sv%.sav" echo 1  %username1%: Level [90m%levell%[0m

echo %linevar%
echo [%s1%] Rename Save[0m
echo [%s2%] Delete Save[0m
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto rename
if "%select%"=="2" set select=1&goto del-confirm
if "%select%"=="3" set select=2&goto edit
)
goto editsave

:rename
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Rename Save
echo %linevar%
echo New Save Name:
set /p sn=^> 
if not defined sn (
goto rename
)

(
set /p username1=%sn%
) > %dir_path%\save%sv%\save%sv%.sav

echo Done! %nc% is now your save name
echo [%s1%] Okay
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto mainmenu
)
goto rename


:new
set sv=0
goto findnew
:findnew
if "%sv%"=="5" goto error3
set /a sv+=1
if not exist "%dir_path%\save%sv%\save%sv%.sav" goto createuser
goto findnew
:createuser
cls
mode con cols=48 lines=35
echo %linevar%
echo What would you like your Save Name to be?
echo %linevar%
echo.
set /p username1=^> 
if not defined username1 (
goto createuser
)
if %username1% EQU exit goto startgame
:checkforspaces
set x=!v1f!
set Letter%v1f%=!username1:~%x%,1!
if "!Letter%v1f%!" EQU " " (
echo.
echo.
echo Sorry you cant use spaces in your Save Name.
echo.
pause>nul
goto createuser
)
if NOT "!Letter%v1f%!" EQU "" (
set /a v1f=%v1f%+1
goto checkforspaces
)
:loginSUCCESS2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo SUCCESSFULLY CREATED SAVE FILE
echo %linevar%
echo We hope you have fun playing
echo [36mStormTides[0m!
echo.
echo %linevar%
echo [%s1%] Okay
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto DATA_VALUES
)
goto loginSUCCESS2

:login2
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m@[97m
echo Load Save[0m
echo %linevar%
if exist "%dir_path%\save1\save1.sav" < %dir_path%\save1\save1.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save1\save1.sav" echo [%s1%] 1  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save1\save1.sav" echo [%s1%] 1  [90mNew Save[0m[0m

if exist "%dir_path%\save2\save2.sav" < %dir_path%\save2\save2.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save2\save2.sav" echo [%s2%] 2  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save2\save2.sav" echo [%s2%] 2  [90mNew Save[0m[0m

if exist "%dir_path%\save3\save3.sav" < %dir_path%\save3\save3.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save3\save3.sav" echo [%s3%] 3  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save3\save3.sav" echo [%s3%] 3  [90mNew Save[0m[0m

if exist "%dir_path%\save4\save4.sav" < %dir_path%\save4\save4.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save4\save4.sav" echo [%s4%] 4  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save4\save4.sav" echo [%s4%] 4  [90mNew Save[0m[0m

if exist "%dir_path%\save5\save5.sav" < %dir_path%\save5\save5.sav (
set /p username1=
set /p password1=
set /p levell=
)
if exist "%dir_path%\save5\save5.sav" echo [%s5%] 5  %username1%: Level [90m%levell%[0m
if not exist "%dir_path%\save5\save5.sav" echo [%s5%] 5  [90mNew Save[0m[0m
set sv=%select%
echo %linevar%
echo [%s6%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto loadsv
if "%select%"=="2" set select=2&goto loadsv
if "%select%"=="3" set select=3&goto loadsv
if "%select%"=="4" set select=4&goto loadsv
if "%select%"=="5" set select=5&goto loadsv
if "%select%"=="6" set select=1&goto startgame
)
goto login2

:loadsv
set sv=%select%
if exist "%dir_path%\save%sv%\save%sv%.sav" goto loginSUCCESS
if not exist "%dir_path%\save%sv%\save%sv%.sav" goto no_save_content

:no_save_content
goto new

:loginSUCCESS
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo SUCCESSFULLY LOADED SAVE FILE
echo %linevar%
echo We hope you have fun playing
echo [36mStormTides[0m!
echo.
echo %linevar%
echo [%s1%] Okay
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&< %dir_path%\save%sv%\save%sv%.sav (
set /p username1=
set /p password1=
set /p levell=1
set /p title=Noob
set /p xpmul=1
set /p dmgnpc=0
set /p origxp=500
set /p hp=100
set /p orighp=100
set /p damage=0
set /p swordchoice=hi
set /p swordtype=Your
set /p armortype=N/A
set /p playerxp=0
set /p skind=hand
set /p skindA=N/A
set /p dr=0
set /p armtype=No 
set /p gold=50
set /p sword1=0
set /p sword2=0
set /p sword3=0
set /p sword4=0
set /p sword5=0
set /p sword6=0
set /p sword7=0
set /p sword8=0
set /p weapon1=0
set /p weapon2=0
set /p armor1=0
set /p armor2=0
set /p armor3=0
set /p armor4=0
set /p armor5=0
set /p armor6=0
set /p armor7=0
set /p armor8=0
set /p dchest=0
set /p gmail=0
set /p clegs=0
set /p bufflegs=0
set /p bfp=0
set /p dbrain=0
set /p skin=0
set /p seeds=0
set /p fins=0
set /p cshard=0
set /p rocks=0
set /p ocoins=0
set /p bobst=0
set /p fangs=0
set /p pelt=0
set /p pelt2=0
set /p zombief=0
set /p bones=0
set /p wbones=0
set /p eskull=0
set /p gbones=0
set /p cskull=0
set /p potiont1=3
set /p potiont2=0
set /p potiont3=0
set /p damage=0
set /p gcho=--
set /p cost=--
set /p Woodcuttingmaxxp=500
set /p Woodcuttinglvl=1
set /p Woodcuttingxpleft=0
set /p Woodcuttingcurxp=0
set /p miningmaxxp=500
set /p mininglvl=1
set /p miningxpleft=0
set /p miningcurxp=0
set /p ttlvl=1
set /p qc1=0
set /p raidpot=0
set /p campname=%username1%'s Camp
set /p levelitm=1
set /p stormstone=0
set /p artifacttype=None
set /p skindAr=N/A
set /p orb1=0
set /p key1=0
set /p key2=0
set /p key3=0
set /p key4=0
set /p weapon3=0
set /p weapon4=0
)
< %dir_path%\save%sv%\settings.ini (
set /p as=Online
set /p color=0f
)
< %dir_path%\save%sv%\etx_player-cell.pak (
set /p quickitem=none
set /p spell1=0
set /p spell2=0
set /p spell3=0
set /p spell4=0
set /p spell5=0
set /p spell6=0
set /p spell7=0
set /p spell8=0
set /p spell9=0
set /p spell10=0
)
cls
)
mode con cols=48 lines=35
goto SAVE_GAME_FILES2
)
goto loginSUCCESS

:DATA_VALUES
set levell=1
set title=Noob
set xpmul=1
set dmgnpc=0
set origxp=500
set hp=100
set orighp=100
set damage=0
set swordchoice=hi
set swordtype=Your
set armortype=N/A
set playerxp=0
set skind=hand
set skindA=N/A
set dr=0
set armtype=No 
set gold=50
set sword1=0
set sword2=0
set sword3=0
set sword4=0
set sword5=0
set sword6=0
set sword7=0
set sword8=0
set weapon1=0
set weapon2=0
set armor1=0
set armor2=0
set armor3=0
set armor4=0
set armor5=0
set armor6=0
set armor7=0
set armor8=0
set dchest=0
set gmail=0
set clegs=0
set bufflegs=0
set bfp=0
set dbrain=0
set skin=0
set seeds=0
set fins=0
set cshard=0
set rocks=0
set ocoins=0
set bobst=0
set fangs=0
set pelt=0
set pelt2=0
set zombief=0
set bones=0
set wbones=0
set eskull=0
set gbones=0
set cskull=0
set potiont1=3
set potiont2=0
set potiont3=0
set damage=0
set gcho=--
set cost=--
set Woodcuttingmaxxp=500
set Woodcuttinglvl=1
set Woodcuttingxpleft=500
set Woodcuttingcurxp=0
set miningmaxxp=500
set mininglvl=1
set miningxpleft=500
set miningcurxp=0
set ttlvl=1
set qc1=0
set raidpot=0
set campname=%username1%'s Camp
set levelitm=1
set stormstone=0
set artifacttype=None
set skindAr=N/A
set orb1=0
set key1=0
set key2=0
set key3=0
set key4=0
set weapon3=0
set weapon4=0

set quickitem=none
set spell1=0
set spell2=0
set spell3=0
set spell4=0
set spell5=0
set spell6=0
set spell7=0
set spell8=0
set spell9=0
set spell10=0

set as=Online
goto SAVE_GAME_FILES2


:SAVE_GAME_FILES2
cls
mode con cols=48 lines=35
md %dir_path%
md %dir_path%\save%sv%
(
echo %username1%
echo %password1%
echo %levell%
echo %title%
echo %xpmul%
echo %dmgnpc%
echo %origxp%
echo %hp%
echo %orighp%
echo %damage%
echo %swordchoice%
echo %swordtype%
echo %armortype%
echo %playerxp%
echo %skind%
echo %skindA%
echo %dr%
echo %armtype%
echo %gold%
echo %sword1%
echo %sword2%
echo %sword3%
echo %sword4%
echo %sword5%
echo %sword6%
echo %sword7%
echo %sword8%
echo %weapon1%
echo %weapon2%
echo %armor1%
echo %armor2%
echo %armor3%
echo %armor4%
echo %armor5%
echo %armor6%
echo %armor7%
echo %armor8%
echo %dchest%
echo %gmail%
echo %clegs%
echo %bufflegs%
echo %bfp%
echo %dbrain%
echo %skin%
echo %seeds%
echo %fins%
echo %cshard%
echo %rocks%
echo %ocoins%
echo %bobst%
echo %fangs%
echo %pelt%
echo %pelt2%
echo %zombief%
echo %bones%
echo %wbones%
echo %eskull%
echo %gbones%
echo %cskull%
echo %potiont1%
echo %potiont2%
echo %potiont3%
echo %damage%
echo %gcho%
echo %cost%
echo %Woodcuttingmaxxp%
echo %Woodcuttinglvl%
echo %Woodcuttingxpleft%
echo %Woodcuttingcurxp%
echo %miningmaxxp%
echo %mininglvl%
echo %miningxpleft%
echo %miningcurxp%
echo %ttlvl%
echo %qc1%
echo %raidpot%
echo %campname%
echo %levelitm%
echo %stormstone%
echo %artifacttype%
echo %skindAr%
echo %orb1%
echo %key1%
echo %key2%
echo %key3%
echo %key4%
echo %weapon3%
echo %weapon4%
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
) > %dir_path%\save%sv%\save%sv%.sav
(
echo %as%
echo %color%
) > %dir_path%\save%sv%\settings.ini
(
echo %quickitem%
echo %spell1%
echo %spell2%
echo %spell3%
echo %spell4%
echo %spell5%
echo %spell6%
echo %spell7%
echo %spell8%
echo %spell9%
echo %spell10%
) > %dir_path%\save%sv%\etx_player-cell.pak
cls
mode con cols=48 lines=35
goto MENU

:SAVE_GAME_FILES
set /a counter=0
if %levell% GEQ 225 set /a levell=225
md %dir_path%
md %dir_path%\save%load%
(
echo %username1%
echo %password1%
echo %levell%
echo %title%
echo %xpmul%
echo %dmgnpc%
echo %origxp%
echo %hp%
echo %orighp%
echo %damage%
echo %swordchoice%
echo %swordtype%
echo %armortype%
echo %playerxp%
echo %skind%
echo %skindA%
echo %dr%
echo %armtype%
echo %gold%
echo %sword1%
echo %sword2%
echo %sword3%
echo %sword4%
echo %sword5%
echo %sword6%
echo %sword7%
echo %sword8%
echo %weapon1%
echo %weapon2%
echo %armor1%
echo %armor2%
echo %armor3%
echo %armor4%
echo %armor5%
echo %armor6%
echo %armor7%
echo %armor8%
echo %dchest%
echo %gmail%
echo %clegs%
echo %bufflegs%
echo %bfp%
echo %dbrain%
echo %skin%
echo %seeds%
echo %fins%
echo %cshard%
echo %rocks%
echo %ocoins%
echo %bobst%
echo %fangs%
echo %pelt%
echo %pelt2%
echo %zombief%
echo %bones%
echo %wbones%
echo %eskull%
echo %gbones%
echo %cskull%
echo %potiont1%
echo %potiont2%
echo %potiont3%
echo %damage%
echo %gcho%
echo %cost%
echo %Woodcuttingmaxxp%
echo %Woodcuttinglvl%
echo %Woodcuttingxpleft%
echo %Woodcuttingcurxp%
echo %miningmaxxp%
echo %mininglvl%
echo %miningxpleft%
echo %miningcurxp%
echo %ttlvl%
echo %qc1%
echo %raidpot%
echo %campname%
echo %levelitm%
echo %stormstone%
echo %artifacttype%
echo %skindAr%
echo %orb1%
echo %key1%
echo %key2%
echo %key3%
echo %key4%
echo %counter%
echo %weapon3%
echo %weapon4%
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
echo nul
) > %dir_path%\save%sv%\save%sv%.sav
(
echo %as%
echo %color%
) > %dir_path%\save%sv%\settings.ini
(
echo %quickitem%
echo %spell1%
echo %spell2%
echo %spell3%
echo %spell4%
echo %spell5%
echo %spell6%
echo %spell7%
echo %spell8%
echo %spell9%
echo %spell10%
) > %dir_path%\save%sv%\etx_player-cell.pak
cls
mode con cols=48 lines=35
goto %destination%

// MARK: SELF REPAIR
:repair_files
if not exist %dir_path%\save%sv%\etx_player-cell.pak (
set quickitem=none
set spell1=0
set spell2=0
set spell3=0
set spell4=0
set spell5=0
set spell6=0
set spell7=0
set spell8=0
set spell9=0
set spell10=0
(
echo %quickitem%
echo %spell1%
echo %spell2%
echo %spell3%
echo %spell4%
echo %spell5%
echo %spell6%
echo %spell7%
echo %spell8%
echo %spell9%
echo %spell10%
) > %dir_path%\save%sv%\etx_player-cell.pak
)


if not exist %dir_path%\save%sv%%\settings.ini (
(
echo %as%
echo %color%
) > %dir_path%\save%sv%\settings.ini
)


if not exist %pak_path%\redr_window-client.pak (
(
echo ----------------------------------------------
echo ==============================================
echo ______________________________________________
) > %pak_path%\redr_window-client.pak

)
goto SAVE_GAME_FILES2


// MARK: VARIABLE REPAIR
:VARIABLE_REPAIR
< %dir_path%\save%sv%\save%sv%.sav (
set /p username1=
set /p password1=
set /p levell=
set /p title=
set /p xpmul=
set /p dmgnpc=
set /p origxp=
set /p hp=
set /p orighp=
set /p damage=
set /p swordchoice=
set /p swordtype=
set /p armortype=
set /p playerxp=
set /p skind=
set /p skindA=
set /p dr=
set /p armtype=
set /p gold=
set /p sword1=
set /p sword2=
set /p sword3=
set /p sword4=
set /p sword5=
set /p sword6=
set /p sword7=
set /p sword8=
set /p weapon1=
set /p weapon2=
set /p armor1=
set /p armor2=
set /p armor3=
set /p armor4=
set /p armor5=
set /p armor6=
set /p armor7=
set /p armor8=
set /p dchest=
set /p gmail=
set /p clegs=
set /p bufflegs=
set /p bfp=
set /p dbrain=
set /p skin=
set /p seeds=
set /p fins=
set /p cshard=
set /p rocks=
set /p ocoins=
set /p bobst=
set /p fangs=
set /p pelt=
set /p pelt2=
set /p zombief=
set /p bones=
set /p wbones=
set /p eskull=
set /p gbones=
set /p cskull=
set /p potiont1=
set /p potiont2=
set /p potiont3=
set /p damage=
set /p gcho=
set /p cost=
set /p Woodcuttingmaxxp=
set /p Woodcuttinglvl=
set /p Woodcuttingxpleft=
set /p Woodcuttingcurxp=
set /p miningmaxxp=
set /p mininglvl=
set /p miningxpleft=
set /p miningcurxp=
set /p ttlvl=
set /p qc1=
set /p raidpot=
set /p campname=
set /p levelitm=
set /p stormstone=
set /p artifacttype=
set /p skindAr=
set /p orb1=
set /p key1=
set /p key2=
set /p key3=
set /p key4=
set /p weapon3=
set /p weapon4=
)
< %dir_path%\save%sv%\settings.ini (
set /p as=Online
set /p color=0f
)
< %dir_path%\save%sv%\etx_player-cell.pak (
set /p quickitem=none
set /p spell1=0
set /p spell2=0
set /p spell3=0
set /p spell4=0
set /p spell5=0
set /p spell6=0
set /p spell7=0
set /p spell8=0
set /p spell9=0
set /p spell10=0
)

if "%levell%"=="ECHO is off." set levell=1
if "%levell%"=="nul" set levell=1
if "%levell%"=="" set levell=1
if "%title%"=="ECHO is off." set title=Noob
if "%title%"=="nul" set title=Noob
if "%title%"=="" set title=Noob
if "%xpmul%"=="ECHO is off." set xpmul=1
if "%xpmul%"=="nul" set xpmul=1
if "%xpmul%"=="" set xpmul=1
if "%origxp%"=="ECHO is off." set origxp=500
if "%origxp%"=="nul" set origxp=500
if "%origxp%"=="" set origxp=500
if "%hp%"=="ECHO is off." set hp=100
if "%hp%"=="nul" set hp=100
if "%hp%"=="" set hp=100
if "%orighp%"=="ECHO is off." set orighp=100
if "%orighp%"=="nul" set orighp=100
if "%orighp%"=="" set orighp=100
if "%swordtype%"=="ECHO is off." set swordtype=Your
if "%swordtype%"=="nul" set swordtype=Your
if "%swordtype%"=="" set swordtype=Your
if "%armortype%"=="ECHO is off." set armortype=N/A
if "%armortype%"=="nul" set armortype=N/A
if "%armortype%"=="" set armortype=N/A
if "%playerxp%"=="ECHO is off." set playerxp=0
if "%playerxp%"=="nul" set playerxp=0
if "%playerxp%"=="" set playerxp=0
if "%skind%"=="ECHO is off." set skind=hand
if "%skind%"=="nul" set skind=hand
if "%skind%"=="" set skind=hand
if "%skindA%"=="ECHO is off." set skindA=N/A
if "%skindA%"=="nul" set skindA=N/A
if "%skindA%"=="" set skindA=N/A
if "%gold%"=="ECHO is off." set gold=50
if "%gold%"=="nul" set gold=50
if "%gold%"=="" set gold=50
if "%sword1%"=="ECHO is off." set sword1=0
if "%sword1%"=="nul" set sword1=0
if "%sword1%"=="" set sword1=0
if "%sword2%"=="ECHO is off." set sword2=0
if "%sword2%"=="nul" set sword2=0
if "%sword2%"=="" set sword2=0
if "%sword3%"=="ECHO is off." set sword3=0
if "%sword3%"=="nul" set sword3=0
if "%sword3%"=="" set sword3=0
if "%sword4%"=="ECHO is off." set sword4=0
if "%sword4%"=="nul" set sword4=0
if "%sword4%"=="" set sword4=0
if "%sword5%"=="ECHO is off." set sword5=0
if "%sword5%"=="nul" set sword5=0
if "%sword5%"=="" set sword5=0
if "%sword6%"=="ECHO is off." set sword6=0
if "%sword6%"=="nul" set sword6=0
if "%sword6%"=="" set sword6=0
if "%sword7%"=="ECHO is off." set sword7=0
if "%sword7%"=="nul" set sword7=0
if "%sword7%"=="" set sword7=0
if "%sword8%"=="ECHO is off." set sword8=0
if "%sword8%"=="nul" set sword8=0
if "%sword8%"=="" set sword8=0
if "%weapon1%"=="ECHO is off." set weapon1=0
if "%weapon1%"=="nul" set weapon1=0
if "%weapon1%"=="" set weapon1=0
if "%weapon2%"=="ECHO is off." set weapon2=0
if "%weapon2%"=="nul" set weapon2=0
if "%weapon2%"=="" set weapon2=0
if "%armor1%"=="ECHO is off." set armor1=0
if "%armor1%"=="nul" set armor1=0
if "%armor1%"=="" set armor1=0
if "%armor2%"=="ECHO is off." set armor2=0
if "%armor2%"=="nul" set armor2=0
if "%armor2%"=="" set armor2=0
if "%armor3%"=="ECHO is off." set armor3=0
if "%armor3%"=="nul" set armor3=0
if "%armor3%"=="" set armor3=0
if "%armor4%"=="ECHO is off." set armor4=0
if "%armor4%"=="nul" set armor4=0
if "%armor4%"=="" set armor4=0
if "%armor5%"=="ECHO is off." set armor5=0
if "%armor5%"=="nul" set armor5=0
if "%armor5%"=="" set armor5=0
if "%armor6%"=="ECHO is off." set armor6=0
if "%armor6%"=="nul" set armor6=0
if "%armor6%"=="" set armor6=0
if "%armor7%"=="ECHO is off." set armor7=0
if "%armor7%"=="nul" set armor7=0
if "%armor7%"=="" set armor7=0
if "%armor8%"=="ECHO is off." set armor8=0
if "%armor8%"=="nul" set armor8=0
if "%armor8%"=="" set armor8=0
if "%dchest%"=="ECHO is off." set dchest=0
if "%dchest%"=="nul" set dchest=0
if "%dchest%"=="" set dchest=0
if "%gmail%"=="ECHO is off." set gmail=0
if "%gmail%"=="nul" set gmail=0d
if "%gmail%"=="" set gmail=0
if "%clegs%"=="ECHO is off." set clegs=0
if "%clegs%"=="nul" set clegs=0
if "%clegs%"=="" set clegs=0
if "%bufflegs%"=="ECHO is off." set bufflegs=0
if "%bufflegs%"=="nul" set bufflegs=0
if "%bufflegs%"=="" set bufflegs=0
if "%bfp%"=="ECHO is off." set bfp=0
if "%bfp%"=="nul" set bfp=0
if "%bfp%"=="" set bfp=0
if "%dbrain%"=="ECHO is off." set dbrain=0
if "%dbrain%"=="nul" set dbrain=0
if "%dbrain%"=="" set dbrain=0
if "%skin%"=="ECHO is off." set skin=0
if "%skin%"=="nul" set skin=0
if "%skin%"=="" set skin=0
if "%seeds%"=="ECHO is off." set seeds=0
if "%seeds%"=="nul" set seeds=0
if "%seeds%"=="" set seeds=0
if "%fins%"=="ECHO is off." set fins=0
if "%fins%"=="nul" set fins=0
if "%fins%"=="" set fins=0
if "%cshards%"=="ECHO is off." set cshards=0
if "%cshards%"=="nul" set cshards=0
if "%cshards%"=="" set cshards=0
if "%rocks%"=="ECHO is off." set rocks=0
if "%rocks%"=="nul" set rocks=0
if "%rocks%"=="" set rocks=0
if "%ocoins%"=="ECHO is off." set ocoins=0
if "%ocoins%"=="nul" set ocoins=0
if "%ocoins%"=="" set ocoins=0
if "%bobst%"=="ECHO is off." set bobst=0
if "%bobst%"=="nul" set bobst=0
if "%bobst%"=="" set bobst=0
if "%fangs%"=="ECHO is off." set fangs=0
if "%fangs%"=="nul" set fangs=0
if "%fangs%"=="" set fangs=0
if "%pelt%"=="ECHO is off." set pelt=0
if "%pelt%"=="nul" set pelt=0
if "%pelt%"=="" set pelt=0
if "%pelt2%"=="ECHO is off." set pelt2=0
if "%pelt2%"=="nul" set pelt2=0
if "%pelt2%"=="" set pelt2=0
if "%zombief%"=="ECHO is off." set zombief=0
if "%zombief%"=="nul" set zombief=0
if "%zombief%"=="" set zombief=0
if "%bones%"=="ECHO is off." set bones=0
if "%bones%"=="nul" set bones=0
if "%bones%"=="" set bones=0
if "%wbones%"=="ECHO is off." set wbones=0
if "%wbones%"=="nul" set wbones=0
if "%wbones%"=="" set wbones=0
if "%eskull%"=="ECHO is off." set eskull=0
if "%eskull%"=="nul" set eskull=0
if "%eskull%"=="" set eskull=0
if "%gbones%"=="ECHO is off." set gbones=0
if "%gbones%"=="nul" set gbones=0
if "%gbones%"=="" set gbones=0
if "%cskull%"=="ECHO is off." set cskull=0
if "%cskull%"=="nul" set cskull=0
if "%cskull%"=="" set cskull=0
if "%potiont1%"=="ECHO is off." set potiont1=3
if "%potiont1%"=="nul" set potiont1=3
if "%potiont1%"=="" set potiont1=3
if "%potiont2%"=="ECHO is off." set potiont2=0
if "%potiont2%"=="nul" set potiont2=0
if "%potiont2%"=="" set potiont2=0
if "%potiont3%"=="ECHO is off." set potiont3=0
if "%potiont3%"=="nul" set potiont3=0
if "%potiont3%"=="" set potiont3s=0
if "%Woodcuttingmaxxp%"=="ECHO is off." set Woodcuttingmaxxp=500
if "%Woodcuttingmaxxp%"=="nul" set Woodcuttingmaxxp=500
if "%Woodcuttingmaxxp%"=="" set Woodcuttingmaxxp=500
if "%Woodcuttinglvl%"=="ECHO is off." set Woodcuttinglvl=1
if "%Woodcuttinglvl%"=="nul" set Woodcuttinglvl=1
if "%Woodcuttinglvl%"=="" set Woodcuttinglvl=1
if "%Woodcuttingxpleft%"=="ECHO is off." set Woodcuttingxpleft=500
if "%Woodcuttingxpleft%"=="nul" set Woodcuttingxpleft=500
if "%Woodcuttingxpleft%"=="" set Woodcuttingxpleft=500
if "%Woodcuttingcurxp%"=="ECHO is off." set Woodcuttingcurxp=0
if "%Woodcuttingcurxp%"=="nul" set Woodcuttingcurxp=0
if "%Woodcuttingcurxp%"=="" set Woodcuttingcurxp=0
if "%miningmaxxp%"=="ECHO is off." set miningmaxxp=500
if "%miningmaxxp%"=="nul" set miningmaxxp=500
if "%miningmaxxp%"=="" set miningmaxxp=500
if "%mininglvl%"=="ECHO is off." set mininglvl=1
if "%mininglvl%"=="nul" set mininglvl=1
if "%mininglvl%"=="" set mininglvl=1
if "%miningxpleft%"=="ECHO is off." set miningxpleft=500
if "%miningxpleft%"=="nul" set miningxpleft=500
if "%miningxpleft%"=="" set miningxpleft=500
if "%miningcurxp%"=="ECHO is off." set miningcurxp=0
if "%miningcurxp%"=="nul" set miningcurxp=0
if "%miningcurxp%"=="" set miningcurxp=0
if "%ttlvl%"=="ECHO is off." set ttlvl=1
if "%ttlvl%"=="nul" set ttlvl=1
if "%ttlvl%"=="" set ttlvl=1
if "%qc1%"=="ECHO is off." set qc1=0
if "%qc1%"=="nul" set qc1=0
if "%qc1%"=="" set qc1=0
if "%raidpot%"=="ECHO is off." set raidpot=0
if "%raidpot%"=="nul" set raidpot=0
if "%raidpot%"=="" set raidpot=0
if "%campname%"=="ECHO is off." set campname=%username1%'s Camp
if "%campname%"=="nul" set campname=%username1%'s Camp
if "%campname%"=="" set campname=%username1%'s Camp
if "%levelitm%"=="ECHO is off." set levelitm=1
if "%levelitm%"=="nul" set levelitm=1
if "%levelitm%"=="" set levelitm=1
if "%stormstone%"=="ECHO is off." set stormstone=0
if "%stormstone%"=="nul" set stormstone=0
if "%stormstone%"=="" set stormstone=0
if "%artifacttype%"=="ECHO is off." set artifacttype=none
if "%artifacttype%"=="nul" set artifacttype=none
if "%artifacttype%"=="" set artifacttype=none
if "%skindAr%"=="ECHO is off." set skindAr=N/A
if "%skindAr%"=="nul" set skindAr=N/A
if "%skindAr%"=="" set skindAr=N/A
if "%orb1%"=="ECHO is off." set orb1=0
if "%orb1%"=="nul" set orb1=0
if "%orb1%"=="" set orb1=0
if "%key1%"=="ECHO is off." set key1=0
if "%key1%"=="nul" set key1=0
if "%key1%"=="" set key1=0
if "%key2%"=="ECHO is off." set key2=0
if "%key2%"=="nul" set key2=0
if "%key2%"=="" set key2=0
if "%key3%"=="ECHO is off." set key3=0
if "%key3%"=="nul" set key3=0
if "%key3%"=="" set key3=0
if "%key4%"=="ECHO is off." set key4=0
if "%key4%"=="nul" set key4=0
if "%key4%"=="" set key4=0
if "%weapon3%"=="ECHO is off." set weapon3=0
if "%weapon3%"=="nul" set weapon3=0
if "%weapon3%"=="" set weapon3=0
if "%weapon4%"=="ECHO is off." set weapon4=0
if "%weapon4%"=="nul" set weapon4=0
if "%weapon4%"=="" set weapon4=0

if "%quickitem%"=="ECHO is off." set quickitem=none
if "%quickitem%"=="nul" set quickitem=none
if "%quickitem%"=="" set quickitem=none
if "%spell1%"=="ECHO is off." set spell1=0
if "%spell1%"=="nul" set spell1=0
if "%spell1%"=="" set spell1=0
if "%spell2%"=="ECHO is off." set spell2=0
if "%spell2%"=="nul" set spell2=0
if "%spell2%"=="" set spell2=0
if "%spell3%"=="ECHO is off." set spell3=0
if "%spell3%"=="nul" set spell3=0
if "%spell3%"=="" set spell3=0
if "%spell4%"=="ECHO is off." set spell4=0
if "%spell4%"=="nul" set spell4=0
if "%spell4%"=="" set spell4=0
if "%spell5%"=="ECHO is off." set spell5=0
if "%spell5%"=="nul" set spell5=0
if "%spell5%"=="" set spell5=0
if "%spell6%"=="ECHO is off." set spell6=0
if "%spell6%"=="nul" set spell6=0
if "%spell6%"=="" set spell6=0
if "%spell7%"=="ECHO is off." set spell7=0
if "%spell7%"=="nul" set spell7=0
if "%spell7%"=="" set spell7=0
if "%spell8%"=="ECHO is off." set spell8=0
if "%spell8%"=="nul" set spell8=0
if "%spell8%"=="" set spell8=0
if "%spell9%"=="ECHO is off." set spell9=0
if "%spell9%"=="nul" set spell9=0
if "%spell9%"=="" set spell9=0
if "%spell10%"=="ECHO is off." set spell10=0
if "%spell10%"=="nul" set spell10=0
if "%spell10%"=="" set spell10=0

if "%as%"=="ECHO is off." set as=offline
if "%as%"=="nul" set as=offline
if "%as%"=="" set as=offline
if "%color%"=="ECHO is off." set color=0f
if "%color%"=="nul" set color=0f
if "%color%"=="" set color=0f

goto SAVE_GAME_FILES2



:error404
set errornum=%destination%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo StormTides Critical Faliure
echo Imenent crash inbound
echo %linevar%
echo Current Version: %version%
echo Error code %errornum%
echo.
echo Please contact a StormTides Team
echo Member or report the bug to our
echo website at...
echo kawaiifoox08.wixsite.com/fennix
echo.
echo %linevar%
echo [%s1%] Accept Crash 
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" exit
)
goto startgame





// MARK: Camp
:MENU
title StormTides Byte - Camp
cls
set xpmul=5
if %levell% GEQ 225 set /a levell=225
if %autosave_default% EQU True set as=Online
if %autosave_default% EQU False set as=Offline
if %autosave_default% EQU Neg set as=%as%
set destination=MENU-2
if %as% equ Online goto SAVE_GAME_FILES
:MENU-2
set xpmul=5
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [37m%campname%[0m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Map[0m
echo [%s2%] Weapon Stand[0m
echo [%s3%] Armor Stand[0m
echo [%s4%] Alchemy Stand[0m
echo [%s5%] Inventory[0m
echo [%s6%] Workshop[0m
echo.
echo %linevar%
echo Curently On Save: [37m%Username1%[0m
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto map1
if "%select%"=="2" set select=1&goto weaponstore1
if "%select%"=="3" set select=1&goto armorstore1
if "%select%"=="4" set select=1&goto potionshop
if "%select%"=="5" set select=1&goto selectbag
if "%select%"=="6" goto workshop
)
goto MENU-2
:settings
set backdest=mainmenu
cls
mode con cols=48 lines=35
if %select% gtr 7 set select=1
if %select% lss 1 set select=7
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo GAME SETTINGS
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Command Console[0m
echo [%s2%] Repair Files[0m
echo [%s3%] Change Camp Name[0m
echo [%s4%] Event Codes[0m
echo [%s5%] Auto save toggle [%as%][0m
echo [%s6%] Emergency Return[0m
echo.
echo %linevar%
echo [%s7%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto cmdpre
if "%select%"=="2" set select=1&goto repairmenu
if "%select%"=="3" set select=1&goto renamecamp
if "%select%"=="4" set select=1&goto repair_files
if "%select%"=="5" set select=5&goto autosaveSET
if "%select%"=="6" set select=1&goto er1
if "%select%"=="7" set select=1&goto mainmenu
)
goto settings

:repairmenu
set backdest=settings
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Repair Files
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Repair Game Files[0m
echo [%s2%] Repair Save Files[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto repair_files
if "%select%"=="2" set select=1&goto VARIABLE_REPAIR
if "%select%"=="3" set select=1&goto settings
)
goto repairmenu

:autosaveSET
if %autosave_default% EQU True goto settings
if %autosave_default% EQU False goto settings
if %as% EQU Online set as=Offline&goto settings
if %as% EQU Offline set as=Online&goto settings
goto settings


:er1
echo Are you sure? This will cost you 100 gold.
echo Type "Yes" or "No" to confirm.
set /p er1=
if not defined er1 (
goto er1
)
if %er1% EQU yes goto er2
if %er1% EQU no goto settings
if %er1% EQU Yes goto er2
if %er1% EQU No goto settings
goto er1

:er2
if %gold% GEQ 100 set /a gold=%gold%-100
goto MENU

:redeem
cls
mode con cols=48 lines=35
echo %linevar%
echo To Enter your promo code to redeem
echo Make sure it is the exact same.
echo or type ^"Exit^" to exit.
echo %linevar%
set /p redeem=^> 
if not defined redeem (
goto redeem
)
if %redeem% EQU 22B6stTu5-beta (
if %code1% EQU 0 goto redeem1
if %code1% EQU 1 goto settings
)
if %redeem% EQU 7Bd8J33Kds9-gold-0 goto redeem2
if %redeem% EQU Hfk8d24fkD83-rchest-5 goto redeem3
if %redeem% EQU Jfk3JD84jD3-rchest-10 goto redeem4
if %redeem% EQU Jfo33339fna666-winn goto redeem5
if %redeem% EQU code goto redeem1
if %redeem% EQU exit goto settings
if %redeem% EQU Exit goto settings
goto redeem

:redeem1
set title=Beta_Tester
set /a code1=1
< %pak_path%\arvc_window-client.pak (
set /p code1=
set /p code2=
set /p code3=
set /p code4=
set /p code5=
)
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Code Redeemed!
echo You now have the Beta Tester Title.
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto settings
)
goto redeem1

:redeem2
set /a gold=%gold%+1000
set /a code2=1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Code Redeemed!
echo You got +1000 Gold.
echo You now have %gold% Gold.
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto settings
)
goto redeem2

:redeem3
set /a dchest=%dchest%+5
set /a code3=1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Code Redeemed!
echo You got +5 Dungeon Chests.
echo You now have %dchest% Dungeon Chests.
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto settings
)
goto redeem3

:redeem4
set /a dchest=%dchest%+10
set /a code4=1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Code Redeemed!
echo You got +10 Dungeon Chests.
echo You now have %dchest% Dungeon Chests.
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto settings
)
goto redeem4

:redeem5
set title=[93mLevel_Runner[0m
set /a dchest=%dchest%+12
set /a gold=%gold%+1000
goto settings

:dlc
set backdest=settings
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo GAME SETTINGS - DLC
echo %linevar%
echo.
echo There are no dlcs our currently.
echo We will soon make dlcs in the
echo future.
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:ad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set select=1&goto %backdest%
if "%errorlevel%"=="2" (
if "%select%"=="1" set select=1&goto settings
)
goto dlc

:dlc1
if not exist "C:core\data\dlc\money-pak.dlc" (
echo This Dlc Dose Not Exist In Your Dlc Folder.
pause>nul
goto dlc
)
< C:core\data\dlc\money-pak.dlc (
set /p dlcID=
set /p validID=
)
if not %dlcID% EQU D4xp9Sb2-27jDi99Bd9 (
echo INVALID DLC
pause>nul
goto dlc
)
if not %validID% EQU 274928374892728492829937 (
echo INVALID DLC
pause>nul
goto dlc
)
set /a gold=%gold%+1000
goto dlc



// MARK: Player Win
:win
set destination=win
set /a hp=%orighp%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Congrats Adventurer!
echo %linevar%
echo.
echo You won the battle against the %npcstat% %npctype%.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto MENU
)
goto win


// MARK: Player Die
:die
set destination=die
set /a hp=%orighp%
if %gold% GEQ 15 set /a gold=%gold%-15
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You died... Another one bites the dust...
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto MENU
)
goto die


// MARK: Player Flee
:fleeD
set select=1
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
set destination=fleeD
set /a dchest=%dchest%+5
set /a gold=%gold%+5000
set /a raidpot=%raidpot%+10
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
echo %linevar%
echo You have passed the test of the
echo duck. You shall be rewarded.
echo.
echo +5 Dungeon Chests
echo +5,000 Gold
echo +10 Raid Potions
echo.
echo %linevar%
echo.
echo [[90m#[0m[97m] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto MENU
)
goto fleeD


:flee
set destination=flee
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You flee from the battle...
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto MENU
)
goto flee





:renamecamp
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Camp Name Changer
echo %linevar%
echo.
echo What Would You Like To Name Your Camp?
set /p nc=^> 
if not defined nc (
goto renamecamp
)
set campname=%nc%
echo Done! %nc% is now your camp name
echo [%s1%] Okay
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto mainmenu
)
goto renamecamp

:color
cls
mode con cols=48 lines=35
echo.
echo What would you like to change the color to?
echo.
echo Background                  Text
echo.
echo 0 = Black		8 = Gray
echo 1 = Blue 		9 = Light Blue
echo 2 = Green 		A = Light Green
echo 3 = Aqua 		B = Light Aqua
echo 4 = Red 		C = Light Red
echo 5 = Purple 		D = Light Purple
echo 6 = Yellow 		E = Light Yellow
echo 7 = White 		F = Bright White
echo.
echo Type the color combination you would like.
echo (example: 0f)
echo.
echo Type "9" To Exit.
set /p colorcho=">"
if not defined colorcho (
goto color
)
if %colorcho% EQU 9 goto settings
color %colorcho%
goto color

:cmdpre
cls
mode con cols=48 lines=35
echo %linevar%
echo To Enter the command consle you need to
echo enter a cmd accses code.
echo %linevar%
echo Type "Exit" to exit.
echo.
set /p cmdpre=C:\%Username1%^> 
if not defined cmdpre (
goto cmdpre
)
if %cmdpre% EQU FennixIndi_admin cls
mode con cols=48 lines=35&goto cmdadmin1
if %cmdpre% EQU exit goto settings
if %cmdpre% EQU Exit goto settings
goto cmdpre

:cmdadmin1
set /p cmd=C:\%Username1%^> 
if not defined cmd (
goto cmdadmin1
)
if %cmd% EQU exit goto settings
if %cmd% EQU Exit goto settings
if %cmd% EQU /.help goto help
if %cmd% EQU /.give_gold goto give_goldsetup
if %cmd% EQU /.set_gold goto set_goldsetup
goto cmdadmin1

:help
echo  StomTides Commnd Consle Help.
echo %linevar%
echo.
echo /.give_gold --- Gives a certent amount of gold.
echo /.set_gold --- Sets your gold to a certent amount.
echo.
pause>nul
goto cmdadmin1

:give_goldsetup
echo Please type the amount of gold you
echo would like to add.
echo %linevar%
echo.
set /p give_goldsetup=C:\%Username1%^> 
if not defined give_goldsetup (
cls
mode con cols=48 lines=35
goto give_goldsetup
)
set /a gold=%gold%+%give_goldsetup%
echo You now have %gold% Gold.
goto cmdadmin1

:set_goldsetup
echo Please type the amount of gold you
echo would like to add.
echo %linevar%
echo.
set /p set_goldsetup=C:\%Username1%^> 
if not defined set_goldsetup (
cls
mode con cols=48 lines=35
goto set_goldsetup
)
set /a gold=%set_goldsetup%
echo You now have %gold% Gold.
goto cmdadmin1


// MARK: Sand Beach
:picknpc
title StormTides Byte - Sand Beach
set destination=picknpc
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 14+1
if %npc% EQU 1 set npctype=Goblin
if %npc% EQU 2 set npctype=Crab
if %npc% EQU 3 set npctype=Buff-Lobster
if %npc% EQU 4 set npctype=Fisherman
if %npc% EQU 5 set npctype=Dave
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Farmer
if %npc% EQU 8 set npctype=Land-Fish
if %npc% EQU 9 set npctype=Bouldersssss
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Thief
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat
if %npc% EQU 14 set npctype=Dungeon-Duck

:pickstat
set destination=pickstat
set /a stat=%random% %% 20+1
if %stat% EQU 1 set npcstat=Normal
if %stat% EQU 2 set npcstat=Enraged
if %stat% EQU 3 set npcstat=Strong
if %stat% EQU 4 set npcstat=Tough
if %stat% EQU 5 set npcstat=Weak
if %stat% EQU 6 set npcstat=[31mINVERTED[0m
if %stat% EQU 7 set npcstat=Normal
if %stat% EQU 8 set npcstat=Normal
if %stat% EQU 9 set npcstat=Normal
if %stat% EQU 10 set npcstat=Normal
if %stat% EQU 11 set npcstat=Normal
if %stat% EQU 12 set npcstat=Enraged
if %stat% EQU 13 set npcstat=Strong
if %stat% EQU 14 set npcstat=Tough
if %stat% EQU 15 set npcstat=Weak
if %stat% EQU 16 set npcstat=Normal
if %stat% EQU 17 set npcstat=Enraged
if %stat% EQU 18 set npcstat=Strong
if %stat% EQU 19 set npcstat=Tough
if %stat% EQU 20 set npcstat=Weak
goto BATTLE_VARIABLES


:BATTLE_VARIABLES
set destination=BATTLE_VARIABLES
if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_START
)
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_START
)
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_START
)
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_START
)
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_START
)
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_START
)
if %levell% LEQ 35 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_START
)
if %levell% LEQ 40 (
set /a health=%random% %% 100 + 1025
set /a level=%random% %% 20 + 35
goto F_START
)
if %levell% LEQ 45 (
set /a health=%random% %% 100 + 1150
set /a level=%random% %% 25 + 40
goto F_START
)
if %levell% LEQ 50 (
set /a health=%random% %% 100 + 1275
set /a level=%random% %% 30 + 45
goto F_START
)
if %levell% LEQ 55 (
set /a health=%random% %% 100 + 1400
set /a level=%random% %% 35 + 50
goto F_START
)
if %levell% LEQ 60 (
set /a health=%random% %% 100 + 1525
set /a level=%random% %% 40 + 55
goto F_START
)
if %levell% LEQ 65 (
set /a health=%random% %% 100 + 1650
set /a level=%random% %% 45 + 60
goto F_START
)
if %levell% LEQ 70 (
set /a health=%random% %% 100 + 1775
set /a level=%random% %% 50 + 65
goto F_START
)
if %levell% LEQ 75 (
set /a health=%random% %% 100 + 1900
set /a level=%random% %% 55 + 70
goto F_START
)
if %levell% LEQ 80 (
set /a health=%random% %% 100 + 2025
set /a level=%random% %% 60 + 75
goto F_START
)
if %levell% LEQ 85 (
set /a health=%random% %% 100 + 2150
set /a level=%random% %% 65 + 80
goto F_START
)
if %levell% LEQ 90 (
set /a health=%random% %% 100 + 2275
set /a level=%random% %% 70 + 85
goto F_START
)
if %levell% LEQ 95 (
set /a health=%random% %% 100 + 2400
set /a level=%random% %% 75 + 90
goto F_START
)
if %levell% LEQ 100 (
set /a health=%random% %% 100 + 2525
set /a level=%random% %% 80 + 95
goto F_START
)
if %levell% LEQ 105 (
set /a health=%random% %% 100 + 2650
set /a level=%random% %% 85 + 100
goto F_START
)
if %levell% LEQ 110 (
set /a health=%random% %% 100 + 2875
set /a level=%random% %% 90 + 105
goto F_START
)
if %levell% LEQ 115 (
set /a health=%random% %% 100 + 3100
set /a level=%random% %% 95 + 110
goto F_START
)
if %levell% LEQ 120 (
set /a health=%random% %% 100 + 3225
set /a level=%random% %% 100 + 115
goto F_START
)
if %levell% LEQ 125 (
set /a health=%random% %% 100 + 3350
set /a level=%random% %% 105 + 120
goto F_START
)
if %levell% LEQ 130 (
set /a health=%random% %% 100 + 3475
set /a level=%random% %% 110 + 125
goto F_START
)
if %levell% LEQ 135 (
set /a health=%random% %% 100 + 3600
set /a level=%random% %% 115 + 130
goto F_START
)
if %levell% LEQ 140 (
set /a health=%random% %% 100 + 3725
set /a level=%random% %% 120 + 135
goto F_START
)
if %levell% LEQ 145 (
set /a health=%random% %% 100 + 3850
set /a level=%random% %% 125 + 140
goto F_START
)
if %levell% LEQ 150 (
set /a health=%random% %% 100 + 3975
set /a level=%random% %% 130 + 145
goto F_START
)
if %levell% LEQ 155 (
set /a health=%random% %% 100 + 4200
set /a level=%random% %% 130 + 145
goto F_START
)
if %levell% LEQ 160 (
set /a health=%random% %% 100 + 4325
set /a level=%random% %% 135 + 150
goto F_START
)
if %levell% LEQ 165 (
set /a health=%random% %% 100 + 4450
set /a level=%random% %% 140 + 155
goto F_START
)
if %levell% LEQ 170 (
set /a health=%random% %% 100 + 4575
set /a level=%random% %% 145 + 160
goto F_START
)
if %levell% LEQ 175 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 150 + 165
goto F_START
)
if %levell% LEQ 180 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 155 + 170
goto F_START
)
if %levell% LEQ 185 (
set /a health=%random% %% 100 + 4825
set /a level=%random% %% 160 + 175
goto F_START
)
if %levell% LEQ 190 (
set /a health=%random% %% 100 + 4950
set /a level=%random% %% 165 + 180
goto F_START
)
if %levell% LEQ 195 (
set /a health=%random% %% 100 + 5075
set /a level=%random% %% 170 + 185
goto F_START
)
if %levell% LEQ 200 (
set /a health=%random% %% 100 + 5200
set /a level=%random% %% 175 + 190
goto F_START
)
if %levell% LEQ 205 (
set /a health=%random% %% 100 + 5325
set /a level=%random% %% 180 + 195
goto F_START
)
if %levell% LEQ 210 (
set /a health=%random% %% 100 + 5450
set /a level=%random% %% 185 + 200
goto F_START
)
if %levell% LEQ 215 (
set /a health=%random% %% 100 + 5575
set /a level=%random% %% 190 + 200
goto F_START
)
if %levell% LEQ 220 (
set /a health=%random% %% 100 + 5700
set /a level=%random% %% 195 + 205
goto F_START
)
if %levell% LEQ 225 (
set /a health=%random% %% 100 + 5825
set /a level=%random% %% 200 + 210
goto F_START
)
goto F_START

:F_START
if %npcstat% EQU Tough set /a health=%health%+200
set destination=F_START
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Beach and...
echo encounter a level %level% %npcstat% %npctype%.
echo.
echo %linevar%
pause >nul
goto fs1

:fs1
if %health% LEQ 0 goto checkiflvlup
set destination=fs1
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Quick Item[0m
echo [%s3%] Flee[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atk_choose
if "%select%"=="2" if %npctype% EQU Dungeon-Duck set select=1&goto offer
if "%select%"=="2" if not %npctype% EQU Dungeon-Duck goto quickitem
if "%select%"=="3" set select=1&goto flee
)
goto fs1

:offer
if %health% LEQ 0 goto checkiflvlup
set destination=fs1
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo The Dunegon Duck requires an offering.
echo What shall you slide it's way?
echo [0m
echo [%s1%] Offer 5 Seeds: %seeds%[0m
echo [%s2%] Offer 1,000 Gold: %gold%[0m
echo [%s3%] Surrender[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" if %seeds% GEQ 5 set select=1&goto chance1
if "%select%"=="2" if %gold% GEQ 1000 set select=1&goto chance2
if "%select%"=="3" goto chance3
)
goto offer

:chance1
set /a chance=%random% %% 7+1
if %chance% EQU 1 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 2 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 3 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 4 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 5 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 6 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 7 goto fs3

:chance2
set /a chance=%random% %% 5+1
if %chance% EQU 1 goto fs3
if %chance% EQU 2 goto fs3
if %chance% EQU 3 goto fs3
if %chance% EQU 4 goto fleeD
if %chance% EQU 5 goto fleeD

:chance3
set /a chance=%random% %% 4+1
if %chance% EQU 1 goto fs3
if %chance% EQU 2 goto fs3
if %chance% EQU 3 goto fs3
if %chance% EQU 4 goto fleeD

:atk_choose
if %health% LEQ 0 goto checkiflvlup
set destination=atk_choose
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Main Weapon[0m
echo [%s2%] Tidelink [[31mComing Soon[0m][0m
echo [%s3%] Back[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" goto atk
if "%select%"=="2" goto atk_choose
if "%select%"=="3" goto fs1
)
goto atk_choose

:spell_choose
if %health% LEQ 0 goto checkiflvlup
set destination=spell_choose
cls
mode con cols=48 lines=35
if %select% gtr 10 set select=1
if %select% lss 1 set select=10
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo Basic Spells:
echo [%s1%] Magic Missile [[90mLv. 1+[0m][0m
if %levell% GEQ 5 echo [%s2%] Fiery Missiles [[90mLv. 5+[0m][0m
if %levell% LSS 5 echo [%s2%] ??? [[90mLv. 5+[0m][0m
if %levell% GEQ 10 echo [%s3%] Spirit Wave [[90mLv. 10+[0m][0m
if %levell% LSS 10 echo [%s3%] ??? [[90mLv. 10+[0m][0m
if %levell% GEQ 15 echo [%s4%] Holy Spike [[90mLv. 15+[0m][0m
if %levell% LSS 15 echo [%s4%] ??? [[90mLv. 15+[0m][0m
echo.
echo Uniqge Spells:
if %spell1% GTR 0 echo [%s5%] Lunar Rush[0m
if %spell1% EQU 0 echo [%s5%] ???[0m
if %spell2% GTR 0 echo [%s6%] Carnage Curse[0m
if %spell2% EQU 0 echo [%s6%] ???[0m
if %spell3% GTR 0 echo [%s7%] Pyromania[0m
if %spell3% EQU 0 echo [%s7%] ???[0m
if %spell4% GTR 0 echo [%s8%] Solar Rupture[0m
if %spell4% EQU 0 echo [%s8%] ???[0m
if %spell5% GTR 0 echo [%s9%] Purity Of Energy[0m
if %spell5% EQU 0 echo [%s9%] ???[0m
echo [%s10%] Back[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set /a spell_select=magic_missile&goto atk_spell
if "%select%"=="2" set /a spell_select=fiery_missiles&goto atk_spell
if "%select%"=="3" set /a spell_select=spirit_wave&goto atk_spell
if "%select%"=="4" set /a spell_select=holly_spike&goto atk_spell
if "%select%"=="5" set /a spell_select=lunar_rush&goto atk_spell
if "%select%"=="6" set /a spell_select=carnage_curse&goto atk_spell
if "%select%"=="7" set /a spell_select=pyromania&goto atk_spell
if "%select%"=="8" set /a spell_select=solar_rpture&goto atk_spell
if "%select%"=="9" set /a spell_select=purity_of_energy&goto atk_spell
if "%select%"=="10" goto fs1
)
goto spell_choose

:quickitem
if %quickitem% EQU raidpot (
if %raidpot% LEQ 0 goto fs1
set /a raidpot=%raidpot%-1
set /a hp=%hp%+500
goto fs1
)

:quickitem
if %quickitem% EQU hpot1 (
if %potiont1% LEQ 0 goto fs1
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
goto fs1
)

:quickitem
if %quickitem% EQU hpot2 (
if %potiont2% LEQ 0 goto fs1
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
goto fs1
)

:quickitem
if %quickitem% EQU hpot3 (
if %potiont3% LEQ 0 goto fs1
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
goto fs1
)

if %quickitem% EQU none (
goto fs1
)
set errornum=WANDER-ITEMQ-SB
goto error404

:atk
set destination=atk
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %artifacttype% EQU Storm set /a damage=%damage%+%random%*100/32767+1
if %damage% GTR %health% set /a damage=%health%

:playeratk
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the %npctype%!
echo.
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npcstat% %npctype%^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause >nul
if %health% LEQ 0 goto dropitem
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup
goto fs3
)
goto fs3

:attacknpc
:fs3
set destination=fs3
if %npctype% EQU Rat set /a dmgnpc=%random%*23/32767+1
if %npctype% EQU Goblin set /a dmgnpc=%random%*30/32767+1
if %npctype% EQU Crab set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Buff-Lobster set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Fisherman set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Dave set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*50/32767+1
if %npctype% EQU Farmer set /a dmgnpc=%random%*85/32767+1
if %npctype% EQU Land-Fish set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*111/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Thief set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*360/32767+1
if %npctype% EQU Dungeon-Duck set /a dmgnpc=%random%*20000/32767+1
if %npcstat% EQU if %dmgnpc% GTR 50 Weak set /a dmgnpc=%damage%-50
if %npcstat% EQU if %health% GTR 50 Weak set /a health=%health%-50
if %npcstat% EQU Enraged set /a dmgnpc=%damage%+85
if %npcstat% EQU Strong set /a dmgnpc=%damage%+50
if %npcstat% EQU [31mINVERTED[0m set /a dmgnpc=20000
if %npctype% EQU Dungeon-Duck set npcstat=[31mINVERTED[0m

if %armortype% EQU Steel set /a dmgnpc=%dmgnpc%-8
if %armortype% EQU Titanium set /a  dmgnpc=%dmgnpc%-25
if %armortype% EQU Platinum set /a  dmgnpc=%dmgnpc%-100

if %dmgnpc% LSS 0 set dmgnpc=0

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The %npcstat% %npctype% attacks you...
echo And %npcstat% %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause >nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup
goto fs1
)
goto fs1



:checkiflvlup
set destination=checkiflvlup
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup
)



:dropitem
set destination=dropitem
if %npctype% EQU Goblin goto goblindrop
if %npctype% EQU Crab goto Crabdrop
if %npctype% EQU Buff-Lobster goto Buff-Lobsterdrop
if %npctype% EQU Fisherman goto Fishermandrop
if %npctype% EQU Dave goto Davedrop
if %npctype% EQU Human goto humandrop
if %npctype% EQU Farmer goto farmerdrop
if %npctype% EQU Land-Fish goto Land-Fishdrop
if %npctype% EQU Boulder goto Boulderdrop
if %npctype% EQU Corrupted goto Corrupteddrop
if %npctype% EQU Thief goto Thiefdrop
if %npctype% EQU Bob goto Bobdrop
if %npctype% EQU Rat goto Land-Fishdrop

::set /a gmail=%gmail%+1
:goblindrop
set destination=golbindrop
set word=1
set drop=Goblin Mail
set /a gmail=%gmail%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+100
goto winSB

:Crabdrop
set destination=Crabdrop
set word=3
set drop=Crab Legs
set /a clegs=%clegs%+3
set /a gold=%gold%+2
set /a qc1=%qc1%+1
set /a playerxp=%playerxp%+122
goto winSB

:Buff-Lobsterdrop
set destination=Buff-Lobsterdrop
set word=1
set drop=Buff-Lobster Claws
set /a bufflegs=%bufflegs%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+100
goto winSB

:Fishermandrop
set destination=Fishermandrop
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+122
goto winSB

:Davedrop
set destination=Davedrop
set word=1
set drop=Dave Brain fragment
set /a dbrain=%dbrain%+1
set /a gold=%gold%+7
set /a playerxp=%playerxp%+300
goto winSB

:humandrop
set destination=humandrop
set word=1
set drop=Human Skin
set /a skin=%skin%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+150
goto winSB

:farmerdrop
set destination=farmerdrop
set word=3
set drop=Seeds
set /a seeds=%seeds%+3
set /a gold=%gold%+1
set /a playerxp=%playerxp%+20
goto winSB

:Land-Fishdrop
set destination=Land-Fishdrop
set word=1
set drop=Fish Fins
set /a fins=%fins%+1
set /a gold=%gold%+2
set /a playerxp=%playerxp%+10
goto winSB

:Boulderdrop
set destination=Boulderdrop
set word=3
set drop=Rocks
set /a rocks=%rocks%+3
set /a gold=%gold%+7
set /a playerxp=%playerxp%+100
goto winSB

:Corrupteddrop
set destination=Corrupteddrop
set word=1
set drop=Corrupted Shard
set /a cshard=%cshard%+1
set /a gold=%gold%+10
set /a playerxp=%playerxp%+250
goto winSB

:Thiefdrop
set destination=Thiefdrop
set word=2
set drop=Old Coins
set /a ocoins=%ocoins%+2
set /a gold=%gold%+25
set /a playerxp=%playerxp%+100
goto winSB

:Bobdrop
set destination=Bobdrop
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
set /a gold=%gold%+50
set /a playerxp=%playerxp%+285
goto winSB


:levelup
set destination=levelup-2
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+100
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelup-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllv
)
goto levelup-2

:winSB
set destination=winSB
set /a hp=%orighp%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Congrats Adventurer!
echo %linevar%
echo.
echo You won the battle against the %npcstat% %npctype%.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto picknpc
)
goto winSB

:testllv
if %health% LEQ 0 goto test2
goto fs1
:test2
if %levell% LEQ 10 goto dropitem
if NOT %levell% LEQ 10 goto fs1
goto dropitem

// MARK: Map
:map1
title StormTides Byte - Map
set destination=map1
set backdest=MENU
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo The Map Of StormTides
echo %linevar%
echo Please choose a destination on the map
echo [0m
echo Fighting Locations
echo [%s1%] Wanders[0m
echo [%s2%] Dungeons[0m
echo [%s3%] Raids[31m[Coming Soon][0m
echo.
echo Travel Locations
echo [%s4%] Towns[0m
echo [%s5%] Special Locations[0m
echo %linevar%
echo [%s6%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto wanders
if "%select%"=="2" set select=1&goto dungeons
if "%select%"=="3" goto map1
if "%select%"=="4" set select=1&goto towns
if "%select%"=="6" set select=1&goto MENU
)
goto map1

:dungeons
title StormTides Byte - Dungeons
set destination=map4
set backdest=map1
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Dungeons
echo %linevar%
echo Please choose a destination on the map
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Domain Of The Corrupted Lv.20+[0m
echo [%s2%] The Deep Dark Lv.45+[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %levell% GEQ 20 set select=1&goto raidnpc1
if "%select%"=="2" if %levell% GEQ 45 set select=1&goto raidnpc1-2
if "%select%"=="3" set select=1&goto map1
)
goto dungeons

:raids
title StormTides Byte - Raids
set destination=map5
set backdest=map1
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Map Of Mythical Raids of Olex
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Mythics Domain Lv.60+: %key1%[0m
echo [%s2%] Spiral Of Corrupted Lv.75+ %key2%[0m
echo [%s3%] The Hive Mind Lv.90+ %key3%[0m
echo [%s4%] Lost Champion Lv.100 %key4%[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto testMR1
if "%select%"=="2" set select=1&goto testMR2
if "%select%"=="3" set select=1&goto map5
if "%select%"=="4" set select=1&goto map5
if "%select%"=="5" set select=1&goto map1
)
goto raids


:wanders
title StormTides Byte - Wanders
set destination=map2
set backdest=map1
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Wanders
echo %linevar%
echo Please choose a destination on the map
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Sand Beach Lv.1+[0m
echo [%s2%] Creepy Crypt Lv.10+[0m
echo [%s3%] Odd Crypt Lv.30+[0m
echo.
echo %linevar%
echo [%s4%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %levell% GEQ 1 set select=1&goto picknpc
if "%select%"=="2" if %levell% GEQ 10 set select=1&goto picknpc2
if "%select%"=="3" if %levell% GEQ 30 set select=1&goto picknpc3
if "%select%"=="4" set select=1&goto map1
)
goto wanders

:towns
title StormTides Byte - Towns
set destination=map3
set backdest=map1
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Towns
echo %linevar%
echo Please choose a destination on the map
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Krelbay Lv.5[0m
echo [%s2%] Solace Lv.25[0m
echo [%s3%] Mystic Grove Lv.75[0m
echo [%s4%] Winterfell Lv.150[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %levell% GEQ 5 set select=1&goto town1
if "%select%"=="2" if %levell% GEQ 25 set select=1&goto town2
if "%select%"=="3" if %levell% GEQ 75 set select=1&goto town3
if "%select%"=="4" if %levell% GEQ 150 set select=1&goto town4
if "%select%"=="5" set select=1&goto map1
)
goto towns

// MARK: Inventory
:selectbag
title StormTides Byte - Inventory
set destination=selectbag
set backdest=MENU
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [37m%username1%[0m's Stats - Title: [37m%title%[0m
echo %linevar%
echo Health: %hp%/%orighp%
echo Level: %levell%
echo EXP: %playerxp%/%origxp%
echo Gold: $%gold%
echo.
if %swordtype% EQU Necrosis echo Weapon: Necrosis
if not %swordtype% EQU Necrosis echo Weapon: %swordtype% %skind%
if %armortype% EQU N/A echo Armor: None
if not %armortype% EQU N/A echo Armor: %armortype% %skindA%
if %skindAr% EQU N/A echo Artifact: None
if not %skindAr% EQU N/A echo Artifact: %artifacttype% %skindAr%
echo.
echo Xp Multiplier: %xpmul%x
echo %linevar%
echo Select Bag.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Backpack[0m
echo [%s2%] Raid Pouch[0m
echo [%s3%] Material Pouch[0m
echo [%s4%] Quick Item[0m
echo [%s5%] Catalog [[31mComing Soon[0m][0m
echo.
echo %linevar%
echo [%s6%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto checkitems
if "%select%"=="2" set select=1&goto checkitemsP3
if "%select%"=="3" set select=1&goto checkitemsP2
if "%select%"=="4" set select=1&goto quickselect
if "%select%"=="5" set select=1&goto selectbag
if "%select%"=="6" set select=1&goto MENU
)
goto selectbag

:catalog
set destination=catalog
set backdest=selectbag
cls
mode con cols=48 lines=35
set /a swordcount=%sword1%+%sword2%+%sword3%+%sword4%+%sword5%+%sword6%+%sword7%+%sword8%+%weapon1%+%weapon2%
set /a armorcount=%armor1%+%armor2%+%armor3%+%armor4%+%armor5%+%armor6%+%armor7%+%armor8%
set /a materialcount=
set /a totalcount=%swordcount%+%armorcount%
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Catalog.
echo %linevar%
echo Total Items Discovered:
echo %totalcount%/18
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Weapons[0m
echo [%s2%] Armor[0m
echo [%s3%] Materials[0m
echo [%s4%] Consumables[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" goto page1
if "%select%"=="2" goto page2
if "%select%"=="3" goto page3
if "%select%"=="4" goto page4
if "%select%"=="5" set select=1&goto selectbag
)
goto catalog

:page1
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Weapon
echo %linevar2%
echo.
echo %swordcount%/10 Collected
echo.
if %sword1% GTR 0 echo [[90mX[0m] Plastic Sword
if %sword1% EQU 0 echo [[90m-[0m] ???
if %sword2% GTR 0 echo [[90mX[0m] Old Dagger
if %sword2% EQU 0 echo [[90m-[0m] ???
if %sword3% GTR 0 echo [[90mX[0m] Refurbished Glave
if %sword3% EQU 0 echo [[90m-[0m] ???
if %sword4% GTR 0 echo [[90mX[0m] Battle Staff
if %sword4% EQU 0 echo [[90m-[0m] ???
if %sword5% GTR 0 echo [[90mX[0m] Poison Shank
if %sword5% EQU 0 echo [[90m-[0m] ???
if %sword6% GTR 0 echo [[90mX[0m] Strong Katana
if %sword6% EQU 0 echo [[90m-[0m] ???
if %sword7% GTR 0 echo [[90mX[0m] Sharp Dagger
if %sword7% EQU 0 echo [[90m-[0m] ???
if %sword8% GTR 0 echo [[90mX[0m] Warriors Staff
if %sword8% EQU 0 echo [[90m-[0m] ???
if %weapon1% GTR 0 echo [[90mX[0m] Shadow Striker
if %weapon1% EQU 0 echo [[90m-[0m] ???
if %weapon2% GTR 0 echo [[90mX[0m] Necrosis
if %weapon2% EQU 0 echo [[90m-[0m] ???
if %weapon3% GTR 0 echo [[90mX[0m] Souls Edge
if %weapon3% EQU 0 echo [[90m-[0m] ???
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto catalog
)
goto page1

:page2
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo %armorcount%/8 Collected
echo.
if %armor1% GTR 0 echo [[90mX[0m] Leather Tunic
if %armor1% EQU 0 echo [[90m-[0m] ???
if %armor2% GTR 0 echo [[90mX[0m] Hide Armor
if %armor2% EQU 0 echo [[90m-[0m] ???
if %armor3% GTR 0 echo [[90mX[0m] Steel Armor
if %armor3% EQU 0 echo [[90m-[0m] ???
if %armor4% GTR 0 echo [[90mX[0m] Scale Set
if %armor4% EQU 0 echo [[90m-[0m] ???
if %armor5% GTR 0 echo [[90mX[0m] Furr Suit
if %armor5% EQU 0 echo [[90m-[0m] ???
if %armor6% GTR 0 echo [[90mX[0m] Titanium Armor
if %armor6% EQU 0 echo [[90m-[0m] ???
if %armor7% GTR 0 echo [[90mX[0m] Tungsten Set
if %armor7% EQU 0 echo [[90m-[0m] ???
if %armor8% GTR 0 echo [[90mX[0m] Platinum Set
if %armor8% EQU 0 echo [[90m-[0m] ???
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto catalog
)
goto page2

:page3
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Materials
echo %linevar2%
echo.
echo %materialcount%/21 Collected
echo.
if %gmail% GTR 0 echo [[90mx[0m] Goblin Mail
if %gmail% EQU 0 echo [[90m-[0m] ???
if %clegs% GTR 0 echo [[90mx[0m] Crab Legs
if %clegs% EQU 0 echo [[90m-[0m] ???
if %bufflegs% GTR 0 echo [[90mx[0m] Buff-Lobster Legs
if %bufflegs% EQU 0 echo [[90m-[0m] ???
if %bfp% GTR 0 echo [[90mx[0m] Broken Fishing Pole
if %bfp% EQU 0 echo [[90m-[0m] ???
if %dbrain% GTR 0 echo [[90mx[0m] Dave Brain Fragment
if %dbrain% EQU 0 echo [[90m-[0m] ???
if %skin% GTR 0 echo [[90mx[0m] Human Skin
if %skin% EQU 0 echo [[90m-[0m] ???
if %seeds% GTR 0 echo [[90mx[0m] Seeds
if %seeds% EQU 0 echo [[90m-[0m] ???
if %fins% GTR 0 echo [[90mx[0m] Fish Fins
if %fins% EQU 0 echo [[90m-[0m] ???
if %rocks% GTR 0 echo [[90mx[0m] Rocks
if %rocks% EQU 0 echo [[90m-[0m] ???
if %cshard% GTR 0 echo [[90mx[0m] Corrupted Shards
if %cshard% EQU 0 echo [[90m-[0m] ???
if %ocoins% GTR 0 echo [[90mx[0m] Old Coins
if %ocins% EQU 0 echo [[90m-[0m] ???
if %bobst% GTR 0 echo [[90mx[0m] Bobs Tear
if %bobst% EQU 0 echo [[90m-[0m] ???
if %fangs% GTR 0 echo [[90mx[0m] Spider Fangs
if %fangs% EQU 0 echo [[90m-[0m] ???
if %pelt2% GTR 0 echo [[90mx[0m] Pelt
if %pelt2% EQU 0 echo [[90m-[0m] ???
if %pelt% GTR 0 echo [[90mx[0m] Mutant Pelt
if %pelt% EQU 0 echo [[90m-[0m] ???
if %zombief% GTR 0 echo [[90mx[0m] Mutant Pelt
if %zombief% EQU 0 echo [[90m-[0m] ???
if %bones% GTR 0 echo [[90mx[0m] Bones
if %bones% EQU 0 echo [[90m-[0m] ???
if %wbones% GTR 0 echo [[90mx[0m] Weak Bones
if %wbones% EQU 0 echo [[90m-[0m] ???
if %eskull% GTR 0 echo [[90mx[0m] Enchanted Skull
if %eskull% EQU 0 echo [[90m-[0m] ???
if %gbones% GTR 0 echo [[90mx[0m] Giants Bone
if %gbones% EQU 0 echo [[90m-[0m] ???
if %cbones% GTR 0 echo [[90mx[0m] Corrupted Skull
if %cbones% EQU 0 echo [[90m-[0m] ???
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto catalog
)
goto page3

:quickselect
set destination=quickselect
set backdest=selectbag
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Quick Select.
echo %linevar%
if %quickitem% EQU hpot1 echo Current Selection: Health Potion T1
if %quickitem% EQU hpot2 echo Current Selection: Health Potion T2
if %quickitem% EQU hpot3 echo Current Selection: Health Potion T3
if %quickitem% EQU raidpot echo Current Selection: Raid Health Elixer
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Health Potion T1 - 25: %potiont1%[0m
echo [%s2%] Health Potion T2 - 50: %potiont2%[0m
echo [%s3%] Health Potion T3 - 100: %potiont3%[0m
echo [%s4%] Raid Health Elixer: %raidpot%[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" goto quickselect1
if "%select%"=="2" goto quickselect2
if "%select%"=="3" goto quickselect3
if "%select%"=="4" goto quickselect4
if "%select%"=="5" set select=1&goto selectbag
)
goto quickselect

:quickselect1
set quickitem=hpot1
goto quickselect

:quickselect2
set quickitem=hpot2
goto quickselect

:quickselect3
set quickitem=hpot3
goto quickselect

:quickselect4
set quickitem=raidpot
goto quickselect

:checkitems
set destination=checkitems
set backdest=selectbag
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Backpack.
echo %linevar%
echo.
if %potiont1% GTR 0 echo Health Potion T1 - 25: %potiont1%
if %potiont2% GTR 0 echo Health Potion T2 - 50: %potiont2%
if %potiont3% GTR 0 echo Health Potion T3 - 100: %potiont3%
echo.
if %sword1% GTR 0 echo Plastic Sword: %sword1%
if %sword2% GTR 0 echo Old Dagger: %sword2%
if %sword3% GTR 0 echo Refurbished Glave: %sword3%
if %sword4% GTR 0 echo Battle Staff: %sword4%
if %sword5% GTR 0 echo Poison Shank: %sword5%
if %sword6% GTR 0 echo Storng Katana: %sword6%
if %sword7% GTR 0 echo Sharp Dagger: %sword7%
if %sword8% GTR 0 echo Warriors Staff: %sword8%
echo.
if %weapon1% GTR 0 echo Shadow Striker: %weapon1%
if %weapon2% GTR 0 echo Necrosis: %weapon2%
echo.
if %armor1% GTR 0 echo Leather Tunic: %armor1%
if %armor2% GTR 0 echo Hide Armor: %armor2%
if %armor3% GTR 0 echo Steel Armor: %armor3%
if %armor4% GTR 0 echo Scale Set: %armor4%
if %armor5% GTR 0 echo Furr Suit: %armor5%
if %armor6% GTR 0 echo Titanium Armor: %armor6%
if %armor7% GTR 0 echo Tungsten Set: %armor7%
if %armor8% GTR 0 echo Platinum Set: %armor8%
echo.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Heal[0m
echo [%s2%] Inspect Weapons[0m
echo [%s3%] Inspect Armor[0m
echo.
echo %linevar%
echo [%s4%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto healmenu
if "%select%"=="2" set select=1&goto weaponselect
if "%select%"=="3" set select=1&goto armorselect
if "%select%"=="4" set select=1&goto selectbag
)
goto checkitems

:checkitemsP2
set destination=checkitemsP2
set backdest=selectbag
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Material Pouch.
echo %linevar%
echo.
if %gmail% GTR 0 echo Goblin Mail: %gmail%
if %clegs% GTR 0 echo Crab Legs: %clegs%
if %bufflegs% GTR 0 echo Buff-Lobster Legs: %bufflegs%
if %bfp% GTR 0 echo Broken Fishing Pole: %bfp%
if %dbrain% GTR 0 echo Dave Brain Fragment: %dbrain%
if %skin% GTR 0 echo Human Skin: %skin%
if %seeds% GTR 0 echo Seeds: %seeds%
if %fins% GTR 0 echo Fish Fins: %fins%
if %rocks% GTR 0 echo Rocks: %rocks%
if %cshard% GTR 0 echo Corrupted Shards: %cshard%
if %ocoins% GTR 0 echo Old Coins: %ocoins%
if %bobst% GTR 0 echo Bobs Tear: %bobst%
if %fangs% GTR 0 echo Spider Fangs: %fangs%
if %pelt2% GTR 0 echo Pelt: %pelt2%
if %pelt% GTR 0 echo Mutant Pelt: %pelt%
if %zombief% GTR 0 echo Mutant Pelt: %zombief%
if %bones% GTR 0 echo Bones: %bones%
if %wbones% GTR 0 echo Weak Bones: %wbones%
if %eskull% GTR 0 echo Enchanted Skull: %eskull%
if %gbones% GTR 0 echo Giants Bone: %gbones%
if %cskull% GTR 0 echo Corrupted Skull: %cbones%
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:ad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set select=1&goto %backdest%
if "%errorlevel%"=="2" (
if "%select%"=="1" set select=1&goto selectbag
)
goto checkitemsP2

:checkitemsP3
set destination=checkitemsP3
set backdest=selectbag
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Raid Pouch.
echo %linevar%
echo.
if %dchest% GTR 0 echo Dungeon Chest: %dchest%
if %raidpot% GTR 0 echo Raid Health Elixer: %raidpot%
if %stormstone% GTR 0 echo Storm Stone: %stormstone%
if %key1% GTR 0 echo Normal Mythic Raid Map: %key1%
if %key2% GTR 0 echo Strong Mythic Raid Map: %key2%
if %key3% GTR 0 echo Tough Mythic Raid Map: %key3%
if %key4% GTR 0 echo [31mEnraged[0m Mythic Raid Map: %key4%
if %orb1% GTR 0 echo Max Health Orb: %orb1%
echo [0m
echo %linevar%
echo [%s1%] Open Items[0m
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto openitems
if "%select%"=="2" set select=1&goto selectbag
)
goto checkitemsP3

:openitems
set destination=openitems
set backdest=checkitemsP3
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
if %dchest% GTR 0 echo [%s1%] Open Dungeon Chest: %dchest%[0m
if %dchest% EQU 0 echo [%s1%] ???: %dchest%[0m
if %stormstone% GTR 0 echo [%s2%] Storm Stone: %stormstone%[0m
if %stormstone% EQU 0 echo [%s2%] ???: %dstormstone%[0m
if %orb1% GTR 0 echo [%s3%] Max Health Orb: %orb1%[0m
if %orb1% EQU 0 echo [%s3%] ???: %orb1%[0m
echo.
echo %linevar%
echo [%s4%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %dchest% GEQ 1 set select=1&goto openitems1
if "%select%"=="2" if %stormstone% GEQ 1 set select=1&goto openitems2
if "%select%"=="3" if %orb1% GEQ 1 set select=1&goto openitems3
if "%select%"=="4" set select=1&goto checkitemsP3
)
goto openitems

:openitems2
if %stormstone% EQU 0 goto noitem
if %artifacttype% EQU Storm goto alreadyon
set artifacttype=Storm
set skindAr=Stone
:openitems2-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have equipped a %artifacttype% %skindAr%.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsP3
)
goto openitems2INV-2

:openitems3
if %orb1% EQU 0 goto noitem
set /a orb1=%orb1%-1
set /a orighp=%orighp%+25
:openitems3-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You now haave a max HP of...
echo %orighp%!
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsP3
)
goto openitems2INV-2

:alreadyon
echo You Already have that artifact equipped...
pause>nul
goto openitems

:openitems1
if %dchest% EQU 0 goto noitem
set /a dchest=%dchest%-1
set /a loot1=%random% %% 6+1
if %loot1% EQU 1 goto loot1
if %loot1% EQU 2 goto loot2
if %loot1% EQU 3 goto loot3
if %loot1% EQU 4 goto loot4
if %loot1% EQU 5 goto loot5
if %loot1% EQU 6 goto loot6

:loot1
set destination=loot1
set /a gold=%gold%+1520
set /a dbrain=%dbrain%+1
set /a bobst=%bobst%+2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +1520 gold
echo +1 Dave Brain Fragment
echo +2 Bobs Tears
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitems
)
goto loot1

:loot2
set destination=loot2
set /a gold=%gold%+250
set /a dbrain=%dbrain%+12
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +250 gold
echo +12 Dave Brain Fragments
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitems
)
goto loot2

:loot3
set destination=loot3
set /a gold=%gold%+50
set /a cshard=%cshard%+27
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +50 gold
echo +27 Corrupted Shards
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitems
)
goto loot3

:loot4
set destination=loot4
set /a gold=%gold%+3225
set /a rocks=%rocks%+11
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +3225 gold
echo +11 Rocks
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitems
)
goto loot4

:loot5
set destination=loot5
set /a dbrain=%dbrain%+12
set /a eskull=%eskull%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +12 Dave Brain Fragments
echo +1 Enchanted Skull
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitems
)
goto loot5

:loot6
set destination=loot6
set /a raidpot=%raidpot%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +1 Raid Health Elixer
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitems
)
goto loot6

:noitem
echo You do not have that item...
pause>nul
goto openitems

:weaponselect
set destination=weaponselect
set backdest=checkitems
cls
mode con cols=48 lines=35
if %select% gtr 13 set select=1
if %select% lss 1 set select=13
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
set s11=-
set s12=-
set s13=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
if %sword1% GTR 0 echo [%s1%] Plastic Sword: %sword1%[0m
if %sword1% EQU 0 echo [%s1%] ???: %sword1%[0m
if %sword2% GTR 0 echo [%s2%] Old Dagger: %sword2%[0m
if %sword2% EQU 0 echo [%s2%] ???: %sword2%[0m
if %sword3% GTR 0 echo [%s3%] Refurbished Glave: %sword3%[0m
if %sword3% EQU 0 echo [%s3%] ???: %sword3%[0m
if %sword4% GTR 0 echo [%s4%] Battle Staff: %sword4%[0m
if %sword4% EQU 0 echo [%s4%] ???: %sword4%[0m
if %sword5% GTR 0 echo [%s5%] Poison Shank: %sword5%[0m
if %sword5% EQU 0 echo [%s5%] ???: %sword5%[0m
if %sword6% GTR 0 echo [%s6%] Strong Katana: %sword6%[0m
if %sword6% EQU 0 echo [%s6%] ???: %sword6%[0m
if %sword7% GTR 0 echo [%s7%] Sharp Dagger: %sword7%[0m
if %sword7% EQU 0 echo [%s7%] ???: %sword7%[0m
if %sword8% GTR 0 echo [%s8%] Warriors Staff: %sword8%[0m
if %sword8% EQU 0 echo [%s8%] ???: %sword8%[0m
if %weapon1% GTR 0 echo [%s9%] Shadow Striker: %weapon1%[0m
if %weapon1% EQU 0 echo [%s9%] ???: %weapon1%[0m
if %weapon2% GTR 0 echo [%s10%] Necrosis: %weapon2%[0m
if %weapon2% EQU 0 echo [%s10%] ???: %weapon2%[0m
if %weapon3% GTR 0 echo [%s11%] Souls Edge: %weapon3%[0m
if %weapon3% EQU 0 echo [%s11%] ???: %weapon3%[0m
if %weapon3% GTR 0 echo [%s12%] Omnipresent: %weapon4%[0m
if %weapon3% EQU 0 echo [%s12%] ???: %weapon4%[0m
echo.
echo %linevar%
echo [%s13%] Back
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %sword1% GTR 0 set select=1&goto inspect1
if "%select%"=="2" if %sword2% GTR 0 set select=1&goto inspect2
if "%select%"=="3" if %sword3% GTR 0 set select=1&goto inspect3
if "%select%"=="4" if %sword4% GTR 0 set select=1&goto inspect4
if "%select%"=="5" if %sword5% GTR 0 set select=1&goto inspect5
if "%select%"=="6" if %sword6% GTR 0 set select=1&goto inspect6
if "%select%"=="7" if %sword7% GTR 0 set select=1&goto inspect7
if "%select%"=="8" if %sword8% GTR 0 set select=1&goto inspect8
if "%select%"=="9" if %weapon1% GTR 0 set select=1&goto inspect9
if "%select%"=="10" if %weapon2% GTR 0 set select=1&goto inspect10
if "%select%"=="11" if %weapon3% GTR 0 set select=1&goto inspect11
if "%select%"=="12" if %weapon4% GTR 0 set select=1&goto inspect12
if "%select%"=="13" set select=1&goto checkitems
)
goto weaponselect
:inspect1
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Plastic Sword ^| Bought Item
echo Max Damage: 100
echo Level Required: 1+
echo Class: Mele
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect1

:inspect2
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Old Dagger ^| Bought Item
echo.
echo Max Damage: 118
echo Level Required: 1+
echo Class: Mele
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips2
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect2

:inspect3
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Refurbished Glave ^| Bought Item
echo.
echo Max Damage: 145
echo Level Required: 2+
echo Class: Mele
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips3
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect3

:inspect4
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Battle Staff ^| Bought Item
echo.
echo Max Damage: 180
echo Level Required: 5+
echo Class: Mage
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips4
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect4

:inspect5
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Poison Shank ^| Bought Item
echo.
echo Max Damage: 230
echo Level Required: 10+
echo Class: Mele
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips5
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect5

:inspect6
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Strong Katana ^| Bought Item
echo.
echo Max Damage: 280
echo Level Required: 20+
echo Class: Stealth
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips6
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect6

:inspect7
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Sharp Dagger ^| Bought Item
echo.
echo Max Damage: 310
echo Level Required: 25+
echo Class: Mele
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips7
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect7

:inspect8
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Warriors Staff ^| Bought Item
echo Class: Mele
echo.
echo Max Damage: 325
echo Level Required: 30+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips8
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect8

:inspect9
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Shadow Striker ^| Crafted Item
echo.
echo Max Damage: 375
echo Level Required: 100+
echo Class: Stealth
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips9
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect9

:inspect10
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Necrosis ^| Crafted Item
echo.
echo Max Damage: 450
echo Level Required: 125+
echo Class: Tank
echo.
echo Special Features: 
echo - Heals you every swing.
echo - +5 Max Hp per swing in a raid.
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips10
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect10

:inspect11
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Souls Edge ^| Crafted Item
echo.
echo Max Damage: 800
echo Level Required: 150+
echo Class: Mele
echo.
echo Special Features: 
echo - Consumes your health to use
echo - Drains health from opponents
echo Bonus Stats:
echo - + 100 Max Hp
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips10
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect11

:inspect12
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons
echo %linevar2%
echo.
echo Omnipresent ^| ???
echo.
echo Max Damage: 500
echo Level Required: 175+
echo Class: Mele
echo.
echo Special Features: 
echo - Can hit twice
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips10
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect12

:equips1
set destination=equips1
if %sword1% EQU 0 goto nosword
if %swordtype% EQU Plastic goto alreadyequip
set swordtype=Plastic
set skind=Sword
set aan=a
goto confirmequip

:equips2
set destination=equips2
if %sword2% EQU 0 goto nosword
if %swordtype% EQU Old goto alreadyequip
set swordtype=Old
set skind=Dagger
set aan=a
goto confirmequip

:equips3
set destination=equips3
if %sword3% EQU 0 goto nosword
if %swordtype% EQU Refurbished goto alreadyequip
if %levell% LSS 2 goto nolevel
set swordtype=Refurbished
set skind=Glave
set aan=a
goto confirmequip

:equips4
set destination=equips4
if %sword4% EQU 0 goto nosword
if %swordtype% EQU Battle goto alreadyequip
if %levell% LSS 5 goto nolevel
set swordtype=Battle
set skind=Staff
set aan=a
goto confirmequip

:equips5
set destination=equips5
if %sword5% EQU 0 goto nosword
if %swordtype% EQU Gold goto alreadyequip
if %levell% LSS 10 goto nolevel
set swordtype=Poison
set skind=Shank
set aan=a
goto confirmequip

:equips6
set destination=equips6
if %sword6% EQU 0 goto nosword
if %swordtype% EQU Strong goto alreadyequip
if %levell% LSS 20 goto nolevel
set swordtype=Strong
set skind=Katana
set aan=a
goto confirmequip

:equips7
set destination=equips7
if %sword7% EQU 0 goto nosword
if %swordtype% EQU Sharp goto alreadyequip
if %levell% LSS 25 goto nolevel
set swordtype=Sharp
set skind=Dagger
set aan=a
goto confirmequip

:equips8
set destination=equips8
if %sword8% EQU 0 goto nosword
if %swordtype% EQU Warriors goto alreadyequip
if %levell% LSS 30 goto nolevel
set swordtype=Warriors
set skind=Staff
set aan=a
goto confirmequip

:equips9
set destination=equips9
if %weapon1% EQU 0 goto nosword
if %swordtype% EQU Shadow goto alreadyequip
if %levell% LSS 100 goto nolevel
set swordtype=Shadow
set skind=Striker
set aan=a
goto confirmequip

:equips10
set destination=equips10
if %weapon2% EQU 0 goto nosword
if %swordtype% EQU Necrosis goto alreadyequip
if %levell% LSS 125 goto nolevel
set swordtype=Necrosis
set skind=
set aan=a
goto confirmequip

:equips11
set destination=equips11
if %weapon3% EQU 0 goto nosword
if %swordtype% EQU Souls goto alreadyequip
if %levell% LSS 150 goto nolevel
set swordtype=Souls
set skind=Edge
set aan=a
goto confirmequip

:confirmequip
set destination=confirmequip
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have equipped %aan% %swordtype% %skind%.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto confirmequip

:nosword
set destination=nosword
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't have that weapon.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto nosword


:alreadyequip
set destination=alreadyequip
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You already have that weapon equipped.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitems
)
goto alreadyequip

:nolevel
set destination=nolevel
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't meet the  level.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto checkitems
)
goto nolevel

:armorselect
set destination=armorselect
set backdest=checkitems
cls
mode con cols=48 lines=35
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You currentlyly have a %armortype% %skindA% equipped.
echo %linevar%
echo Select a sword to equip.
echo [0m
if %armor1% GTR 0 echo [%s1%] Leather Tunic: %armor1%[0m
if %armor1% EQU 0 echo [%s1%] ???: %armor1%[0m
if %armor2% GTR 0 echo [%s2%] Hide Armor: %armor2%[0m
if %armor2% EQU 0 echo [%s2%] ???: %armor2%[0m
if %armor3% GTR 0 echo [%s3%] Steel Armor: %armor3%[0m
if %armor3% EQU 0 echo [%s3%] ???: %armor3%[0m
if %armor4% GTR 0 echo [%s4%] Scale Set: %armor4%[0m
if %armor4% EQU 0 echo [%s4%] ???: %armor1%[0m
if %armor5% GTR 0 echo [%s5%] Furr Suit: %armor5%[0m
if %armor5% EQU 0 echo [%s5%] ???: %armor5%[0m
if %armor6% GTR 0 echo [%s6%] Titanium Armor: %armor6%[0m
if %armor6% EQU 0 echo [%s6%] ???: %armor6%[0m
if %armor7% GTR 0 echo [%s7%] Tungsten Set: %armor7%[0m
if %armor7% EQU 0 echo [%s7%] ???: %armor7%[0m
if %armor8% GTR 0 echo [%s8%] Platinum Set %armor8%[0m
if %armor8% EQU 0 echo [%s8%] ???: %armor8%[0m
echo.
echo %linevar%
echo [%s9%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %armor1% GTR 0 set select=1&goto inspect1A
if "%select%"=="2" if %armor2% GTR 0 set select=1&goto inspect2A
if "%select%"=="3" if %armor3% GTR 0 set select=1&goto inspect3A
if "%select%"=="4" if %armor4% GTR 0 set select=1&goto inspect4A
if "%select%"=="5" if %armor5% GTR 0 set select=1&goto inspect5A
if "%select%"=="6" if %armor6% GTR 0 set select=1&goto inspect6A
if "%select%"=="7" if %armor7% GTR 0 set select=1&goto inspect7A
if "%select%"=="8" if %armor8% GTR 0 set select=1&goto inspect8A
if "%select%"=="9" set select=1&goto checkitems
)
goto armorselect

// MARK: WORK
:inspect1A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Leather Tunic ^| Bought Item
echo Type: Light Armor
echo Class: Newbie
echo Level Required: 1+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect1A

:inspect2A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Hide Armor ^| Bought Item
echo Type: Light Armor
echo Class: Archer
echo Level Required: 1+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips2A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect2A

:inspect3A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Steel Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 2+
echo.
echo Special Features: 
echo - Tough: -8 Npc Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips3A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect3A

:inspect4A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Scale Set ^| Bought Item
echo Type: Normal
echo Class: Mage
echo Level Required: 5+
echo.
echo Special Features: None
echo Bonus Stats:
echo - Enchanted: +5 Point Damage Addition
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips4A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect4A

:inspect5A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Fur Suit ^| Bought Item
echo Type: Heavy Armor
echo Class: ???
echo Level Required: 10+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect6A

:inspect6A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Titanium Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 20+
echo.
echo Special Features:
echo - Tough: -25 Npc Damage Reduction
echo - Slowness: -5 Point Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips6A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect6A

:inspect7A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Tungsten Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 25+
echo.
echo Special Features:
echo - Tough: -50 Npc Damage Reduction
echo - Slowness: -10 Point Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips7A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect7A


:inspect8A
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^| Armor
echo %linevar2%
echo.
echo Platinum Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 35+
echo.
echo Special Features:
echo - Tough: -100 Npc Damage Reduction
echo - Slowness: -50 Point Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips8A
if "%select%"=="2" set select=1&goto armorselect
)
goto inspect8A


:equips1A
set destination=equips1A
if %armor1% EQU 0 goto noarmorA
if %armortype% EQU Cardbord goto alreadyequipA
set armortype=Leather
set skindA=Tunic
set aan=a
goto confirmequipA

:equips2A
set destination=equips2A
if %armor2% EQU 0 goto noarmorA
if %armortype% EQU Hide goto alreadyequipA
set armortype=Hide
set skindA=Armor
set aan=a
goto confirmequipA

:equips3A
set destination=equips3A
if %armor3% EQU 0 goto noarmorA
if %armortype% EQU Steel goto alreadyequipA
set armortype=Steel
set skindA=Armor
set aan=a
goto confirmequipA

:equips4A
set destination=equips4A
if %armor4% EQU 0 goto noarmorA
if %armortype% EQU Scale goto alreadyequipA
set armortype=Scale
set skindA=Set
set aan=a
goto confirmequipA

:equips5A
set destination=equips5A
if %armor5% EQU 0 goto noarmorA
if %armortype% EQU Furr goto alreadyequipA
set armortype=Furr
set skindA=Suit
set aan=a
goto confirmequipA

:equips6A
set destination=equips6A
if %armor6% EQU 0 goto noarmorA
if %armortype% EQU Titanium goto alreadyequipA
set armortype=Titanium
set skindA=Armor
set aan=a
goto confirmequipA

:equips7A
set destination=equips7A
if %armor7% EQU 0 goto noarmorA
if %armortype% EQU Set goto alreadyequipA
set armortype=Tungsten
set skindA=Set
set aan=a
goto confirmequipA

:equips8A
set destination=equips8A
if %armor8% EQU 0 goto noarmorA
if %armortype% EQU Armor goto alreadyequipA
set armortype=Platinum
set skindA=Set
set aan=a
goto confirmequipA

:confirmequipA
set destination=confirmequipA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have equipped %aan% %armortype% %skindA%.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitems
)
goto confirmequipA

:noarmorA
set destination=noarmorA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't have that armor.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitems
)
goto noarmorA


:alreadyequipA
set destination=alreadyequipA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You already have that armor equipped.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitems
)
goto alreadyequipA

:healmenu
set destination=healmenu
set backdest=checkitems
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Health Potion Selection.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Health Potion T1 - 25: %potiont1%[0m
echo [%s2%] Health Potion T2 - 50: %potiont2%[0m
echo [%s3%] Health Potion T3 - 100: %potiont3%[0m
echo.
echo [%s4%] Raid Health Elixer: %raidpot%[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
echo.
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto heal1-2
if "%select%"=="2" set select=1&goto heal2-2
if "%select%"=="3" set select=1&goto heal3-2
if "%select%"=="4" set select=1&goto healraiddd
if "%select%"=="5" set select=1&goto checkitems
)
goto healmenu

:heal1-2
if %potiont1% LEQ 0 goto howugh
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
:heal1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Health Potion T1 and got...
echo +25 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenu
)
goto heal1

:heal2-2
if %potiont2% LEQ 0 goto howugh
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
:heal2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Health Potion T2 and got...
echo +50 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenu
)
goto heal2

:heal3-2
if %potiont3% LEQ 0 goto howugh
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
:heal3
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Health Potion T3 and got...
echo +100 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenu
)
goto heal3

:healraiddd
if %raidpot% LEQ 0 goto howugh
set /a raidpot=%raidpot%-1
set /a hp=%hp%+500
:healraidd
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Raid Health Elixer and got...
echo +500 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenu
)
goto healraidd

:howugh
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You do not have that potion...
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenu
)
goto howugh

// MARK: Weapon Store
:weaponstore1
title StormTides Byte - Weapon Stand
set destination=weaponstore1
set backdest=MENU
cls
mode con cols=48 lines=35
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You Curently Have %gold% Gold.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Plastic Sword - 50 gold ^| [[90mLv.1+[0m][0m
echo [%s2%] Old Dagger - 115 gold ^| [[90mLv.1+[0m][0m
echo [%s3%] Refurbished Glave - 380 gold ^| [[90mLv.2+[0m][0m
echo [%s4%] Battle Staff - 800 gold ^| [[90mLv.5+[0m][0m
echo [%s5%] Poison Shank - 1,200 gold ^| [[90mLv.10+[0m][0m
echo [%s6%] Strong Katana - 1,815 gold ^| [[90mLv.20+[0m][0m
echo [%s7%] Sharp Dagger - 2,000 gold ^| [[90mLv.25+[0m][0m
echo [%s8%] Warriors Staff - 2,300 gold ^| [[90mLv.30+[0m][0m
echo.
echo Weapon Store Pg.1
echo %linevar%
echo [%s9%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="9" set select=1&goto MENU
if "%select%"=="1" set select=1& (
set /a sprice=50
set swordchoice=Plastic
set swordchoice2=Sword
set /a att=100
set levelneeded=1
goto buyw1 )
if "%select%"=="2" set select=1& (
set /a sprice=115
set swordchoice=Old
set swordchoice2=Dagger
set /a att=118
set levelneeded=1
goto buyw2 )
if "%select%"=="3" set select=1& (
set /a sprice=380
set swordchoice=Refurbished
set swordchoice2=Glave
set /a att=145
set levelneeded=2
goto buyw3 )
if "%select%"=="4" set select=1& (
set /a sprice=800
set swordchoice=Battle
set swordchoice2=Staff
set /a att=180
set levelneeded=5
goto buyw4 )
if "%select%"=="5" set select=1& (
set /a sprice=1200
set swordchoice=Poison
set swordchoice2=Shank
set /a att=230
set levelneeded=10
goto buyw5 )
if "%select%"=="6" set select=1& (
set /a sprice=1815
set swordchoice=Storng
set swordchoice2=Katana
set /a att=280
set levelneeded=20
goto buyw6 )
if "%select%"=="7" set select=1& (
set /a sprice=2000
set swordchoice=Sharp
set swordchoice2=Dagger
set /a att=310
set levelneeded=25
goto buyw7 )
if "%select%"=="8" set select=1& (
set /a sprice=2300
set swordchoice=Warriors
set swordchoice2=Staff
set /a att=325
set levelneeded=35
goto buyw8 )
goto buynow
)
goto weaponstore1

:buyw1
set destination=buyw1
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword1=%sword1%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw1

:buyw2
set destination=buyw2
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword2=%sword2%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw2

:buyw3
set destination=buyw3
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword3=%sword3%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw3

:buyw4
set destination=buyw4
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword4=%sword4%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw4

:buyw5
set destination=buyw5
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword5=%sword5%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw5

:buyw6
set destination=buyw6
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword6=%sword6%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw6

:buyw7
set destination=buyw7
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword7=%sword7%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw7

:buyw8
set destination=buyw8
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword8=%sword8%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw8







:nogold
set destination=nogold
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't have enough gold to buy this.
echo %linevar%
echo You should come back when you are not poor
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto nogold

:NOTHIGHENOUGHLEVELTOBUY
set destination=NOTHIGHENOUGHLEVELTOBUY
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You are not a high enough level to buy this item.
echo %linevar%------
echo You need to be at least level %levelneeded%.
echo Come back when you are level %levelneeded%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto NOTHIGHENOUGHLEVELTOBUY

:potionshop
title StormTides Byte - Alchemy Stand
set destination=potionshop
set backdest=MENU
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You Curently Have %gold% gold.
echo %linevar%
echo Alchemy Stand!
echo [0m
echo [%s1%] Health Potion T1 - 25 Health - 20 gold[0m
echo [%s2%] Health Potion T2 - 50 Health - 58 gold[0m
echo [%s3%] Health Potion T3 - 100 Health - 135 gold[0m
echo.
echo %linevar%
echo [%s4%] Back[0m
if "%msplash%"=="y" echo.
choice /c:ad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set select=1&goto %backdest%
if "%errorlevel%"=="2" (
if "%select%"=="1" set select=1&goto buyp1
if "%select%"=="2" set select=1&goto buyp2
if "%select%"=="3" set select=1&goto buyp3
if "%select%"=="4" set select=1&goto MENU
)
goto potionshop

:buyp1
set destination=buyp1
if %gold% LSS 20 goto nogoldp
set /a gold=%gold%-20
set /a potiont1=%potiont1%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Health Potion T1 purchased.
echo %linevar%
echo You can use it to heal after or in battle!
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto potionshop
)
goto buyp1

:buyp2
set destination=buyp2
if %gold% LSS 58 goto nogoldp
set /a gold=%gold%-58
set /a potiont2=%potiont2%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Health Potion T2 purchased.
echo %linevar%
echo You can use it to heal after or in battle!
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto potionshop
)
goto buyp2

:buyp3
set destination=buyp3
if %gold% LSS 135 goto nogoldp
set /a gold=%gold%-135
set /a potiont3=%potiont3%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Health Potion T3 purchased.
echo %linevar%
echo You can use it to heal after or in battle!
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto potionshop
)
goto buyp3


:nogoldp
set destination=nogoldp
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't have enough gold to buy this.
echo %linevar%
echo You should come back when you are not poor
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto potionshop
)
goto nogoldp

// MARK: Armor Store
:armorstore1
title StormTides Byte - Armor Stand
set destination=armorstore1
set backdest=MENU
cls
mode con cols=48 lines=35
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You Curently Have %gold% gold.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Leather Tunic - 45 gold ^| [[90mLv.1+[0m][0m
echo [%s2%] Hide Armor - 135 gold ^| [[90mLv.1+[0m][0m
echo [%s3%] Steel Armor - 380 gold ^| [[90mLv.2+[0m][0m
echo [%s4%] Scale Set - 830 gold ^| [[90mLv.5+[0m][0m
echo [%s5%] Furr Suit - 1,500 gold ^| [[90mLv.10+[0m][0m
echo [%s6%] Titanium Armor - 2,458 gold ^| [[90mLv.20+[0m][0m
echo [%s7%] Tungsten Set - 2,900 gold ^| [[90mLv.25+[0m][0m
echo [%s8%] Platinum Set - 3,880 gold ^| [[90mLv.35+[0m][0m
echo.
echo Armor Store Pg.1
echo %linevar%
echo [%s9%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1& (
set /a sprice=45
set armorchoice=Cardbord
set armorchoice2=Armor
set /a hpp=25
set levelneeded=1
goto buyw1A )
if "%select%"=="2" set select=1& (
set /a sprice=135
set armorchoice=Hide
set armorchoice2=Armor
set /a hpp=45
set levelneeded=1
goto buyw2A )
if "%select%"=="3" set select=1& (
set /a sprice=380
set armorchoice=Steel
set armorchoice2=Armor
set /a hpp=54
set levelneeded=2
goto buyw3A )
if "%select%"=="4" set select=1& (
set /a sprice=830
set armorchoice=Scale
set armorchoice2=Set
set /a hpp=80
set levelneeded=5
goto buyw4A )
if "%select%"=="5" set select=1& (
set /a sprice=1500
set armorchoice=Furr
set armorchoice2=Suit
set /a hpp=125
set levelneeded=10
goto buyw5A )
if "%select%"=="6" set select=1& (
set /a sprice=2458
set armorchoice=Titanium
set armorchoice2=Amror
set /a hpp=225
set levelneeded=20
goto buyw6A )
if "%select%"=="7" set select=1& (
set /a sprice=2900
set armorchoice=Tungsten
set armorchoice2=Set
set /a hpp=310
set levelneeded=25
goto buyw7A )
if "%select%"=="8" set select=1& (
set /a sprice=3880
set armorchoice=Platinum
set armorchoice2=Set
set /a hpp=345
set levelneeded=35
goto buyw8A )
if "%select%"=="9" set select=1&goto MENU
)
goto armorstore1

:buyw1A
set destination=buyw1A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor1=%armor1%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Defence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw1A

:buyw2A
set destination=buyw2A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor2=%armor2%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw2A

:buyw3A
set destination=buyw3A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor3=%armor3%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw3A

:buyw4A
set destination=buyw4A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor4=%armor4%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw4A

:buyw5A
set destination=buyw5A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor5=%armor5%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw5A

:buyw6A
set destination=buyw6A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor6=%armor6%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw6A

:buyw7A
set destination=buyw7A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor7=%armor7%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw7A

:buyw8A
set destination=buyw8A
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUYA
if %gold% LSS %sprice% goto nogoldA
set /a gold=%gold%-%sprice%
set /a armor8=%armor8%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %armorchoice% %armorchoice2% purchased.
echo You have a Deffence bonus of up to %hpp% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto buyw8A







:nogoldA
set destination=nogoldA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't have enough gold to buy this.
echo %linevar%
echo You should come back when you are not poor
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto nogoldA

:NOTHIGHENOUGHLEVELTOBUYA
set destination=NOTHIGHENOUGHLEVELTOBUYA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You are not a high enough level to buy this item.
echo %linevar%------
echo You need to be at least level %levelneeded%.
echo Come back when you are level %levelneeded%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto armorstore1
)
goto NOTHIGHENOUGHLEVELTOBUYA


// MARK: Creepy Crypt
:picknpc2
title StormTides Byte - Creepy Crypt
set destination=picknpc2
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 14+1
if %npc% EQU 1 set npctype=Giant-Spider
if %npc% EQU 2 set npctype=Mutant-Wolf
if %npc% EQU 3 set npctype=Wolf
if %npc% EQU 4 set npctype=John
if %npc% EQU 5 set npctype=Bear
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Mites
if %npc% EQU 8 set npctype=Zombie-Chiken
if %npc% EQU 9 set npctype=Boulder
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Thief
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat
if %npc% EQU 14 set npctype=Dungeon-Duck

:pickstat
set destination=pickstat
set /a stat=%random% %% 20+1
if %stat% EQU 1 set npcstat=Normal
if %stat% EQU 2 set npcstat=Enraged
if %stat% EQU 3 set npcstat=Strong
if %stat% EQU 4 set npcstat=Tough
if %stat% EQU 5 set npcstat=Weak
if %stat% EQU 6 set npcstat=[31mINVERTED[0m
if %stat% EQU 7 set npcstat=Normal
if %stat% EQU 8 set npcstat=Normal
if %stat% EQU 9 set npcstat=Normal
if %stat% EQU 10 set npcstat=Normal
if %stat% EQU 11 set npcstat=Normal
if %stat% EQU 12 set npcstat=Enraged
if %stat% EQU 13 set npcstat=Strong
if %stat% EQU 14 set npcstat=Tough
if %stat% EQU 15 set npcstat=Weak
if %stat% EQU 16 set npcstat=Normal
if %stat% EQU 17 set npcstat=Enraged
if %stat% EQU 18 set npcstat=Strong
if %stat% EQU 19 set npcstat=Tough
if %stat% EQU 20 set npcstat=Weak

:BATTLE_VARIABLES2
if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_START2
)
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_START2
)
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_START2
)
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_START2
)
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_START2
)
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_START2
)
if %levell% LEQ 35 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_START2
)
if %levell% LEQ 40 (
set /a health=%random% %% 100 + 1025
set /a level=%random% %% 20 + 35
goto F_START2
)
if %levell% LEQ 45 (
set /a health=%random% %% 100 + 1150
set /a level=%random% %% 25 + 40
goto F_START2
)
if %levell% LEQ 50 (
set /a health=%random% %% 100 + 1275
set /a level=%random% %% 30 + 45
goto F_START2
)
if %levell% LEQ 55 (
set /a health=%random% %% 100 + 1400
set /a level=%random% %% 35 + 50
goto F_START2
)
if %levell% LEQ 60 (
set /a health=%random% %% 100 + 1525
set /a level=%random% %% 40 + 55
goto F_START2
)
if %levell% LEQ 65 (
set /a health=%random% %% 100 + 1650
set /a level=%random% %% 45 + 60
goto F_START2
)
if %levell% LEQ 70 (
set /a health=%random% %% 100 + 1775
set /a level=%random% %% 50 + 65
goto F_START2
)
if %levell% LEQ 75 (
set /a health=%random% %% 100 + 1900
set /a level=%random% %% 55 + 70
goto F_START2
)
if %levell% LEQ 80 (
set /a health=%random% %% 100 + 2025
set /a level=%random% %% 60 + 75
goto F_START2
)
if %levell% LEQ 85 (
set /a health=%random% %% 100 + 2150
set /a level=%random% %% 65 + 80
goto F_START2
)
if %levell% LEQ 90 (
set /a health=%random% %% 100 + 2275
set /a level=%random% %% 70 + 85
goto F_START2
)
if %levell% LEQ 95 (
set /a health=%random% %% 100 + 2400
set /a level=%random% %% 75 + 90
goto F_START2
)
if %levell% LEQ 100 (
set /a health=%random% %% 100 + 2525
set /a level=%random% %% 80 + 95
goto F_START2
)
if %levell% LEQ 105 (
set /a health=%random% %% 100 + 2650
set /a level=%random% %% 85 + 100
goto F_START2
)
if %levell% LEQ 110 (
set /a health=%random% %% 100 + 2875
set /a level=%random% %% 90 + 105
goto F_START2
)
if %levell% LEQ 115 (
set /a health=%random% %% 100 + 3100
set /a level=%random% %% 95 + 110
goto F_START2
)
if %levell% LEQ 120 (
set /a health=%random% %% 100 + 3225
set /a level=%random% %% 100 + 115
goto F_START2
)
if %levell% LEQ 125 (
set /a health=%random% %% 100 + 3350
set /a level=%random% %% 105 + 120
goto F_START2
)
if %levell% LEQ 130 (
set /a health=%random% %% 100 + 3475
set /a level=%random% %% 110 + 125
goto F_START2
)
if %levell% LEQ 135 (
set /a health=%random% %% 100 + 3600
set /a level=%random% %% 115 + 130
goto F_START2
)
if %levell% LEQ 140 (
set /a health=%random% %% 100 + 3725
set /a level=%random% %% 120 + 135
goto F_START2
)
if %levell% LEQ 145 (
set /a health=%random% %% 100 + 3850
set /a level=%random% %% 125 + 140
goto F_START2
)
if %levell% LEQ 150 (
set /a health=%random% %% 100 + 3975
set /a level=%random% %% 130 + 145
goto F_START2
)
if %levell% LEQ 155 (
set /a health=%random% %% 100 + 4200
set /a level=%random% %% 130 + 145
goto F_START2
)
if %levell% LEQ 160 (
set /a health=%random% %% 100 + 4325
set /a level=%random% %% 135 + 150
goto F_START2
)
if %levell% LEQ 165 (
set /a health=%random% %% 100 + 4450
set /a level=%random% %% 140 + 155
goto F_START2
)
if %levell% LEQ 170 (
set /a health=%random% %% 100 + 4575
set /a level=%random% %% 145 + 160
goto F_START2
)
if %levell% LEQ 175 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 150 + 165
goto F_START2
)
if %levell% LEQ 180 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 155 + 170
goto F_START2
)
if %levell% LEQ 185 (
set /a health=%random% %% 100 + 4825
set /a level=%random% %% 160 + 175
goto F_START2
)
if %levell% LEQ 190 (
set /a health=%random% %% 100 + 4950
set /a level=%random% %% 165 + 180
goto F_START2
)
if %levell% LEQ 195 (
set /a health=%random% %% 100 + 5075
set /a level=%random% %% 170 + 185
goto F_START2
)
if %levell% LEQ 200 (
set /a health=%random% %% 100 + 5200
set /a level=%random% %% 175 + 190
goto F_START2
)
if %levell% LEQ 205 (
set /a health=%random% %% 100 + 5325
set /a level=%random% %% 180 + 195
goto F_START2
)
if %levell% LEQ 210 (
set /a health=%random% %% 100 + 5450
set /a level=%random% %% 185 + 200
goto F_START2
)
if %levell% LEQ 215 (
set /a health=%random% %% 100 + 5575
set /a level=%random% %% 190 + 200
goto F_START2
)
if %levell% LEQ 220 (
set /a health=%random% %% 100 + 5700
set /a level=%random% %% 195 + 205
goto F_START2
)
if %levell% LEQ 225 (
set /a health=%random% %% 100 + 5825
set /a level=%random% %% 200 + 210
)
goto F_START2

:F_START2
if %npcstat% EQU Tough set /a health=%health%+200
set destination=F_START2
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Crypt and...
echo encounter a level %npcstat% %level% %npctype%.
echo.
echo %linevar%
pause >nul
if %npcstat% equ Quick goto fs3-2
goto fs1-2


:fs1-2
if %health% LEQ 0 goto checkiflvlup2
set destination=fs1-2
set backdest=map2
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo.
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Quick Item[0m
echo [%s3%] Flee[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atk_choose-2
if "%select%"=="2" if %npctype% EQU Dungeon-Duck set select=1&goto offer2
if "%select%"=="2" if not %npctype% EQU Dungeon-Duck goto quickitem-2
if "%select%"=="3" set select=1&goto flee
)
goto fs1-2

:offer2
if %health% LEQ 0 goto checkiflvlup
set destination=fs1
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo The Dunegon Duck requires an offering.
echo What shall you slide it's way?
echo [0m
echo [%s1%] Offer 5 Seeds: %seeds%[0m
echo [%s2%] Offer 1,000 Gold: %gold%[0m
echo [%s3%] Surrender[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" if %seeds% GEQ 5 set select=1&goto chance12
if "%select%"=="2" if %gold% GEQ 1000 set select=1&goto chance22
if "%select%"=="3" goto chance32
)
goto offer2

:chance12
set /a chance=%random% %% 7+1
if %chance% EQU 1 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 2 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 3 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 4 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 5 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 6 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 7 goto fs3-2

:chance22
set /a chance=%random% %% 5+1
if %chance% EQU 1 goto fs3-2
if %chance% EQU 2 goto fs3-2
if %chance% EQU 3 goto fs3-2
if %chance% EQU 4 goto fs3-2
if %chance% EQU 5 goto fleeD

:chance32
set /a chance=%random% %% 4+1
if %chance% EQU 1 goto fs3-2
if %chance% EQU 2 goto fs3-2
if %chance% EQU 3 goto fs3-2
if %chance% EQU 4 goto fleeD

:atk_choose-2
if %health% LEQ 0 goto checkiflvlup
set destination=atk_choose-2
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Main Weapon[0m
echo [%s2%] Spellbook [[31mComing Soon[0m][0m
echo [%s3%] Back[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" goto atk2
if "%select%"=="2" goto atk_choose-2
if "%select%"=="3" goto fs1-2
)
goto atk_choose-2

:quickitem-2
if %quickitem% EQU raidpot (
if %raidpot% LEQ 0 goto fs1-2
set /a raidpot=%raidpot%-1
set /a hp=%hp%+500
goto fs1-2
)

:quickitem-2
if %quickitem% EQU hpot1 (
if %potiont1% LEQ 0 goto fs1-2
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
goto fs1-2
)

:quickitem-2
if %quickitem% EQU hpot2 (
if %potiont2% LEQ 0 goto fs1-2
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
goto fs1-2
)

:quickitem-2
if %quickitem% EQU hpot3 (
if %potiont3% LEQ 0 goto fs1-2
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
goto fs1-2
)

if %quickitem% EQU none (
goto fs1-2
)
set errornum=WANDER-ITEMQ-SB
goto error404


:atk2
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
set destination=atk2
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %artifacttype% EQU Storm set /a damage=%damage%+%random%*100/32767+1
if %damage% GTR %health% set /a damage=%health%

if %damage% LSS 0 set /a damage=0
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the %npcstat% %npctype%!
echo.
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npcstat% %npctype%^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause>nul
if %health% LEQ 0 goto dropitem2
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup2
goto fs1-2
)
goto fs1-2


:fs3-2
set destination=fs3-2
if %npctype% EQU Rat set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Giant-Spider set /a dmgnpc=%random%*68/32767+1
if %npctype% EQU Mutant-Wolf set /a dmgnpc=%random%*65/32767+1
if %npctype% EQU Wolf set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU John set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Bear set /a dmgnpc=%random%*110/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Mites set /a dmgnpc=%random%*105/32767+1
if %npctype% EQU Zombie-Chiken set /a dmgnpc=%random%*98/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*155/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*380/32767+1
if %npctype% EQU Thief set /a dmgnpc=%random%*325/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*415/32767+1
if %npctype% EQU Dungeon-Duck set /a dmgnpc=%random%*10000/32767+1
if %npcstat% EQU if %dmgnpc% GTR 50 Weak set /a dmgnpc=%damage%-50
if %npcstat% EQU if %health% GTR 50 Weak set /a health=%health%-50
if %npcstat% EQU Enraged set /a dmgnpc=%damage%+85
if %npcstat% EQU Strong set /a dmgnpc=%damage%+50
if %npcstat% EQU [31mINVERTED[0m set /a dmgnpc=20000
if %npctype% EQU Dungeon-Duck set npcstat=[31mINVERTED[0m

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The %npcstat% %npctype% attacks.
echo The %npcstat% %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup2
goto fs1-2
)
goto fs1-2


:checkiflvlup2
set destination=checkiflvlup2
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup2
)




:dropitem2
set destination=dropitem2
if %npctype% EQU Giant-Spider goto Giant-Spiderdrop2
if %npctype% EQU Mutant-Wolf goto Mutant-Wolfdrop2
if %npctype% EQU Wolf goto Wolfdrop2
if %npctype% EQU John goto Johndrop2
if %npctype% EQU Bear goto Beardrop2
if %npctype% EQU Human goto humandrop2
if %npctype% EQU Mites goto Mitesdrop2
if %npctype% EQU Zombie-Chiken goto Zombie-Chikendrop2
if %npctype% EQU Boulder goto Boulderdrop2
if %npctype% EQU Corrupted goto Corrupteddrop2
if %npctype% EQU Thief goto Thiefdrop2
if %npctype% EQU Bob goto Bobdrop2
if %npctype% EQU Rat goto Zombie-Chikendrop2

::set /a gmail=%gmail%+1
:Giant-Spiderdrop2
set destination=Giant-Spiderdrop2
set word=1
set drop=Spider Fang
set /a fangs=%fangs%+1
set /a playerxp=%playerxp%+100
goto winCC

:Mutant-Wolfdrop2
set destination=Mutant-Wolfdrop2
set word=1
set drop=Mutant Pelt
set /a pelt=%pelt%+1
set /a playerxp=%playerxp%+111
goto winCC

:Wolfdrop2
set destination=Wolfdrop2
set word=2
set drop=Pelts
set /a pelt2=%pelt2%+2
set /a playerxp=%playerxp%+50
goto winCC

:Johndrop2
set destination=Johndrop2
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
set /a playerxp=%playerxp%+50
goto winCC

:Beardrop2
set destination=Beardrop2
set word=3
set drop=pelt
set /a pelt2=%pelt2%+3
set /a playerxp=%playerxp%+78
goto winCC

:humandrop2
set destination=humandrop2
set word=1
set drop=Human Skin
set /a skin=%skin%+1
set /a playerxp=%playerxp%+100
goto winCC

:Mitesdrop2
set destination=Mitesdrop2
set word=1
set drop= Seed
set /a seeds=%seeds%+1
set /a playerxp=%playerxp%+1
goto winCC

:Zombie-Chikendrop2
set destination=Zombie-Chikendrop2
set word=1
set drop=Zombie Feather
set /a zombief=%zombief%+1
set /a playerxp=%playerxp%+25
goto winCC

:Boulderdrop2
set destination=Boulderdrop2
set word=4
set drop=Rocks
set /a rocks=%rocks%+4
set /a playerxp=%playerxp%+86
goto winCC

:Corrupteddrop2
set destination=Corrupteddrop2
set word=2
set drop=Corrupted Shard
set /a cshard=%cshard%+2
set /a playerxp=%playerxp%+324
goto winCC

:Thiefdrop2
set destination=Thiefdrop2
set word=3
set drop=Old Coins
set /a ocoins=%ocoins%+3
set /a playerxp=%playerxp%+100
goto winCC

:Bobdrop2
set destination=Bobdrop2
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
set /a playerxp=%playerxp%+250
goto winCC


:levelup2
set destination=levelup2-2
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+125
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelup2-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllv2
)
goto levelup2-2

:winCC
set destination=winSB
set /a hp=%orighp%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Congrats Adventurer!
echo %linevar%
echo.
echo You won the battle against the %npcstat% %npctype%.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:mid /n /m ""
set msplash=n
if "%errorlevel%"=="1" goto mainmenu
if "%errorlevel%"=="2" goto checkitemsINV
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto picknpc2
)
goto winCC

:testllv2
if %health% LEQ 0 goto test22
goto fs1-2
:test22
if %levell% LEQ 10 goto dropitem2
if NOT %levell% LEQ 10 goto fs1-2
goto dropitem2


// MARK: Krelbay
:town1
set destination=town1
set backdest=town
title StormTides Byte - Krelbay
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome to Krelbay
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Trade Market[0m
echo [%s2%] Sorcerers Tower
echo.
echo %linevar%
echo [%s3%] leave[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto tm
if "%select%"=="2" set select=1&goto st
if "%select%"=="3" set select=1&goto MENU
)
goto town1

:st
set destination=st
set backdest=town1
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You Curently Have %gold% Gold.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Kirin Tor Tower [31m[Temp Remove][0m
echo [%s2%] Runeic Crafter [31m[Coming Soon][0m
echo.
echo Weapon Store Pg.1
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto st
if "%select%"=="2" set select=1&goto st
if "%select%"=="3" set select=1&goto MENU
)
goto st

:st1
set destination=st1
set backdest=st
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You Curently Have %gold% Gold.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Spirt Heal Spell Recipe -  [0m
echo.
echo Weapon Store Pg.1
echo %linevar%
echo [%s6%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1& (
set /a sprice=50
set spellchoice=Lunar
set swordchoice2=Rush
set levelneeded=1
goto buyw1 )
if "%select%"=="6" set select=1&goto st
)
goto st1


:buyw1
set destination=buyw1
if %levell% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %gold% LSS %sprice% goto nogold
set /a gold=%gold%-%sprice%
set /a sword1=%sword1%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %swordchoice% %swordchoice2% purchased.
echo You have a damage bonus of up to %att% with this item.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weaponstore1
)
goto buyw1



// MARK: Trade Market
:tm
title StormTides Byte - Trade Market
set destination=tm
set backdest=town1
cls
mode con cols=48 lines=35
if %select% gtr 8 set select=1
if %select% lss 1 set select=8
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s%select%=[90m#[0m[97m
echo %linevar%-
echo Welcome To The Salv Trade Market!
echo %linevar%
echo Pg.1
echo You have %gold% gold.
echo [0m
echo [%s1%] Goblin Mail: %gmail% - 5 gold Each[0m
echo [%s2%] Crab Legs: %clegs% - 3 gold Each[0m
echo [%s3%] Buff-Lobster Legs: %bufflegs% - 8 gold Each[0m
echo [%s4%] Broken Fishing Rod: %bfp% - 6 gold Each[0m
echo [%s5%] Dave Brain Fragment: %dbrain% - 10 gold Each[0m
echo [%s6%] Zombie Feather: %zombief% - 20 gold Eachv
echo.
echo %linevar%
echo [%s7%] Next Page[0m
echo [%s8%] Back[0m
echo.
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" (
set gcho=gmail
set item="Goblin Mail"
set spl=5
goto buysell
)
if "%select%"=="2" (
set gcho=clegs
set item="Crab Legs"
set spl=3
goto buysell
)
if "%select%"=="3" (
set gcho=bufflegs
set item="Buff-Lobster Legs"
set spl=8
goto buysell
)
if "%select%"=="4" (
set gcho=bfp
set item="Broken Fishing Rod"
set spl=6
goto buysell
)
if "%select%"=="5" (
set gcho=dbrain
set item="Dave Brain Fragments"
set spl=10
goto buysell
)
if "%select%"=="6" (
set gcho=zombief
set item="Zombie Feather"
set spl=20
goto buysell
)
if "%select%"=="7" set select=1&goto tm2
if "%select%"=="8" set select=1&goto town1
)
goto tm
:buysell
set destination=buysell
set backdest=tm
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Would you like to buy or sell %item%. 
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Buy[0m
echo [%s2%] Sell[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto buyitem
if "%select%"=="2" set select=1&goto sellitem
if "%select%"=="3" set select=1&goto tm
)
goto buysell

:buyitem
set destination=buyitem
echo.
set /p g3=Enter the amount you would like to purchase: 
if not defined g3 (
goto buyitem
)
if %g3% LEQ 0 goto tm
set /a cost=%spl%*%g3%
if %cost% GTR %gold% goto notenoughgold2
set /a gold=%gold%-%cost%
set /a %gcho%=%gcho%+%g3%
echo.
echo Bought %g3% of that item for %cost%.
echo.
pause>nul
goto tm

:sellitem
set destination=sellitem
echo.
set /p g4=Enter the amount of that item you would like to sell: 
if not defined g4 (
goto sellall
)
if %gcho% LSS %g4% goto tm
set /a price=%spl%*%g4%
set /a gold=%gold%+%price%
set /a %gcho%=%gcho%-%g4%
echo.
echo Sold %g4% of %item%(S) for %price%.
echo.
pause>nul
goto tm

:sellall
set /a price=%spl%*%gcho%
set /a gold=%gold%+%price%
set /a %gcho%=0
echo.
echo Sold all of your %item%(S) for %price%.
echo.
pause>nul
goto tm

:notenoughgold2
echo No money You broke, GO HOME.
pause>nul
goto %destination%

:tm2
set destination=tm2
set backdest=tm1
cls
mode con cols=48 lines=35
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome To The Salv Trade Market!
echo %linevar%
echo Pg.2
echo You have %gold% gold.
echo [0m
echo [%s1%] Rocks: %rocks% - 2 gold Each[0m
echo [%s2%] Old Coins: %ocoins% - 2 gold Each[0m
echo [%s3%] Bobs Tear: %bobst% - 80 gold Each[0m
echo [%s4%] Spider Fangs: %fangs% - 5 gold Each[0m
echo [%s5%] Mutant Pelt: %pelt% - 20 gold Each[0m
echo [%s6%] Corrupted Shards: %cshard% - 12 gold Each[0m
echo.
echo %linevar%
echo [%s7%] Last Page[0m
echo [%s8%] Next Page[0m
echo [%s9%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" (
set gcho=rocks
set item="Rocks"
set spl=2
goto buysell
)
if "%select%"=="2" (
set gcho=ocoins
set item="Old Coins"
set spl=2
goto buysell
)
if "%select%"=="3" (
set gcho=bobst
set item="Bobs Tear"
set spl=80
goto buysell
)
if "%select%"=="4" (
set gcho=fangs
set item="Spider Fangs"
set spl=5
goto buysell
)
if "%select%"=="5" (
set gcho=pelt
set item="Mutant Pelt"
set spl=20
goto buysell
)
if "%select%"=="6" (
set gcho=cshard
set item="Corrupted Shards"
set spl=12
goto buysell
)
if "%select%"=="7" set select=1&goto tm
if "%select%"=="8" set select=1&goto tm2
if "%select%"=="9" set select=1&goto town1
)
goto tm2


:tm3
set destination=tm3
set backdest=tm2
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome To The Salv Trade Market!
echo %linevar%
echo Pg.3
echo You have %gold% gold.
echo [0m
echo [%s1%] Human Skin: %skin% - 8 gold Each[0m
echo [%s2%] Seeds: %seeds% - 1 gold Each[0m
echo [%s3%] Fish Fins: %fins% - 7 gold Each[0m
echo [%s4%] Pelt: %pelt2% - 5 gold Each[0m
echo.
echo %linevar%
echo [%s5%] Last Page[0m
echo [%s6%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&set gcho=skin
if "%select%"=="1" set select=1&set spl=8
if "%select%"=="1" set select=1&goto buysell
if "%select%"=="2" set select=1&set gcho=seeds
if "%select%"=="2" set select=1&set spl=1
if "%select%"=="2" set select=1&goto buysell
if "%select%"=="3" set select=1&set gcho=fins
if "%select%"=="3" set select=1&set spl=7
if "%select%"=="3" set select=1&goto buysell
if "%select%"=="4" set select=1&set gcho=pelt2
if "%select%"=="4" set select=1&set spl=5
if "%select%"=="4" set select=1&goto buysell
if "%select%"=="5" set select=1&goto tm2
if "%select%"=="6" set select=1&goto town1
)
goto tm3




// MARK: Solace
:town2
set destination=town2
set backdest=towns
title StormTides Byte - Solace
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome to Solace
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Blacksmith[0m
echo [%s2%] Tavern[0m
echo.
echo %linevar%
echo [%s3%] leave[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto blacksmith
if "%select%"=="2" set select=1&goto tavern
if "%select%"=="3" set select=1&goto MENU
)
goto town2

:blacksmith
set destination=blacksmith
set backdest=town2
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Solace Blacksmith
echo %linevar%
echo You Curently Have %gold% Gold.
echo [0m
set s%select%=[90m#[0m[97m
echo Materials
echo [%s1%] Dave Brain Fragments - 450 Gold x5[0m
echo [%s2%] Corrupted Shards - 500 Gold x25[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %gold% geq 450 set select=1&goto buy-mat1
if "%select%"=="2" if %gold% geq 500 set select=1&goto buy-mat2
if "%select%"=="3" set select=1&goto town2
)
goto blacksmith

:buy-mat1
set destination=buy-mat1
set /a gold=%gold%-450
set /a dbrain=%dbrain%+5
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have bought x5 Dave Brain Fragments for
echo 450 Gold. You now have %dbrain% Dave Brain Fragments.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto blacksmith
)
goto buy-mat1

:buy-mat2
set destination=buy-mat2
set /a gold=%gold%-500
set /a cshard=%cshard%+25
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have bought x25 Corrupted Shards for
echo 500 Gold. You now have %cshard% Corrupted Shards.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto blacksmith
)
goto buy-mat2




:tavern
set destination=tavern
set backdest=town2
set lver1=Offline
set lver2=Offline
set lver3=Offline
set lver4=Offline
set lver5=Offline
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Tavern Of Solace
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo Select where you want to go
echo [%s1%] The Bar[31m[Coming Soon][0m
echo [%s2%] Suspicious Door[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" goto tavern
if "%select%"=="2" set select=1&goto strange-door
if "%select%"=="3" set select=1&goto town2
)
goto tavern

:strange-door
set destination=strange-door
set backdest=tavern
cls
mode con cols=48 lines=35
if %select% gtr 7 set select=1
if %select% lss 1 set select=7
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Suspicious Door
echo %linevar%
echo The door won't open but there 
echo are 5 leavers beside the door and
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Leaver 1 (%lver1%)[0m
echo [%s2%] Leaver 2 (%lver2%)[0m
echo [%s3%] Leaver 3 (%lver3%)[0m
echo [%s4%] Leaver 4 (%lver4%)[0m
echo [%s5%] Leaver 5 (%lver5%)[0m
echo.
echo [%s6%] Enter Sequence[0m
echo %linevar%
echo [%s7%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %lver1% Equ Online set lver1=Offline
if "%select%"=="1" if %lver1% Equ Offline set lver1=Online
if "%select%"=="2" if %lver2% Equ Online set lver2=Offline
if "%select%"=="2" if %lver2% Equ Offline set lver2=Online
if "%select%"=="3" if %lver3% Equ Online set lver3=Offline
if "%select%"=="3" if %lver3% Equ Offline set lver3=Online
if "%select%"=="4" if %lver4% Equ Online set lver4=Offline
if "%select%"=="4" if %lver4% Equ Offline set lver4=Online
if "%select%"=="5" if %lver5% Equ Online set lver5=Offline
if "%select%"=="5" if %lver5% Equ Offline set lver5=Online
if "%select%"=="6" if %lver1% Equ Offline if %lver2% Equ Online if %lver3% Equ Online if %lver4% Equ Offline if %lver5% Equ Online if %levell% Geq 100 set select=1&goto s-town1
if "%select%"=="7" set select=1&goto tavern
)
goto strange-door



// MARK: Mystic Grove
:town3
set destination=town3
set backdest=towns
title StormTides Byte - Mystic Grove
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome to Mystic Grove
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Temple[0m
echo [%s2%] Licencer[31m[Coming Soon][0m
echo.
echo %linevar%
echo [%s3%] leave[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto temple
if "%select%"=="2" set select=1&goto town3
if "%select%"=="3" set select=1&goto MENU
)
goto town3

:temple
set destination=temple
set backdest=town3
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Temple
echo %linevar%
echo Select an item you want to offer
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Seeds x5 - %seeds%[0m
echo [%s2%] Human Skin x10 - %skin%[0m
echo [%s3%] 1,000 Gold - %gold%[0m
echo [%s4%] Enchanted Skull x1 - %eskull%[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %seeds% geq 5 set select=1&goto offer1
if "%select%"=="2" if %skin% geq 10 set select=1&goto offer2
if "%select%"=="3" if %gold% geq 1000 set select=1&goto offer3
if "%select%"=="4" if %eskull% geq 1 set select=1&goto offer4
if "%select%"=="5" set select=1&goto town1
)
goto temple

:offer1
set /a chance=%random% %% 5+1
if %chance% EQU 1 set /a seeds=%seeds%-5&goto reward1-1
if %chance% EQU 2 set /a seeds=%seeds%-5&goto reward1-2
if %chance% EQU 3 set /a seeds=%seeds%-5&goto reward1-3
if %chance% EQU 4 set /a seeds=%seeds%-5&goto reward1-4
if %chance% EQU 5 set /a seeds=%seeds%-5&goto reward1-5

:offer2
set /a chance=%random% %% 5+1
if %chance% EQU 1 set /a skin=%skin%-10&goto reward2-1
if %chance% EQU 2 set /a skin=%skin%-10&goto reward2-2
if %chance% EQU 3 set /a skin=%skin%-10&goto reward2-3
if %chance% EQU 4 set /a skin=%skin%-10&goto reward2-4
if %chance% EQU 5 set /a skin=%skin%-10&goto reward2-5

:offer3
set /a chance=%random% %% 5+1
if %chance% EQU 1 set /a gold=%gold%-1000&goto reward3-1
if %chance% EQU 2 set /a gold=%gold%-1000&goto reward3-2
if %chance% EQU 3 set /a gold=%gold%-1000&goto reward3-3
if %chance% EQU 4 set /a gold=%gold%-1000&goto reward3-4
if %chance% EQU 5 set /a gold=%gold%-1000&goto reward3-5

:offer4
set /a chance=%random% %% 5+1
if %chance% EQU 1 set /a eskull=%eskull%-1&goto reward4-1
if %chance% EQU 2 set /a eskull=%eskull%-1&goto reward4-2
if %chance% EQU 3 set /a eskull=%eskull%-1&goto reward4-3
if %chance% EQU 4 set /a eskull=%eskull%-1&goto reward4-4
if %chance% EQU 5 set /a eskull=%eskull%-1&goto reward4-5


:reward1-1
set destination=reward1-1
set /a gold=%gold%+800
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +800 Gold! You now have %gold% Gold.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward1-1

:reward1-2
set destination=reward1-2
set /a dbrain=%dbrain%+25
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +25 Dave Brain Fragments! 
echo You now have %dbrain% Dave Brain Fragments.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward1-2

:reward1-3
set destination=reward1-3
set /a sword1=%sword1%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +1 Plastic Sword! 
echo You now have %sword1% Plastic Swords.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward1-3

:reward1-4
set destination=reward1-4
set /a cshard=%cshard%+50
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +50 Corrupted Shards! 
echo You now have %cshard% Corrupted Shards.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward1-4

:reward1-5
set destination=reward1-5
set /a cshard=%cshard%+100
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +100 Corrupted Shards! 
echo You now have %cshard% Corrupted Shards.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward1-5



:reward2-1
set destination=reward2-1
set /a gold=%gold%+2500
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +2500 Gold! You now have %gold% Gold.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward2-1

:reward2-2
set destination=reward2-2
set /a dbrain=%dbrain%+50
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +50 Dave Brain Fragments! 
echo You now have %dbrain% Dave Brain Fragments.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward2-2

:reward2-3
set destination=reward2-3
set /a gold=%gold%+3500
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +3500 Gold! You now have %gold% Gold.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward2-3

:reward2-4
set destination=reward2-4
set /a dchest=%dchest%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +1 Dungeon Chest! 
echo You now have %dchest% Dungeon Chest.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward2-4

:reward2-5
set destination=reward2-5
set /a seeds=%seeds%+3
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +3 Seeds! You now have %seeds% Seeds.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward2-5



:reward3-1
set destination=reward3-1
set /a dchest=%dchest%+3
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +3 Dungeon Chests! 
echo You now have %dchest% Dungeon Chests.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward3-1

:reward3-2
set destination=reward3-2
set /a dchest=%dchest%+3
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +3 Dungeon Chests! 
echo You now have %dchest% Dungeon Chests.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward3-2

:reward3-3
set destination=reward3-3
set /a bobst=%bobst%+10
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +10 Bobs Tears!
echo You now have %bobst% Bobs Tears.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward3-3

:reward3-4
set destination=reward3-4
set /a raidpot=%raidpot%+10
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +10 Raid Health Elixer!
echo You now have %raidpot% Raid Health Elixer.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward3-4

:reward3-5
set destination=reward3-5
set /a sword5=%sword5%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +1 Poison Shank!
echo You now have %sword5% Poison Shanks.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward3-5


:reward4-1
set destination=reward4-1
set /a gold=%gold%+15000
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +15,000 Gold! You now have %gold% Gold.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward4-1

:reward4-2
set destination=reward4-2
set /a dbrain=%dbrain%+150
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +150 Dave Brain Fragments! 
echo You now have %dbrain% Dave Brain Fragments.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward4-2

:reward4-3
set destination=reward4-3
set /a dchest=%dchest%+3
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +3 Dungeon Chests! 
echo You now have %dchest% Dungeon Chests.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward4-3

:reward4-4
set destination=reward4-4
set /a cshard=%chshard%+150
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +150 Corrupted Shards! 
echo You now have %cshard% Corrupted Shard.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward4-4

:reward4-5
set destination=reward4-5
set /a =%gold%+100000
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have gotten...
echo +100,000 Gold! You now have %gold% Gold.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto temple
)
goto reward4-5


// MARK: Winterfell
:town4
set destination=town4
set backdest=towns
title StormTides Byte - Winterfell
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome to Mystic Grove
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Map Merchant[31m[Coming Soon][0m
echo [%s2%] Alchemy Merchant[31m[Coming Soon][0m
echo [%s3%] Dragon's Hoard[31m[Coming Soon][0m
echo.
echo %linevar%
echo [%s4%] leave[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto town4
if "%select%"=="2" set select=1&goto town4
if "%select%"=="3" set select=1&goto town4
if "%select%"=="4" set select=1&goto MENU
)
goto town4

:map-merchant
set destination=map-merchant
set backdest=town4
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Map Merchant
echo %linevar%
echo You Curently Have %gold% Gold.
echo [0m
set s%select%=[90m#[0m[97m
echo Materials
echo Items coming soon!
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" if %gold% geq 450 set select=1&goto buy-mat1
if "%select%"=="2" if %gold% geq 500 set select=1&goto buy-mat2
if "%select%"=="3" set select=1&goto town2
)
goto map-merchant


// MARK: New Arcadia
:s-town1
set destination=s-town1
set backdest=towns
title StormTides Byte - New Arcadia
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome to [36mNew [34mArca[35mdia[0m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo Nothing to see here...
echo.
echo %linevar%
echo [%s4%] leave[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (-
if "%select%"=="4" set select=1&goto MENU
)
goto s-town1


// MARK: Workshop
:workshop
set destination=workshop
set backdest=MENU
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo The Workshop
echo %linevar%
echo What do you wan't to do here?
echo [0m
echo [%s1%] Alchemy Brewery[0m
echo [%s2%] Magical Forge[0m
echo [%s3%] Weapon Forge [[90mLv. 100+[0m][0m
echo [%s4%] Farm [31m[Coming Soon][0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto brewery
if "%select%"=="2" set select=1&goto mforge
if "%select%"=="3" if %levell% GEQ 100 set select=1&goto wforge
if "%select%"=="4" set select=1&goto workshop
if "%select%"=="5" set select=1&goto MENU
)
goto workshop

:brewery
set destination=brewery
set backdest=workshop
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Health Potion T3 - 100 x3[0m
echo [%s2%] Raid Health Elixer x1[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto potion1
if "%select%"=="2" set select=1&goto potion2
if "%select%"=="3" set select=1&goto workshop
)
goto brewery

:potion1
set destination=potion1
set backdest=brewery
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo Health Potion T3 - 100 x3
echo 1 Bobs Tear: %bobst%
echo 3 Seeds: %seeds%
echo.
echo [%s1%] Craft[0m
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto makepot1
if "%select%"=="2" set select=1&goto brewery
)
goto potion1

:makepot1
set destination=makepot1-2
if %bobst% LSS 1 goto nomats
if %seeds% LSS 3 goto nomats
set /a bobst=%bobst%-1
set /a seeds=%seeds%-3
set /a potiont3=%potiont3%+3
:makepot1-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo ---
echo You crafted x3 Health Potion T3.
echo Your curent number of this is now...
echo %potiont3%.
echo.
echo [%s1%] Okay
echo.
echo --
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto potion1
)
goto makepot1-2

:potion2
set destination=potion2
set backdest=brewery
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Raid Health Elixer x1
echo 2 Dave Brain Fragments: %dbrain%
echo [0m
echo [%s1%] Craft[0m
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto makepot2
if "%select%"=="2" set select=1&goto brewery
)
goto potion2

:makepot2
set destination=makepot2-2
if %dbrain% LSS 2 goto nomats2
set /a dbrain=%dbrain%-2
set /a raidpot=%raidpot%+1
:makepot2-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo ---
echo You crafted x1 Raid Health Elixers.
echo Your curent number of this is now...
echo %raidpot%.
echo.
echo [%s1%] Okay
echo.
echo --
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto potion2
)
goto makepot2-2


:nomats
echo You don't have the items for that...
pause>nul
goto potion1

:nomats2
echo You don't have the items for that...
pause>nul
goto potion2

:mforge
set destination=mforge
set backdest=workshop
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Max Health Orb - +25 x1[0m
echo [%s2%] Normal Mythic Raid Map x1[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto item1
if "%select%"=="2" set select=1&goto item2
if "%select%"=="3" set select=1&goto workshop
)
goto mforge

:item1
set destination=item1
set backdest=mforge
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Max Health Orb - +25 x1
echo 1 Enchanted Skull: %eskull%
echo 100 Corrupted Shards: %cshard%
echo [0m
echo [%s1%] Craft[0m
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto makeitem1
if "%select%"=="2" set select=1&goto mforge
)
goto item1

:makeitem1
set destination=makeitem1-2
if %cshard% LSS 99 goto nomats1-2
if %eskull% LSS 1 goto nomats1-2
set /a cshard=%cshard%-100
set /a eskull=%eskull%-1
set /a orb1=%orb1%+1
:makeitem1-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo ---
echo You crafted x1 Max Health Orb - +25.
echo Your curent number of this is now...
echo %orb1%.
echo.
echo [%s1%] Okay
echo.
echo --
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto item1
)
goto makeitem1-2

:item2
set destination=item2
set backdest=mforge
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Normal Mythic Raid Map x1
echo 5 Human Skin: %skin%
echo 10 Corrupted Shards: %cshard%
echo 1 Bobs Tear: %bobst%
echo [0m
echo [%s1%] Craft[0m
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto makeitem2
if "%select%"=="2" set select=1&goto mforge
)
goto item2

:makeitem2
set destination=makeitem2-2
if %cshard% LSS 24 goto nomats2-2
if %skin% LSS 5 goto nomats2-2
if %bobst% LSS 1 goto nomats2-2
set /a cshard=%cshard%-10
set /a skin=%skin%-5
set /a bobst=%bobst%-1
set /a key1=%key1%+1
:makeitem2-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo ---
echo You crafted x1 Normal Mythic Raid Map.
echo Your curent number of this is now...
echo %key1%.
echo.
echo [%s1%] Okay
echo.
echo --
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto item2
)
goto makeitem2-2

:nomats1-2
echo You don't have the items for that...
pause>nul
goto item1

:nomats2-2
echo You don't have the items for that...
pause>nul
goto item2


:wforge
set destination=wforge
set backdest=workshop
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Shadow Striker x1[0m
echo [%s2%] Necrosis x1[0m
echo.
echo %linevar%
echo [%s3%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto weapon1
if "%select%"=="2" set select=1&goto weapon2
if "%select%"=="3" set select=1&goto workshop
)
goto wforge

:weapon1
set destination=weapon1
set backdest=wforge
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Shadow Striker x1
echo 1 Enchanted Skull: %eskull%
echo 25 Corrupted Shards: %cshard%
echo 50 Bobs Tear: %bobst%
echo 100 Spider Fangs: %fangs%
echo [0m
echo [%s1%] Craft[0m
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto makeweapon1
if "%select%"=="2" set select=1&goto wforge
)
goto weapon1

:makeweapon1
set destination=makeweapon1-2
if not %cshard% GEQ 25 goto nomats1-3
if not %eskull% GEQ 1 goto nomats1-3
if not %bobst% GEQ 50 goto nomats1-3
if not %fangs% GEQ 100 goto nomats1-3
set /a cshard=%cshard%-25
set /a eskull=%eskull%-1
set /a bobst=%bobst%-50
set /a fangs=%fangs%-100
set /a weapon1=%weapon1%+1
:makeweapon1-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo ---
echo You crafted x1 Shadow Striker.
echo Your curent number of this is now...
echo %weapon1%.
echo.
echo [%s1%] Okay
echo.
echo --
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weapon1
)
goto makeitem1-2

:weapon2
set destination=weapon2
set backdest=wforge
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo Necrosis x1
echo 5 Enchanted Skull: %eskull%
echo 100 Corrupted Shards: %cshard%
echo 50 Bobs Tear: %bobst%
echo [0m
echo [%s1%] Craft[0m
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmiad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" set select=1&goto %backdest%
if "%errorlevel%"=="6" (
if "%select%"=="1" set select=1&goto makeweapon1
if "%select%"=="2" set select=1&goto wforge
)
goto weapon2

:makeweapon2
set destination=makeweapon2-2
if not %cshard% GEQ 100 goto nomats1-3
if not %eskull% GEQ 3 goto nomats1-3
if not %bobst% GEQ 50 goto nomats1-3
set /a cshard=%cshard%-100
set /a eskull=%eskull%-5
set /a bobst=%bobst%-50
set /a weapon2=%weapon2%+1
:makeweapon2-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo ---
echo You crafted x1 Necrosis.
echo Your curent number of this is now...
echo %weapon2%.
echo.
echo [%s1%] Okay
echo.
echo --
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto weapon2
)
goto makeitem2-2


:nomats1-3
echo You don't have the items for that...
pause>nul
goto item1

:farm
set choping_per=[     ]
set destination=farm
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Welcome to the farm! Here you can
echo gather materials for your adventures!
echo [0m
echo [%s1%] Forest[0m
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto forest
if "%select%"=="2" set select=1&goto workshop
)
goto farm

:forest
set destination=forest
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Chop Wood[0m
echo %choping_per%
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto forest_choping
if "%select%"=="2" set select=1&goto workshop
)
goto forest

:forest_choping
set destination=forest_choping
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Chop Wood[0m
echo %choping_per%
echo.
echo %linevar%
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto forest_choping
if "%select%"=="2" set select=1&goto workshop
)
goto forest_choping



// MARK: mainmenu
:mainmenu
title StormTides Byte - Main Menu
set backdest=%destination%
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [36mStormTides[0m Menu
echo %linevar%
echo What Would You Like To Do?
echo [0m
echo [%s1%] Settings[0m
echo [%s2%] Save[0m
echo [%s3%] Handbook[31m[Coming Soon][0m
echo [%s4%] Quit[0m
echo [%s5%] Back[0m
echo.
echo %linevar%
echo Curently On Save: [37m%Username1%[0m
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto settings
if "%select%"=="2" set select=1&goto SAVE_GAME_FILES
if "%select%"=="3" set select=1&goto mainmenu
if "%select%"=="4" set select=1&goto startgame
if "%select%"=="5" set select=1&goto %destination%
)
goto mainmenu

:handbook
cls
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Unit Handbook
echo %linevar2%
echo [0m
echo [%s1%] Weapon ^& Armor Stats[0m
echo [%s2%] Blank[0m
echo.
echo %linevar%
echo [%s3%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto weapons-armor
if "%select%"=="2" set select=1&goto UnitHandbook
if "%select%"=="3" set select=1&goto mainmenu
)
goto guidebook

:weapons-armor
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo 
echo.
echo %linevar%
echo [%s1%] Next Page
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto handbook
)
goto weapons-armor





// MARK: Inventory Quick
:checkitemsINV
title StormTides Byte - Inventory
set backdest=%destination%
cls
mode con cols=48 lines=35
if %select% gtr 6 set select=1
if %select% lss 1 set select=6
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [37m%username1%[0m's Stats - Title: [37m%title%[0m
echo %linevar%
echo Health: %hp%/%orighp%
echo Level: %levell%
echo EXP: %playerxp%/%origxp%
echo Gold: %gold%
echo.
if %swordtype% EQU Necrosis echo Weapon: Necrosis
if not %swordtype% EQU Necrosis echo Weapon: %swordtype% %skind%
if %armortype% EQU N/A echo Armor: None
if not %armortype% EQU N/A echo Armor: %armortype% %skindA%
if %skindAr% EQU N/A echo Artifact: None
if not %skindAr% EQU N/A echo Artifact: %artifacttype% %skindAr%
echo.
echo Xp Multiplier: %xpmul%x
echo %linevar%
echo Select Bag.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Backpack[0m
echo [%s2%] Raid Pouch[0m
echo [%s3%] Material Pouch[0m
echo [%s4%] Quick Item[0m
echo [%s5%] Catalog [[31mComing Soon[0m][0m
echo.
echo %linevar%
echo [%s6%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto checkitemsIN
if "%select%"=="2" set select=1&goto checkitemsP3IN
if "%select%"=="3" set select=1&goto checkitemsP2IN
if "%select%"=="4" set select=1&goto quickselectINV
if "%select%"=="5" set select=1&goto checkitemsINV
if "%select%"=="6" set select=1&goto %destination%
)
goto checkitemsINV

:quickselectINV
set backdest=selectbag
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Quick Select.
echo %linevar%
if %quickitem% EQU hpot1 echo Current Selection: Health Potion T1
if %quickitem% EQU hpot2 echo Current Selection: Health Potion T2
if %quickitem% EQU hpot3 echo Current Selection: Health Potion T3
if %quickitem% EQU raidpot echo Current Selection: Raid Health Elixer
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Health Potion T1 - 25: %potiont1%[0m
echo [%s2%] Health Potion T2 - 50: %potiont2%[0m
echo [%s3%] Health Potion T3 - 100: %potiont3%[0m
echo [%s4%] Raid Health Elixer: %raidpot%[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" goto quickselect1INV
if "%select%"=="2" goto quickselect2INV
if "%select%"=="3" goto quickselect3INV
if "%select%"=="4" goto quickselect4INV
if "%select%"=="5" set select=1&goto checkitemsINV
)
goto quickselectINV

:quickselect1INV
set quickitem=hpot1
goto quickselectINV

:quickselect2INV
set quickitem=hpot2
goto quickselectINV

:quickselect3INV
set quickitem=hpot3
goto quickselectINV

:quickselect4INV
set quickitem=raidpot
goto quickselectINV

:checkitemsIN
set backdest=checkitemsINV
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Backpack.
echo %linevar%
echo.
if %potiont1% GTR 0 echo Health Potion T1 - 25: %potiont1%
if %potiont2% GTR 0 echo Health Potion T2 - 50: %potiont2%
if %potiont3% GTR 0 echo Health Potion T3 - 100: %potiont3%
if %dchest% GTR 0 echo Dungeon Chest T1: %dchest%
echo.
if %sword1% GTR 0 echo Plastic Sword: %sword1%
if %sword2% GTR 0 echo Old Dagger: %sword2%
if %sword3% GTR 0 echo Refurbished Glave: %sword3%
if %sword4% GTR 0 echo Battle Staff: %sword4%
if %sword5% GTR 0 echo Poison Shank: %sword5%
if %sword6% GTR 0 echo Strong Katana: %sword6%
if %sword7% GTR 0 echo Sharp Dagger: %sword7%
if %sword8% GTR 0 echo Warriors Staff: %sword8%
echo.
if %weapon1% GTR 0 echo Shadow Striker: %weapon1%
if %weapon2% GTR 0 echo Necrosis: %weapon2%
echo.
if %armor1% GTR 0 echo Cardbord Plate: %armor1%
if %armor2% GTR 0 echo Hide Armor: %armor2%
if %armor3% GTR 0 echo Steel Armor: %armor3%
if %armor4% GTR 0 echo Scale Set: %armor4%
if %armor5% GTR 0 echo Furr Suit: %armor5%
if %armor6% GTR 0 echo Titanium Armor: %armor6%
if %armor7% GTR 0 echo Tungsten Set: %armor7%
if %armor8% GTR 0 echo Platinum Set: %armor8%
echo.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Heal[0m
echo [%s2%] Inspect Weapon[0m
echo [%s3%] Inspect Armor[0m
echo.
echo %linevar%
echo [%s4%] Back
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto healmenuINV
if "%select%"=="2" set select=1&goto weaponselectINV
if "%select%"=="3" set select=1&goto armorselectINV
if "%select%"=="4" set select=1&goto checkitemsINV
)
goto checkitemsIN

:checkitemsP2IN
set backdest=checkitemsINV
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Material Pouch.
echo %linevar%
echo.
if %gmail% GTR 0 echo Goblin Mail: %gmail%
if %clegs% GTR 0 echo Crab Legs: %clegs%
if %bufflegs% GTR 0 echo Buff-Lobster Legs: %bufflegs%
if %bfp% GTR 0 echo Broken Fishing Pole: %bfp%
if %dbrain% GTR 0 echo Dave Brain Fragment: %dbrain%
if %skin% GTR 0 echo Human Skin: %skin%
if %seeds% GTR 0 echo Seeds: %seeds%
if %fins% GTR 0 echo Fish Fins: %fins%
if %rocks% GTR 0 echo Rocks: %rocks%
if %cshard% GTR 0 echo Corrupted Shards: %cshard%
if %ocoins% GTR 0 echo Old Coins: %ocoins%
if %bobst% GTR 0 echo Bobs Tear: %bobst%
if %fangs% GTR 0 echo Spider Fangs: %fangs%
if %pelt2% GTR 0 echo Pelt: %pelt2%
if %pelt% GTR 0 echo Mutant Pelt: %pelt%
if %zombief% GTR 0 echo Mutant Pelt: %zombief%
echo.
echo %linevar%
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:ad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set select=1&goto %backdest%
if "%errorlevel%"=="2" (
if "%select%"=="1" set select=1&goto checkitemsINV
)
goto checkitemsP2IN

// MARK: Raid shit
:checkitemsP3IN
set backdest=checkitemsINV
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo %username1%'s Raid Pouch.
echo %linevar%
echo.
if %dchest% GTR 0 echo Dungeon Chest: %dchest%
if %raidpot% GTR 0 echo Raid Health Elixer: %raidpot%
if %stormstone% GTR 0 echo Storm Stone: %stormstone%
if %key1% GTR 0 echo Normal Mythic Raid Map: %key1%
if %key2% GTR 0 echo Strong Mythic Raid Map: %key2%
if %key3% GTR 0 echo Tough Mythic Raid Map: %key3%
if %key4% GTR 0 echo [31mEnraged[0m Mythic Raid Map: %key4%
if %orb1% GTR 0 echo : Max Health Orb: %orb1%
echo [0m
echo %linevar%
echo [%s1%] Open Items[0m
echo [%s2%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto openitemsINV
if "%select%"=="2" set select=1&goto checkitemsINV
)
goto checkitemsP3IN

:openitemsINV
set backdest=checkitemsP3IN
cls
mode con cols=48 lines=35
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
if %dchest% GTR 0 echo [%s1%] Open Dungeon Chest: %dchest%[0m
if %dchest% EQU 0 echo [%s1%] ???: %dchest%[0m
if %stormstone% GTR 0 echo [%s2%] Storm Stone: %stormstone%[0m
if %stormstone% EQU 0 echo [%s2%] ???: %dstormstone%[0m
if %orb1% GTR 0 echo [%s3%] Max Health Orb: %orb1%[0m
if %orb1% EQU 0 echo [%s3%] ???: %orb1%[0m
echo.
echo %linevar%
echo [%s4%] Back
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" if %dchest% GEQ 1 set select=1&goto openitems1INV
if "%select%"=="2" if %stormstone% GEQ 1 set select=1&goto openitems2INV
if "%select%"=="3" if %orb1% GEQ 1set select=1&goto openitems3INV
if "%select%"=="4" set select=1&goto checkitemsP3IN
)
goto openitemsINV

:openitems1INV
if %dchest% EQU 0 goto noitemINV
set /a dchest=%dchest%-1
set /a loot1=%random% %% 7+1
if %loot1% EQU 1 goto loot1INV
if %loot1% EQU 2 goto loot2INV
if %loot1% EQU 3 goto loot3INV
if %loot1% EQU 4 goto loot4INV
if %loot1% EQU 5 goto loot5INV
if %loot1% EQU 6 goto loot6INV
if %loot1% EQU 7 goto loot7INV

:openitems2INV
if %stormstone% EQU 0 goto noitemINV
if %artifacttype% EQU Storm goto alreadyonINV
set artifacttype=Storm
set skindAr=Stone
:openitems2INV-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have equipped a %artifacttype% %skindAr%.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsP3IN
)
goto openitems2INV-2

:openitems3INV
if %orb1% EQU 0 goto noitemINV
set /a orb1=%orb1%-1
set /a orighp=%orighp%+25
:openitems3INV-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You now have a max HP of...
echo %orighp%!
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsP3IN
)
goto openitems3INV-2

:alreadyonINV
echo You Already have that artifact equipped...
pause>nul
goto openitemsINV


:loot1INV
set /a gold=%gold%+1520
set /a dbrain=%dbrain%+1
set /a bobst=%bobst%+2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +1520 gold
echo +1 Dave Brain Fragment
echo +2 Bobs Tears
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitemsINV
)
goto loot1INV

:loot2INV
set /a gold=%gold%+250
set /a dbrain=%dbrain%+12
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +250 gold
echo +12 Dave Brain Fragments
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitemsInv
)
goto loot2INV

:loot3INV
set /a gold=%gold%+50
set /a cshard=%cshard%+27
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +50 gold
echo +27 Corrupted Shards
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitems
)
goto loot3INV

:loot4INV
set /a gold=%gold%+3225
set /a rocks=%rocks%+11
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +3225 gold
echo +11 Rocks
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitemsINV
)
goto loot4INV

:loot5INV
set /a dbrain=%dbrain%+12
set /a eskull=%eskull%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +12 Dave Brain Fragments
echo +1 Enchanted Skull
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitemsINV
)
goto loot5INV

:loot6INV
set /a raidpot=%raidpot%+1
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You have gotten...
echo +1 Raid Health Elixer
echo.
echo [%s1%] Okay
echo.
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto openitemsINV
)
goto loot6INV


:noitemINV
echo You do not have that item...
pause>nul
goto openitemsINV












:weaponselectINV
set backdest=checkitemsIN
set /a numswords=%sword1%+%sword2%+%sword3%+%sword4%+%sword5%+%sword6%+%sword7%+%sword8%
cls
mode con cols=48 lines=35
if %select% gtr 11 set select=1
if %select% lss 1 set select=11
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s10=-
set s11=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [0m
if %sword1% GTR 0 echo [%s1%] Plastic Sword: %sword1%[0m
if %sword1% EQU 0 echo [%s1%] ???: %sword1%[0m
if %sword2% GTR 0 echo [%s2%] Old Dagger: %sword2%[0m
if %sword2% EQU 0 echo [%s2%] ???: %sword2%[0m
if %sword3% GTR 0 echo [%s3%] Refurbished Glave: %sword3%[0m
if %sword3% EQU 0 echo [%s3%] ???: %sword3%[0m
if %sword4% GTR 0 echo [%s4%] Battle Staff: %sword4%[0m
if %sword4% EQU 0 echo [%s4%] ???: %sword4%[0m
if %sword5% GTR 0 echo [%s5%] Poison Shank: %sword5%[0m
if %sword5% EQU 0 echo [%s5%] ???: %sword5%[0m
if %sword6% GTR 0 echo [%s6%] Strong Katana: %sword6%[0m
if %sword6% EQU 0 echo [%s6%] ???: %sword6%[0m
if %sword7% GTR 0 echo [%s7%] Sharp Dagger: %sword7%[0m
if %sword7% EQU 0 echo [%s7%] ???: %sword7%[0m
if %sword8% GTR 0 echo [%s8%] Warriors Staff: %sword8%[0m
if %sword8% EQU 0 echo [%s8%] ???: %sword8%[0m
if %weapon1% GTR 0 echo [%s9%] Shadow Striker: %weapon1%[0m
if %weapon1% EQU 0 echo [%s9%] ???: %weapon1%[0m
if %weapon2% GTR 0 echo [%s10%] Necrosis: %weapon2%[0m
if %weapon2% EQU 0 echo [%s10%] ???: %weapon2%[0m
echo.
echo %linevar%
echo [%s11%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" if %sword1% GTR 0 set select=1&goto inspect1INV
if "%select%"=="2" if %sword2% GTR 0 set select=1&goto inspect2INV
if "%select%"=="3" if %sword3% GTR 0 set select=1&goto inspect3INV
if "%select%"=="4" if %sword4% GTR 0 set select=1&goto inspect4INV
if "%select%"=="5" if %sword5% GTR 0 set select=1&goto inspect5INV
if "%select%"=="6" if %sword6% GTR 0 set select=1&goto inspect6INV
if "%select%"=="7" if %sword7% GTR 0 set select=1&goto inspect7INV
if "%select%"=="8" if %sword8% GTR 0 set select=1&goto inspect8INV
if "%select%"=="9" if %weapon1% GTR 0 set select=1&goto inspect9INV
if "%select%"=="10" if %weapon2% GTR 0 set select=1&goto inspect10INV
if "%select%"=="11" set select=1&goto checkitemsIN
)
goto weaponselectINV

:inspect1INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Plastic Sword ^| Bought Item
echo Max Damage: 100
echo Level Required: 1+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect1INV

:inspect2INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Old Dagger ^| Bought Item
echo.
echo Max Damage: 118
echo Level Required: 1+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips2INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect2INV

:inspect3INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Refurbished Glave ^| Bought Item
echo.
echo Max Damage: 145
echo Level Required: 2+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips3INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect3INV

:inspect4INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Battle Staff ^| Bought Item
echo.
echo Max Damage: 180
echo Level Required: 5+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips4INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect4INV

:inspect5INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Poison Shank ^| Bought Item
echo.
echo Max Damage: 230
echo Level Required: 10+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips5INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect5INV

:inspect6INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Strong Katana ^| Bought Item
echo.
echo Max Damage: 280
echo Level Required: 20+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips6INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect6INV

:inspect7INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Sharp Dagger ^| Bought Item
echo.
echo Max Damage: 310
echo Level Required: 25+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips7INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect7INV

:inspect8INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Sharp Dagger ^| Bought Item
echo.
echo Max Damage: 325
echo Level Required: 30+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips8INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect8INV

:inspect9INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Shadow Striker ^| Crafted Item
echo.
echo Max Damage: 375

echo Level Required: 100+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips9INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect9INV

:inspect10INV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Wepaons ^& Armor
echo %linevar2%
echo.
echo Necrosis ^| Crafted Item
echo.
echo Max Damage: 450
echo Level Required: 100+
echo.
echo Special Features: 
echo - Heals you every swing.
echo - +5 Max Hp per swing in a raid.
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips10INV
if "%select%"=="2" set select=1&goto weaponselect
)
goto inspect10INV

:equips1INV
if %sword1% EQU 0 goto noswordINV
if %swordtype% EQU Plastic goto alreadyequipINV
set swordtype=Plastic
set skind=Sword
set aan=a
goto confirmequipINV

:equips2INV
if %sword2% EQU 0 goto noswordINV
if %swordtype% EQU Old goto alreadyequipINV
set swordtype=Old
set skind=Dagger
set aan=a
goto confirmequipINV

:equips3INV
if %sword3% EQU 0 goto noswordINV
if %swordtype% EQU Refurbished goto alreadyequipINV
set swordtype=Refurbished
set skind=Glave
set aan=a
goto confirmequipINV

:equips4INV
if %sword4% EQU 0 goto noswordINV
if %swordtype% EQU Battle goto alreadyequipINV
set swordtype=Battle
set skind=Staff
set aan=a
goto confirmequipINV

:equips5INV
if %sword5% EQU 0 goto noswordINV
if %swordtype% EQU Poison goto alreadyequipINV
set swordtype=Poison
set skind=Shank
set aan=a
goto confirmequipINV

:equips6INV
if %sword6% EQU 0 goto noswordINV
if %swordtype% EQU Strong goto alreadyequipINV
set swordtype=Strong
set skind=Katana
set aan=a
goto confirmequipINV

:equips7INV
if %sword7% EQU 0 goto noswordINV
if %swordtype% EQU Sharp goto alreadyequipINV
set swordtype=Sharp
set skind=Dagger
set aan=a
goto confirmequipINV

:equips8INV
if %sword8% EQU 0 goto noswordINV
if %swordtype% EQU Warriors goto alreadyequipINV
set swordtype=Warriors
set skind=Staff
set aan=a
goto confirmequipINV

:equips9INV
if %sword8% EQU 0 goto noswordINV
if %swordtype% EQU Warriors goto alreadyequipINV
set swordtype=Shadow
set skind=Striker
set aan=a
goto confirmequipINV

:equips10INV
if %sword8% EQU 0 goto noswordINV
if %swordtype% EQU Warriors goto alreadyequipINV
set swordtype=Necrosis
set skind=N/A
set aan=a
goto confirmequipINV

:confirmequipINV
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have equipped %aan% %swordtype% %skind%.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto confirmequipINV

:noswordINV
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't have that weapon.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto noswordINV


:alreadyequipINV
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You already have that weapon equipped.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto alreadyequipINV

:armorselectINV
set backdest=checkitemsIN
cls
mode con cols=48 lines=35
if %select% gtr 9 set select=1
if %select% lss 1 set select=9
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s6=-
set s7=-
set s8=-
set s9=-
set s%select%=[90m#[0m[97m
echo.
echo You currently have a %armortype% %skindA% equipped.
echo Select a sword to equip, or return to battle.
echo [0m
if %armor1% GTR 0 echo [%s1%] Leather Tunic: %armor1%[0m
if %armor1% EQU 0 echo [%s1%] ???: %armor1%[0m
if %armor2% GTR 0 echo [%s2%] Hide armor: %armor2%[0m
if %armor2% EQU 0 echo [%s2%] ???: %armor2%[0m
if %armor3% GTR 0 echo [%s3%] Steel Armor: %armor3%[0m
if %armor3% EQU 0 echo [%s3%] ???: %armor3%[0m
if %armor4% GTR 0 echo [%s4%] Scale Set: %armor4%[0m
if %armor4% EQU 0 echo [%s4%] ???: %armor1%[0m
if %armor5% GTR 0 echo [%s5%] Furr Suit: %armor5%[0m
if %armor5% EQU 0 echo [%s5%] ???: %armor5%[0m
if %armor6% GTR 0 echo [%s6%] Titanium Armor: %armor6%[0m
if %armor6% EQU 0 echo [%s6%] ???: %armor6%[0m
if %armor7% GTR 0 echo [%s7%] Tungsten Set: %armor7%[0m
if %armor7% EQU 0 echo [%s7%] ???: %armor7%[0m
if %armor8% GTR 0 echo [%s8%] Platinum Set %armor8%[0m
if %armor8% EQU 0 echo [%s8%] ???: %armor8%[0m
echo.
echo [%s9%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" if %armor1% GTR 0 set select=1&goto inspect1AINV
if "%select%"=="2" if %armor2% GTR 0 set select=1&goto inspect2AINV
if "%select%"=="3" if %armor3% GTR 0 set select=1&goto inspect3AINV
if "%select%"=="4" if %armor4% GTR 0 set select=1&goto inspect4AINV
if "%select%"=="5" if %armor5% GTR 0 set select=1&goto inspect5AINV
if "%select%"=="6" if %armor6% GTR 0 set select=1&goto inspect6AINV
if "%select%"=="7" if %armor7% GTR 0 set select=1&goto inspect7AINV
if "%select%"=="8" if %armor8% GTR 0 set select=1&goto inspect8AINV
if "%select%"=="9" set select=1&goto checkitemsIN
)
goto armorselectINV

// MARK: WORK2
:inspect1AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Leather Tunic ^| Bought Item
echo Type: Light Armor
echo Class: Newbie
echo Level Required: 1+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect1AINV

:inspect2AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Hide Armor ^| Bought Item
echo Type: Light Armor
echo Class: Archer
echo Level Required: 1+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips2INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect2AINV

:inspect3AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Steel Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 2+
echo.
echo Special Features: 
echo - Tough: -8 Npc Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips3INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect3AINV

:inspect4AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Scale Set ^| Bought Item
echo Type: Normal
echo Class: Mage
echo Level Required: 5+
echo.
echo Special Features: None
echo Bonus Stats:
echo - Enchanted: +5 Point Damage Addition
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips4INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect4AINV

:inspect5AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Fur Suit ^| Bought Item
echo Type: Heavy Armor
echo Class: ???
echo Level Required: 10+
echo.
echo Special Features: None
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips1INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect6AINV

:inspect6AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Titanium Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 20+
echo.
echo Special Features:
echo - Tough: -50 Npc Damage Reduction
echo - Slowness: -25 Point Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips6INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect6AINV

:inspect7AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Armor
echo %linevar2%
echo.
echo Tungsten Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 25+
echo.
echo Special Features:
echo - Tough: -85 Npc Damage Reduction
echo - Slowness: -50 Point Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips7INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect7AINV


:inspect8AINV
cls
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^| Armor
echo %linevar2%
echo.
echo Platinum Armor ^| Bought Item
echo Type: Heavy Armor
echo Class: Warrior
echo Level Required: 35+
echo.
echo Special Features:
echo - Tough: -100 Npc Damage Reduction
echo - Slowness: -50 Point Damage Reduction
echo Bonus Stats: None
echo Duribility: Infinite
echo.
echo %linevar%
echo [%s1%] Equip
echo [%s2%] Back
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto equips8INVA
if "%select%"=="2" set select=1&goto armorselectINV
)
goto inspect8AINV

:equips1INVA
if %armor1% EQU 0 goto noarmorA
if %armortype% EQU Cardbord goto alreadyequipINVA
set armortype=Cardbord
set skindA=Armor
set aan=a
goto confirmequipINVA

:equips2INVA
if %armor2% EQU 0 goto noarmorA
if %armortype% EQU Hide goto alreadyequipINVA
set armortype=Hide
set skindA=Armor
set aan=a
goto confirmequipINVA

:equips3INVA
if %armor3% EQU 0 goto noarmorA
if %armortype% EQU Steel goto alreadyequipINVA
set armortype=Steel
set skindA=Armor
set aan=a
goto confirmequipINVA

:equips4INVA
if %armor4% EQU 0 goto noarmorA
if %armortype% EQU Scale goto alreadyequipINVA
set armortype=Scale
set skindA=Set
set aan=a
goto confirmequipINVA

:equips5INVA
if %armor5% EQU 0 goto noarmorA
if %armortype% EQU Furr goto alreadyequipINVA
set armortype=Furr
set skindA=Suit
set aan=a
goto confirmequipINVA

:equips6INVA
if %armor6% EQU 0 goto noarmorA
if %armortype% EQU Titanium goto alreadyequipINVA
set armortype=Titanium
set skindA=Armor
set aan=a
goto confirmequipINVA

:equips7INVA
if %armor7% EQU 0 goto noarmorA
if %armortype% EQU Set goto alreadyequipINVA
set armortype=Tungsten
set skindA=Set
set aan=a
goto confirmequipINVA

:equips8INVA
if %armor8% EQU 0 goto noarmorA
if %armortype% EQU Platinum goto alreadyequipINVA
set armortype=Platinum
set skindA=Set
set aan=a
goto confirmequipINVA

:confirmequipINVA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have equipped %armortype% %skindA%.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto confirmequipINVA

:noarmorA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You don't have that Armor.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto noarmorA


:alreadyequipINVA
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You already have that armor equipped.
echo %linevar%
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto checkitemsIN
)
goto alreadyequipINVA



// MARK: Heal I
:healmenuINV
set backdest=checkitemsIN
cls
mode con cols=48 lines=35
if %select% gtr 5 set select=1
if %select% lss 1 set select=5
set s1=-
set s2=-
set s3=-
set s4=-
set s5=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Health Potion Selection.
echo %linevar%
echo [0m
set s%select%=[90m#[0m[97m
echo [%s1%] Health Potion T1 - 25: %potiont1%[0m
echo [%s2%] Health Potion T2 - 50: %potiont2%[0m
echo [%s3%] Health Potion T3 - 100: %potiont3%[0m
echo.
echo [%s4%] Raid Health Elixer: %raidpot%[0m
echo.
echo %linevar%
echo [%s5%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsad /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" set select=1&goto %backdest%
if "%errorlevel%"=="4" (
if "%select%"=="1" set select=1&goto heal1IVN2
if "%select%"=="2" set select=1&goto heal2IVN2
if "%select%"=="3" set select=1&goto heal3IVN2
if "%select%"=="4" set select=1&goto healraiddIN
if "%select%"=="5" set select=1&goto checkitemsIN
)
goto healmenuINV

:heal1IVN2
if %potiont1% LEQ 0 goto howughINV
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
:heal1IVN
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Health Potion T1 and got...
echo +25 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenuINV
)
goto heal1IVN

:heal2IVN2
if %potiont2% LEQ 0 goto howughINV
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
:heal2IVN
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Health Potion T2 and got...
echo +50 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenuINV
)
goto heal2IVN

:heal3IVN2
if %potiont3% LEQ 0 goto howughINV
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
:heal3IVN
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Health Potion T3 and got...
echo +100 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenuINV
)
goto heal3IVN

:healraiddIN
if %raidpot% LEQ 0 goto howughINV
set /a raidpot=%raidpot%-1
set /a hp=%hp%+500
:healraidIN
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You used a Raid Health Elixer and got...
echo +500 Hp.
echo You now have %hp%.[31mHP[0m
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenuINV
)
goto healraidIN

:howughINV
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo.
echo You do not have that potion...
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto healmenuINV
)
goto howughINV








// MARK: Raid One
:raidnpc1
set destination=raidnpc1
set /a counter=%counter%+1
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 13+1
if %npc% EQU 1 set npctype=Goblin
if %npc% EQU 2 set npctype=Crab
if %npc% EQU 3 set npctype=Buff-Lobster
if %npc% EQU 4 set npctype=Fisherman
if %npc% EQU 5 set npctype=Dave
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Farmer
if %npc% EQU 8 set npctype=Land-Fish
if %npc% EQU 9 set npctype=Boulder
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Thief
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat

:pickstat
set destination=pickstat
set /a stat=%random% %% 5+1
if %stat% EQU 1 set npcstat=Normal
if %stat% EQU 2 set npcstat=Enraged
if %stat% EQU 3 set npcstat=Strong
if %stat% EQU 4 set npcstat=Tough
if %stat% EQU 5 set npcstat=Weak

:BATTLE_VARIABLESRAID
if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_STARTRAID
)
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_STARTRAID
)
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_STARTRAID
)
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_STARTRAID
)
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_STARTRAID
)
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_STARTRAID
)
if %levell% LEQ 35 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_STARTRAID
)
if %levell% LEQ 40 (
set /a health=%random% %% 100 + 1025
set /a level=%random% %% 20 + 35
goto F_STARTRAID
)
if %levell% LEQ 45 (
set /a health=%random% %% 100 + 1150
set /a level=%random% %% 25 + 40
goto F_STARTRAID
)
if %levell% LEQ 50 (
set /a health=%random% %% 100 + 1275
set /a level=%random% %% 30 + 45
goto F_STARTRAID
)
if %levell% LEQ 55 (
set /a health=%random% %% 100 + 1400
set /a level=%random% %% 35 + 50
goto F_STARTRAID
)
if %levell% LEQ 60 (
set /a health=%random% %% 100 + 1525
set /a level=%random% %% 40 + 55
goto F_STARTRAID
)
if %levell% LEQ 65 (
set /a health=%random% %% 100 + 1650
set /a level=%random% %% 45 + 60
goto F_STARTRAID
)
if %levell% LEQ 70 (
set /a health=%random% %% 100 + 1775
set /a level=%random% %% 50 + 65
goto F_STARTRAID
)
if %levell% LEQ 75 (
set /a health=%random% %% 100 + 1900
set /a level=%random% %% 55 + 70
goto F_STARTRAID
)
if %levell% LEQ 80 (
set /a health=%random% %% 100 + 2025
set /a level=%random% %% 60 + 75
goto F_STARTRAID
)
if %levell% LEQ 85 (
set /a health=%random% %% 100 + 2150
set /a level=%random% %% 65 + 80
goto F_STARTRAID
)
if %levell% LEQ 90 (
set /a health=%random% %% 100 + 2275
set /a level=%random% %% 70 + 85
goto F_STARTRAID
)
if %levell% LEQ 95 (
set /a health=%random% %% 100 + 2400
set /a level=%random% %% 75 + 90
goto F_STARTRAID
)
if %levell% LEQ 100 (
set /a health=%random% %% 100 + 2525
set /a level=%random% %% 80 + 95
goto F_STARTRAID
)
if %levell% LEQ 105 (
set /a health=%random% %% 100 + 2650
set /a level=%random% %% 85 + 100
goto F_STARTRAID
)
if %levell% LEQ 110 (
set /a health=%random% %% 100 + 2875
set /a level=%random% %% 90 + 105
goto F_STARTRAID
)
if %levell% LEQ 115 (
set /a health=%random% %% 100 + 3100
set /a level=%random% %% 95 + 110
goto F_STARTRAID
)
if %levell% LEQ 120 (
set /a health=%random% %% 100 + 3225
set /a level=%random% %% 100 + 115
goto F_STARTRAID
)
if %levell% LEQ 125 (
set /a health=%random% %% 100 + 3350
set /a level=%random% %% 105 + 120
goto F_STARTRAID
)
if %levell% LEQ 130 (
set /a health=%random% %% 100 + 3475
set /a level=%random% %% 110 + 125
goto F_STARTRAID
)
if %levell% LEQ 135 (
set /a health=%random% %% 100 + 3600
set /a level=%random% %% 115 + 130
goto F_STARTRAID
)
if %levell% LEQ 140 (
set /a health=%random% %% 100 + 3725
set /a level=%random% %% 120 + 135
goto F_STARTRAID
)
if %levell% LEQ 145 (
set /a health=%random% %% 100 + 3850
set /a level=%random% %% 125 + 140
goto F_STARTRAID
)
if %levell% LEQ 150 (
set /a health=%random% %% 100 + 3975
set /a level=%random% %% 130 + 145
goto F_STARTRAID
)
if %levell% LEQ 155 (
set /a health=%random% %% 100 + 4200
set /a level=%random% %% 130 + 145
goto F_STARTRAID
)
if %levell% LEQ 160 (
set /a health=%random% %% 100 + 4325
set /a level=%random% %% 135 + 150
goto F_STARTRAID
)
if %levell% LEQ 165 (
set /a health=%random% %% 100 + 4450
set /a level=%random% %% 140 + 155
goto F_STARTRAID
)
if %levell% LEQ 170 (
set /a health=%random% %% 100 + 4575
set /a level=%random% %% 145 + 160
goto F_STARTRAID
)
if %levell% LEQ 175 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 150 + 165
goto F_STARTRAID
)
if %levell% LEQ 180 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 155 + 170
goto F_STARTRAID
)
if %levell% LEQ 185 (
set /a health=%random% %% 100 + 4825
set /a level=%random% %% 160 + 175
goto F_STARTRAID
)
if %levell% LEQ 190 (
set /a health=%random% %% 100 + 4950
set /a level=%random% %% 165 + 180
goto F_STARTRAID
)
if %levell% LEQ 195 (
set /a health=%random% %% 100 + 5075
set /a level=%random% %% 170 + 185
goto F_STARTRAID
)
if %levell% LEQ 200 (
set /a health=%random% %% 100 + 5200
set /a level=%random% %% 175 + 190
goto F_STARTRAID
)
if %levell% LEQ 205 (
set /a health=%random% %% 100 + 5325
set /a level=%random% %% 180 + 195
goto F_STARTRAID
)
if %levell% LEQ 210 (
set /a health=%random% %% 100 + 5450
set /a level=%random% %% 185 + 200
goto F_STARTRAID
)
if %levell% LEQ 215 (
set /a health=%random% %% 100 + 5575
set /a level=%random% %% 190 + 200
goto F_STARTRAID
)
if %levell% LEQ 220 (
set /a health=%random% %% 100 + 5700
set /a level=%random% %% 195 + 205
goto F_STARTRAID
)
if %levell% LEQ 225 (
set /a health=%random% %% 100 + 5825
set /a level=%random% %% 200 + 210
)
goto F_STARTRAID


:F_STARTRAID
set destination=F_STARTRAID
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Raid and...
echo encounter a level %level% %npcstat% %npctype%.
echo.
echo %linevar%
ping localhost -n 2 >nul
if %npcstat% equ Quick goto fs3RAID
goto fs1RAID


:fs1RAID
set destination=fs1RAID
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Quick Item[0m
echo [%s3%] Flee[0m
echo.
echo Round %counter%
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atk_chooseRAID
if "%select%"=="2" goto quickitemRAID
if "%select%"=="3" set select=1&goto flee
)
goto fs1RAID

:atk_chooseRAID
if %health% LEQ 0 goto checkiflvlup
set destination=atk_chooseRAID
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Main Weapon[0m
echo [%s2%] Back[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" goto atkRAID
if "%select%"=="2" goto fs1RAID
)
goto atk_chooseRAID

:quickitemRAID
if %quickitem% EQU raidpot (
if %raidpot% LEQ 0 goto fs1RAID
set /a raidpot=%raidpot%-1
set /a hp=%hp%+500
goto fs1RIAD
)

:quickitemRAID
if %quickitem% EQU hpot1 (
if %potiont1% LEQ 0 goto fs1RAID
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
goto fs1RAID
)

:quickitemRAID
if %quickitem% EQU hpot2 (
if %potiont2% LEQ 0 goto fs1RAID
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
goto fs1RAID
)

:quickitemRAID
if %quickitem% EQU hpot3 (
if %potiont3% LEQ 0 goto fs1RAID
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
goto fs1RAID
)

if %quickitem% EQU none (
goto fs1RAID
)
set errornum=WANDER-ITEMQ-SB
goto error404

:atkRAID
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
set destination=atkRAID
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %artifacttype% EQU Storm set /a damage=%damage%+%random%*100/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the %npcstat% %npctype%!
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npcstat% %npctype%^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause>nul
if %hp% LEQ 0 goto die
if %health% LEQ 0 goto dropitemRAID
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAID
goto fs3RAID
)
goto fs3RAID

:fs3RAID
set destination=fs3RAID
if %npctype% EQU Rat set /a dmgnpc=%random%*23/32767+1
if %npctype% EQU Goblin set /a dmgnpc=%random%*30/32767+1
if %npctype% EQU Crab set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Buff-Lobster set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Fisherman set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Dave set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*50/32767+1
if %npctype% EQU Farmer set /a dmgnpc=%random%*85/32767+1
if %npctype% EQU Land-Fish set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*111/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Thief set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*360/32767+1
if %npcstat% EQU if %dmgnpc% GTR 50 Weak set /a dmgnpc=%damage%-50
if %npcstat% EQU if %health% GTR 50 Weak set /a health=%health%-50
if %npcstat% EQU Enraged set /a dmgnpc=%damage%+85
if %npcstat% EQU Strong set /a dmgnpc=%damage%+50

if %dmgnpc% LSS 0 set dmgnpc=0

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The %npcstat% %npctype% attacks.
ping localhost -n 2 >nul
echo The %npcstat% %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAID
goto fs1RAID
)
goto fs1RAID


:checkiflvlupRAID
set destination=checkiflvlupRAID
if %playerxp% GTR %origxp% goto levelupRAID



:dropitemRAID
set destination=dropitemRAID
if %npctype% EQU Goblin goto goblindropRAID
if %npctype% EQU Crab goto CrabdropRAID
if %npctype% EQU Buff-Lobster goto Buff-LobsterdropRAID
if %npctype% EQU Fisherman goto FishermandropRAID
if %npctype% EQU Dave goto DavedropRAID
if %npctype% EQU Human goto humandropRAID
if %npctype% EQU Farmer goto farmerdropRAID
if %npctype% EQU Land-Fish goto Land-FishdropRAID
if %npctype% EQU Boulder goto BoulderdropRAID
if %npctype% EQU Corrupted goto CorrupteddropRAID
if %npctype% EQU Thief goto ThiefdropRAID
if %npctype% EQU Bob goto BobdropRAID
if %npctype% EQU Rat goto Land-FishdropRAID

::set /a gmail=%gmail%+1
:goblindropRAID
set destination=golbindropRAID
set word=1
set drop=Goblin Mail
set /a gmail=%gmail%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+100
goto win

:CrabdropRAID
set destination=CrabdropRAID
set word=3
set drop=Crab Legs
set /a clegs=%clegs%+3
set /a gold=%gold%+2
set /a qc1=%qc1%+1
set /a playerxp=%playerxp%+122
goto nextprtRAID

:Buff-LobsterdropRAID
set destination=Buff-LobsterdropRAID
set word=1
set drop=Buff-Lobster Claws
set /a bufflegs=%bufflegs%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+100
goto nextprtRAID

:FishermandropRAID
set destination=FishermandropRAID
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+122
goto nextprtRAID

:DavedropRAID
set destination=DavedropRAID
set word=1
set drop=Dave Brain fragment
set /a dbrain=%dbrain%+1
set /a gold=%gold%+7
set /a playerxp=%playerxp%+300
goto nextprtRAID

:humandropRAID
set destination=humandropRAID
set word=1
set drop=Human Skin
set /a skin=%skin%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+150
goto nextprtRAID

:farmerdropRAID
set destination=farmerdropRAID
set word=3
set drop=Seeds
set /a seeds=%seeds%+3
set /a gold=%gold%+1
set /a playerxp=%playerxp%+20
goto nextprtRAID

:Land-FishdropRAID
set destination=Land-FishdropRAID
set word=1
set drop=Fish Fins
set /a fins=%fins%+1
set /a gold=%gold%+2
set /a playerxp=%playerxp%+10
goto nextprtRAID

:BoulderdropRAID
set destination=BoulderdropRAID
set word=3
set drop=Rocks
set /a rocks=%rocks%+3
set /a gold=%gold%+7
set /a playerxp=%playerxp%+100
goto nextprtRAID

:CorrupteddropRAID
set destination=CorrupteddropRAID
set word=1
set drop=Corrupted Shard
set /a cshard=%cshard%+1
set /a gold=%gold%+10
set /a playerxp=%playerxp%+250
goto nextprtRAID

:ThiefdropRAID
set destination=ThiefdropRAID
set word=2
set drop=Old Coins
set /a ocoins=%ocoins%+2
set /a gold=%gold%+25
set /a playerxp=%playerxp%+100
goto nextprtRAID

:BobdropRAID
set destination=BobdropRAID
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
set /a gold=%gold%+50
set /a playerxp=%playerxp%+285
goto nextprtRAID


:levelupRAID
set destination=levelupRAID-2
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+100
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelupRAID-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto n
)
goto levelupRAID-2

:testllvRAID
if %health% LEQ 0 goto test2RAID
goto fs1RAID
:test2RAID
if %levell% LEQ 10 goto dropitemRAID
if NOT %levell% LEQ 10 goto fs1RAID
goto dropitemRAID

:nextprtRAID
if %counter% LSS 3 goto raidnpc1
if %counter% GEQ 3 goto raidnpcBOSS
set errornum=RAID-R1
goto error404

// MARK: Raid One BOSS
:raidnpcBOSS
set destination=raidnpcBOSS
if %hp% EQU 0 goto MENU
set count=1

:BATTLE_VARIABLESRAIDBOSS
set destination=BATTLE_VARIABLESRAIDBOSS
set /a health=1500
set /a level=25
goto F_STARTRAIDBOSS


:F_STARTRAIDBOSS
set destination=F_STARTRAIDBOSS
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Boss Room and...
echo encounter a level %level% Hive-Mind-Giant.
echo.
echo %linevar%
ping localhost -n 2 >nul
goto fs1RAIDBOSS


:fs1RAIDBOSS
set destination=fs1RAIDBOSS
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mHive-Mind-Giant[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Quick Item[0m
echo [%s3%] Flee[0m
echo.
echo Raid Boss Battle
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atk_chooseRAIDBOSS
if "%select%"=="2" goto quickitemRAIDBOSS
if "%select%"=="3" set select=1&goto flee
)
goto fs1RAIDBOSS

:atk_chooseRAIDBOSS
if %health% LEQ 0 goto checkiflvlup
set destination=atk_chooseRAIDBOSS
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Main Weapon[0m
echo [%s2%] Back[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" goto atkRAIDBOSS
if "%select%"=="2" goto fs1RAIDBOSS
)
goto atk_chooseRAIDBOSS

:quickitemRAIDBOSS
if %quickitem% EQU raidpot (
if %raidpot% LEQ 0 goto fs1RAIDBOSS
set /a raidpot=%raidpot%-1
set /a hp=%hp%+500
goto fs1RAIDBOSS
)

:quickitemRAIDBOSS
if %quickitem% EQU hpot1 (
if %potiont1% LEQ 0 goto fs1RAIDBOSS
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
goto fs1RAIDBOSS
)

:quickitemRAIDBOSS
if %quickitem% EQU hpot2 (
if %potiont2% LEQ 0 goto fs1RAIDBOSS
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
goto fs1RAIDBOSS
)

:quickitemRAIDBOSS
if %quickitem% EQU hpot3 (
if %potiont3% LEQ 0 goto fs1RAIDBOSS
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
goto fs1RAIDBOSS
)

if %quickitem% EQU none (
goto fs1RAIDBOSS
)
set errornum=WANDER-ITEMQ-SB
goto error404

:atkRAIDBOSS
set destination=atkRAIDBOSS
if %swordtype% EQU Your set /a damage=%random%*0/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %artifacttype% EQU Storm set /a damage=%damage%+%random%*100/32767+1
if %npcstat% EQU Tough if not %damage% LEQ 85 set /a damage=%damage%-85
if %damage% GTR %health% set /a damage=%health%

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mHive-Mind-Giant[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the Hive-Mind-Giant!
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the Hive-Mind-Giant^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause>nul
if %health% LEQ 0 goto dropitemRAIDBOSS
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDBOSS
goto fs3RAIDBOSS
)


:fs3RAIDBOSS
set destination=fs3RAIDBOSS
set /a dmgnpc=%random%*305/32767+1
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
if %swordtype% EQU Necrosis set /a orighp=%orighp%+1

if %armortype% EQU Steel set /a dmgnpc=%dmgnpc%-8
if %armortype% EQU Titanium set /a  dmgnpc=%dmgnpc%-25
if %armortype% EQU Platinum set /a  dmgnpc=%dmgnpc%-100

if %dmgnpc% LSS 0 set dmgnpc=0
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mHive-Mind-Giant[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The Hive-Mind-Giant attacks.
ping localhost -n 2 >nul
echo The Hive-Mind-Giant deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %hp% LEQ 0 goto die
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDBOSS
goto fs1RAIDBOSS
)
goto fs1RAIDBOSS


:checkiflvlupRAIDBOSS
set destination=checkiflvlupRAIDBOSS
if %playerxp% GTR %origxp% goto levelupRAIDBOSS



:dropitemRAIDBOSS
set destination=dropitemRAIDBOSS
goto BossDrop1

::set /a gmail=%gmail%+1
:BossDrop1
set destination=BossDrop1
set word=1
set drop=Dungeon Chest
set /a dchest=%dchest%+1
set /a gold=%gold%+345
set /a playerxp=%playerxp%+500
goto winBOSS

:levelupRAIDBOSS
set destination=levelupRAIDBOSS-2
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+100
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelupRAIDBOSS-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllvRAIDBOSS
)
goto levelupRAIDBOSS-2

:testllvRAIDBOSS
if %health% LEQ 0 goto test2RAIDBOSS
goto fs1RAIDBOSS
:test2RAIDBOSS
if %levell% LEQ 10 goto dropitemRAIDBOSS
if NOT %levell% LEQ 10 goto fs1RAIDBOSS
goto dropitemRAIDBOSS


:winBOSS
set destination=winBOSS-2
set /a counter=0
if %as% EQU Online goto SAVE_GAME_FILES
:winBOSS-2
set /a hp=%orighp%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Congrats Adventurer!
echo %linevar%
echo.
echo You won the battle against the Hive-Mind-Giant.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto MENU
)
goto winBOSS-2






// MARK: Odd Crypt
:picknpc3
title StormTides Byte - Odd Crypt
set destination=picknpc3
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 14+1
if %npc% EQU 1 set npctype=Giant-Spider
if %npc% EQU 2 set npctype=Mutant-Wolf
if %npc% EQU 3 set npctype=Wolf
if %npc% EQU 4 set npctype=John
if %npc% EQU 5 set npctype=Bear
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Mites
if %npc% EQU 8 set npctype=Zombie-Chiken
if %npc% EQU 9 set npctype=Boulder
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Thief
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat
if %npc% EQU 14 set npctype=Dungeon-Duck

:pickstat
set destination=pickstat
set /a stat=%random% %% 20+1
if %stat% EQU 1 set npcstat=Normal
if %stat% EQU 2 set npcstat=Enraged
if %stat% EQU 3 set npcstat=Strong
if %stat% EQU 4 set npcstat=Tough
if %stat% EQU 5 set npcstat=Weak
if %stat% EQU 6 set npcstat=[31mINVERTED[0m
if %stat% EQU 7 set npcstat=Normal
if %stat% EQU 8 set npcstat=Normal
if %stat% EQU 9 set npcstat=Normal
if %stat% EQU 10 set npcstat=Normal
if %stat% EQU 11 set npcstat=Normal
if %stat% EQU 12 set npcstat=Enraged
if %stat% EQU 13 set npcstat=Strong
if %stat% EQU 14 set npcstat=Tough
if %stat% EQU 15 set npcstat=Weak
if %stat% EQU 16 set npcstat=Normal
if %stat% EQU 17 set npcstat=Enraged
if %stat% EQU 18 set npcstat=Strong
if %stat% EQU 19 set npcstat=Tough
if %stat% EQU 20 set npcstat=Weak

if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_START2
)
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_START2
)
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_START2
)
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_START2
)
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_START2
)
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_START2
)
if %levell% LEQ 35 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_START2
)
if %levell% LEQ 40 (
set /a health=%random% %% 100 + 1025
set /a level=%random% %% 20 + 35
goto F_START2
)
if %levell% LEQ 45 (
set /a health=%random% %% 100 + 1150
set /a level=%random% %% 25 + 40
goto F_START2
)
if %levell% LEQ 50 (
set /a health=%random% %% 100 + 1275
set /a level=%random% %% 30 + 45
goto F_START2
)
if %levell% LEQ 55 (
set /a health=%random% %% 100 + 1400
set /a level=%random% %% 35 + 50
goto F_START2
)
if %levell% LEQ 60 (
set /a health=%random% %% 100 + 1525
set /a level=%random% %% 40 + 55
goto F_START2
)
if %levell% LEQ 65 (
set /a health=%random% %% 100 + 1650
set /a level=%random% %% 45 + 60
goto F_START2
)
if %levell% LEQ 70 (
set /a health=%random% %% 100 + 1775
set /a level=%random% %% 50 + 65
goto F_START2
)
if %levell% LEQ 75 (
set /a health=%random% %% 100 + 1900
set /a level=%random% %% 55 + 70
goto F_START2
)
if %levell% LEQ 80 (
set /a health=%random% %% 100 + 2025
set /a level=%random% %% 60 + 75
goto F_START2
)
if %levell% LEQ 85 (
set /a health=%random% %% 100 + 2150
set /a level=%random% %% 65 + 80
goto F_START2
)
if %levell% LEQ 90 (
set /a health=%random% %% 100 + 2275
set /a level=%random% %% 70 + 85
goto F_START2
)
if %levell% LEQ 95 (
set /a health=%random% %% 100 + 2400
set /a level=%random% %% 75 + 90
goto F_START2
)
if %levell% LEQ 100 (
set /a health=%random% %% 100 + 2525
set /a level=%random% %% 80 + 95
goto F_START2
)
if %levell% LEQ 105 (
set /a health=%random% %% 100 + 2650
set /a level=%random% %% 85 + 100
goto F_START2
)
if %levell% LEQ 110 (
set /a health=%random% %% 100 + 2875
set /a level=%random% %% 90 + 105
goto F_START2
)
if %levell% LEQ 115 (
set /a health=%random% %% 100 + 3100
set /a level=%random% %% 95 + 110
goto F_START2
)
if %levell% LEQ 120 (
set /a health=%random% %% 100 + 3225
set /a level=%random% %% 100 + 115
goto F_START2
)
if %levell% LEQ 125 (
set /a health=%random% %% 100 + 3350
set /a level=%random% %% 105 + 120
goto F_START2
)
if %levell% LEQ 130 (
set /a health=%random% %% 100 + 3475
set /a level=%random% %% 110 + 125
goto F_START2
)
if %levell% LEQ 135 (
set /a health=%random% %% 100 + 3600
set /a level=%random% %% 115 + 130
goto F_START2
)
if %levell% LEQ 140 (
set /a health=%random% %% 100 + 3725
set /a level=%random% %% 120 + 135
goto F_START2
)
if %levell% LEQ 145 (
set /a health=%random% %% 100 + 3850
set /a level=%random% %% 125 + 140
goto F_START2
)
if %levell% LEQ 150 (
set /a health=%random% %% 100 + 3975
set /a level=%random% %% 130 + 145
goto F_START2
)
if %levell% LEQ 155 (
set /a health=%random% %% 100 + 4200
set /a level=%random% %% 130 + 145
goto F_START2
)
if %levell% LEQ 160 (
set /a health=%random% %% 100 + 4325
set /a level=%random% %% 135 + 150
goto F_START2
)
if %levell% LEQ 165 (
set /a health=%random% %% 100 + 4450
set /a level=%random% %% 140 + 155
goto F_START2
)
if %levell% LEQ 170 (
set /a health=%random% %% 100 + 4575
set /a level=%random% %% 145 + 160
goto F_START2
)
if %levell% LEQ 175 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 150 + 165
goto F_START2
)
if %levell% LEQ 180 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 155 + 170
goto F_START2
)
if %levell% LEQ 185 (
set /a health=%random% %% 100 + 4825
set /a level=%random% %% 160 + 175
goto F_START2
)
if %levell% LEQ 190 (
set /a health=%random% %% 100 + 4950
set /a level=%random% %% 165 + 180
goto F_START2
)
if %levell% LEQ 195 (
set /a health=%random% %% 100 + 5075
set /a level=%random% %% 170 + 185
goto F_START2
)
if %levell% LEQ 200 (
set /a health=%random% %% 100 + 5200
set /a level=%random% %% 175 + 190
goto F_START2
)
if %levell% LEQ 205 (
set /a health=%random% %% 100 + 5325
set /a level=%random% %% 180 + 195
goto F_START2
)
if %levell% LEQ 210 (
set /a health=%random% %% 100 + 5450
set /a level=%random% %% 185 + 200
goto F_START2
)
if %levell% LEQ 215 (
set /a health=%random% %% 100 + 5575
set /a level=%random% %% 190 + 200
goto F_START2
)
if %levell% LEQ 220 (
set /a health=%random% %% 100 + 5700
set /a level=%random% %% 195 + 205
goto F_START2
)
if %levell% LEQ 225 (
set /a health=%random% %% 100 + 5825
set /a level=%random% %% 200 + 210
goto F_START2
)
F_START3

:F_START3
if %npcstat% EQU Tough set /a health=%health%+200
set destination=F_START3
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Odd Crypt and...
echo encounter a level %level% %npcstat%  %npctype%.
echo.
echo %linevar%
pause >nul
if %npcstat% equ Quick goto fs3-3
goto fs1-3


:fs1-3
if %health% LEQ 0 goto checkiflvlup3
set destination=fs1-3
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo.
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Quick Item[0m
echo [%s3%] Flee[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atk_choose-3
if "%select%"=="2" if %npctype% EQU Dungeon-Duck set select=1&goto offer3
if "%select%"=="2" if not %npctype% EQU Dungeon-Duck goto quickitem-3
if "%select%"=="3" set select=1&goto flee
)
goto fs1-3

:offer3
if %health% LEQ 0 goto checkiflvlup
set destination=fs1
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo The Dunegon Duck requires an offering.
echo What shall you slide it's way?
echo [0m
echo [%s1%] Offer 5 Seeds: %seeds%[0m
echo [%s2%] Offer 1,000 Gold: %gold%[0m
echo [%s3%] Surrender[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" if %seeds% GEQ 5 set select=1&goto chance13
if "%select%"=="2" if %gold% GEQ 1000 set select=1&goto chance23
if "%select%"=="3" goto chance33
)
goto offer

:chance13
set /a chance=%random% %% 7+1
if %chance% EQU 1 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 2 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 3 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 4 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 5 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 6 set /a seeds=%seeds%-5&goto fleeD
if %chance% EQU 7 goto fs3-3

:chance23
set /a chance=%random% %% 5+1
if %chance% EQU 1 goto fs3-3
if %chance% EQU 2 goto fs3-3
if %chance% EQU 3 goto fs3-3
if %chance% EQU 4 goto fs3-3
if %chance% EQU 5 goto fleeD

:chance33
set /a chance=%random% %% 4+1
if %chance% EQU 1 goto fs3-3
if %chance% EQU 2 goto fs3-3
if %chance% EQU 3 goto fs3-3
if %chance% EQU 4 goto fleeD

:atk_choose-3
if %health% LEQ 0 goto checkiflvlup
set destination=atk_choose-3
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Main Weapon[0m
echo [%s2%] Spellbook [[31mComing Soon[0m][0m
echo [%s2%] Back[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" goto atk3
if "%select%"=="2" goto atk_choose-3
if "%select%"=="3" goto fs1-3
)
goto atk_choose-3

:quickitem-3
if %quickitem% EQU raidpot (
if %raidpot% LEQ 0 goto fs1-3
set /a raidpot=%raidpot%-1
set /a hp=%hp%+500
goto fs1-3
)

:quickitem-3
if %quickitem% EQU hpot1 (
if %potiont1% LEQ 0 goto fs1-3
set /a potiont1=%potiont1%-1
set /a hp=%hp%+25
goto fs1-3
)

:quickitem-3
if %quickitem% EQU hpot2 (
if %potiont2% LEQ 0 goto fs1-3
set /a potiont2=%potiont2%-1
set /a hp=%hp%+50
goto fs1-3
)

:quickitem-3
if %quickitem% EQU hpot3 (
if %potiont3% LEQ 0 goto fs1-3
set /a potiont3=%potiont3%-1
set /a hp=%hp%+100
goto fs1-3
)

if %quickitem% EQU none (
goto fs1-3
)
set errornum=WANDER-ITEMQ-SB
goto error404

:atk3
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
set destination=atk3
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %artifacttype% EQU Storm set /a damage=%damage%+%random%*100/32767+1
if %damage% GTR %health% set /a damage=%health%

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the %npcstat% %npctype%!
echo.
set /a atkxp=((%damage%/4)*%xpmul%+2)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npcstat% %npctype%^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause>nul
if %hp% LEQ 0 goto die
if %health% LEQ 0 goto dropitem3
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup3
goto fs3-3
)



:fs3-3
set destination=fs3-3
if %npctype% EQU Rat set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Giant-Spider set /a dmgnpc=%random%*68/32767+1
if %npctype% EQU Mutant-Wolf set /a dmgnpc=%random%*65/32767+1
if %npctype% EQU Wolf set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU John set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Bear set /a dmgnpc=%random%*110/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Mites set /a dmgnpc=%random%*105/32767+1
if %npctype% EQU Zombie-Chiken set /a dmgnpc=%random%*98/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*155/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*380/32767+1
if %npctype% EQU Thief set /a dmgnpc=%random%*325/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*415/32767+1
if %npctype% EQU Dungeon-Duck set /a dmgnpc=%random%*10000/32767+1
if %npcstat% EQU if %dmgnpc% GTR 50 Weak set /a dmgnpc=%damage%-50
if %npcstat% EQU if %health% GTR 50 Weak set /a health=%health%-50
if %npcstat% EQU Enraged set /a dmgnpc=%damage%+85
if %npcstat% EQU Strong set /a dmgnpc=%damage%+50
if %npcstat% EQU [31mINVERTED[0m set /a dmgnpc=20000
if %npctype% EQU Dungeon-Duck set npcstat=[31mINVERTED[0m

if %dmgnpc% LSS 0 set dmgnpc=0

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The %npcstat% %npctype% attacks.
echo The %npcstat% %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup3
goto fs1-3
)
goto fs1-3


:checkiflvlup3
set destination=checkiflvlup3
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelup3
)




:dropitem3
set destination=dropitem3
if %npctype% EQU Giant-Spider goto Giant-Spiderdrop3
if %npctype% EQU Mutant-Wolf goto Mutant-Wolfdrop3
if %npctype% EQU Wolf goto Wolfdrop3
if %npctype% EQU John goto Johndrop3
if %npctype% EQU Bear goto Beardrop3
if %npctype% EQU Human goto humandrop3
if %npctype% EQU Mites goto Mitesdrop3
if %npctype% EQU Zombie-Chiken goto Zombie-Chikendrop3
if %npctype% EQU Boulder goto Boulderdrop3
if %npctype% EQU Corrupted goto Corrupteddrop3
if %npctype% EQU Thief goto Thiefdrop3
if %npctype% EQU Bob goto Bobdrop3
if %npctype% EQU Rat goto Zombie-Chikendrop3

::set /a gmail=%gmail%+1
:Giant-Spiderdrop3
set destination=Giant-Spiderdrop3
set word=1
set drop=Spider Fang
set /a fangs=%fangs%+1
set /a playerxp=%playerxp%+200
goto winOCC

:Mutant-Wolfdrop3
set destination=Mutant-Wolfdrop3
set word=1
set drop=Mutant Pelt
set /a pelt=%pelt%+1
set /a playerxp=%playerxp%+211
goto winOCC

:Wolfdrop3
set destination=Wolfdrop3
set word=2
set drop=Pelts
set /a pelt2=%pelt2%+2
set /a playerxp=%playerxp%+150
goto winOCC

:Johndrop3
set destination=Johndrop3
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
set /a playerxp=%playerxp%+150
goto winOCC

:Beardrop3
set destination=Beardrop3
set word=3
set drop=pelt
set /a pelt2=%pelt2%+3
set /a playerxp=%playerxp%+178
goto winOCC

:humandrop3
set destination=humandrop3
set word=1
set drop=Human Skin
set /a skin=%skin%+1
set /a playerxp=%playerxp%+200
goto winV

:Mitesdrop3
set destination=Mitesdrop3
set word=1
set drop= Seed
set /a seeds=%seeds%+1
set /a playerxp=%playerxp%+11
goto winOCC

:Zombie-Chikendrop3
set destination=Zombie-Chikendrop3
set word=1
set drop=Zombie Feather
set /a zombief=%zombief%+1
set /a playerxp=%playerxp%+125
goto winOCC

:Boulderdrop3
set destination=Boulderdrop3
set word=4
set drop=Rocks
set /a rocks=%rocks%+4
set /a playerxp=%playerxp%+186
goto winOCC

:Corrupteddrop3
set destination=Corrupteddrop3
set word=2
set drop=Corrupted Shard
set /a cshard=%cshard%+2
set /a playerxp=%playerxp%+424
goto winOCC

:Thiefdrop3
set destination=Thiefdrop3
set word=3
set drop=Old Coins
set /a ocoins=%ocoins%+3
set /a playerxp=%playerxp%+200
goto winOCC

:Bobdrop3
set destination=Bobdrop3
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
set /a playerxp=%playerxp%+350
goto winOCC


:levelup3
set destination=levelup3-2
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+325
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelup3-2
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllv3
)
goto levelup3-2

:winOCC
set destination=winOCC
set /a hp=%orighp%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Congrats Adventurer!
echo %linevar%
echo.
echo You won the battle against the %npcstat% %npctype%.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto picknpc3
)
goto winOCC

:testllv3
if %health% LEQ 0 goto test223
goto fs1-3
:test223
if %levell% LEQ 10 goto dropitem3
if NOT %levell% LEQ 10 goto fs1-3
goto dropitem3






// MARK: Raid Two
:raidnpc1-2
set destination=raidnpc1-2
set /a counter=%counter%+1
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 13+1
if %npc% EQU 1 set npctype=Goblin
if %npc% EQU 2 set npctype=Crab
if %npc% EQU 3 set npctype=Buff-Lobster
if %npc% EQU 4 set npctype=Fisherman
if %npc% EQU 5 set npctype=Dave
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Farmer
if %npc% EQU 8 set npctype=Land-Fish
if %npc% EQU 9 set npctype=Boulder
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Thief
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat

:pickstat-2
set destination=pickstat-2
set /a stat=%random% %% 5+1
if %stat% EQU 1 set npcstat=Normal
if %stat% EQU 2 set npcstat=Enraged
if %stat% EQU 3 set npcstat=Strong
if %stat% EQU 4 set npcstat=Tough
if %stat% EQU 5 set npcstat=Weak

:BATTLE_VARIABLESRAID-2
if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_STARTRAID-2
)
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_STARTRAID-2
)
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_STARTRAID-2
)
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_STARTRAID-2
)
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_STARTRAID-2
)
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_STARTRAID-2
)
if %levell% LEQ 35 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_STARTRAID-2
)
if %levell% LEQ 40 (
set /a health=%random% %% 100 + 1025
set /a level=%random% %% 20 + 35
goto F_STARTRAID-2
)
if %levell% LEQ 45 (
set /a health=%random% %% 100 + 1150
set /a level=%random% %% 25 + 40
goto F_STARTRAID-2
)
if %levell% LEQ 50 (
set /a health=%random% %% 100 + 1275
set /a level=%random% %% 30 + 45
goto F_STARTRAID-2
)
if %levell% LEQ 55 (
set /a health=%random% %% 100 + 1400
set /a level=%random% %% 35 + 50
goto F_STARTRAID-2
)
if %levell% LEQ 60 (
set /a health=%random% %% 100 + 1525
set /a level=%random% %% 40 + 55
goto F_STARTRAID-2
)
if %levell% LEQ 65 (
set /a health=%random% %% 100 + 1650
set /a level=%random% %% 45 + 60
goto F_STARTRAID-2
)
if %levell% LEQ 70 (
set /a health=%random% %% 100 + 1775
set /a level=%random% %% 50 + 65
goto F_STARTRAID-2
)
if %levell% LEQ 75 (
set /a health=%random% %% 100 + 1900
set /a level=%random% %% 55 + 70
goto F_STARTRAID-2
)
if %levell% LEQ 80 (
set /a health=%random% %% 100 + 2025
set /a level=%random% %% 60 + 75
goto F_STARTRAID-2
)
if %levell% LEQ 85 (
set /a health=%random% %% 100 + 2150
set /a level=%random% %% 65 + 80
goto F_STARTRAID-2
)
if %levell% LEQ 90 (
set /a health=%random% %% 100 + 2275
set /a level=%random% %% 70 + 85
goto F_STARTRAID-2
)
if %levell% LEQ 95 (
set /a health=%random% %% 100 + 2400
set /a level=%random% %% 75 + 90
goto F_STARTRAID-2
)
if %levell% LEQ 100 (
set /a health=%random% %% 100 + 2525
set /a level=%random% %% 80 + 95
goto F_STARTRAID-2
)
if %levell% LEQ 105 (
set /a health=%random% %% 100 + 2650
set /a level=%random% %% 85 + 100
goto F_STARTRAID-2
)
if %levell% LEQ 110 (
set /a health=%random% %% 100 + 2875
set /a level=%random% %% 90 + 105
goto F_STARTRAID-2
)
if %levell% LEQ 115 (
set /a health=%random% %% 100 + 3100
set /a level=%random% %% 95 + 110
goto F_STARTRAID-2
)
if %levell% LEQ 120 (
set /a health=%random% %% 100 + 3225
set /a level=%random% %% 100 + 115
goto F_STARTRAID-2
)
if %levell% LEQ 125 (
set /a health=%random% %% 100 + 3350
set /a level=%random% %% 105 + 120
goto F_STARTRAID-2
)
if %levell% LEQ 130 (
set /a health=%random% %% 100 + 3475
set /a level=%random% %% 110 + 125
goto F_STARTRAID-2
)
if %levell% LEQ 135 (
set /a health=%random% %% 100 + 3600
set /a level=%random% %% 115 + 130
goto F_STARTRAID-2
)
if %levell% LEQ 140 (
set /a health=%random% %% 100 + 3725
set /a level=%random% %% 120 + 135
goto F_STARTRAID-2
)
if %levell% LEQ 145 (
set /a health=%random% %% 100 + 3850
set /a level=%random% %% 125 + 140
goto F_STARTRAID-2
)
if %levell% LEQ 150 (
set /a health=%random% %% 100 + 3975
set /a level=%random% %% 130 + 145
goto F_STARTRAID-2
)
if %levell% LEQ 155 (
set /a health=%random% %% 100 + 4200
set /a level=%random% %% 130 + 145
goto F_STARTRAID-2
)
if %levell% LEQ 160 (
set /a health=%random% %% 100 + 4325
set /a level=%random% %% 135 + 150
goto F_STARTRAID-2
)
if %levell% LEQ 165 (
set /a health=%random% %% 100 + 4450
set /a level=%random% %% 140 + 155
goto F_STARTRAID-2
)
if %levell% LEQ 170 (
set /a health=%random% %% 100 + 4575
set /a level=%random% %% 145 + 160
goto F_STARTRAID-2
)
if %levell% LEQ 175 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 150 + 165
goto F_STARTRAID-2
)
if %levell% LEQ 180 (
set /a health=%random% %% 100 + 4700
set /a level=%random% %% 155 + 170
goto F_STARTRAID-2
)
if %levell% LEQ 185 (
set /a health=%random% %% 100 + 4825
set /a level=%random% %% 160 + 175
goto F_STARTRAID-2
)
if %levell% LEQ 190 (
set /a health=%random% %% 100 + 4950
set /a level=%random% %% 165 + 180
goto F_STARTRAID-2
)
if %levell% LEQ 195 (
set /a health=%random% %% 100 + 5075
set /a level=%random% %% 170 + 185
goto F_STARTRAID-2
)
if %levell% LEQ 200 (
set /a health=%random% %% 100 + 5200
set /a level=%random% %% 175 + 190
goto F_STARTRAID-2
)
if %levell% LEQ 205 (
set /a health=%random% %% 100 + 5325
set /a level=%random% %% 180 + 195
goto F_STARTRAID-2
)
if %levell% LEQ 210 (
set /a health=%random% %% 100 + 5450
set /a level=%random% %% 185 + 200
goto F_STARTRAID-2
)
if %levell% LEQ 215 (
set /a health=%random% %% 100 + 5575
set /a level=%random% %% 190 + 200
goto F_STARTRAID-2
)
if %levell% LEQ 220 (
set /a health=%random% %% 100 + 5700
set /a level=%random% %% 195 + 205
goto F_STARTRAID-2
)
if %levell% LEQ 225 (
set /a health=%random% %% 100 + 5825
set /a level=%random% %% 200 + 210
)
goto F_STARTRAID-2


:F_STARTRAID-2
if %npcstat% EQU Tough set /a health=%health%+200
set destination=F_STARTRAID-2
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Second Raid and...
echo encounter a level %level% %npcstat% %npctype%.
echo.
echo %linevar%
ping localhost -n 2 >nul
if %npcstat% equ Quick goto fs3RAID-2
goto fs1RAID-2


:fs1RAID-2
set destination=fs1RAID-2
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Flee[0m
echo.
echo Round %counter%
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atkRAID-2
if "%select%"=="2" set select=1&goto flee
)
goto fs1RAID-2


:atkRAID-2
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
set destination=atkRAID-2
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %artifacttype% EQU Storm set /a damage=%damage%+%random%*100/32767+1
if %damage% GTR %health% set /a damage=%health%

if %damage% LSS 0 set /a damage=0
cls
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the %npcstat% %npctype%!
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npcstat% %npctype%^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause>nul
if %hp% LEQ 0 goto die
if %health% LEQ 0 goto dropitemRAID-2
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAID-2
goto fs3RAID-2
)


:fs3RAID-2
set destination=fs3RAID-2
if %npctype% EQU Rat set /a dmgnpc=%random%*23/32767+1
if %npctype% EQU Goblin set /a dmgnpc=%random%*30/32767+1
if %npctype% EQU Crab set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Buff-Lobster set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Fisherman set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Dave set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*50/32767+1
if %npctype% EQU Farmer set /a dmgnpc=%random%*85/32767+1
if %npctype% EQU Land-Fish set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*111/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Thief set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*360/32767+1
if %npcstat% EQU if %dmgnpc% GTR 50 Weak set /a dmgnpc=%damage%-50
if %npcstat% EQU if %health% GTR 50 Weak set /a health=%health%-50
if %npcstat% EQU Enraged set /a dmgnpc=%damage%+85
if %npcstat% EQU Strong set /a dmgnpc=%damage%+50
if %npcstat% EQU Tough set /a health=%health%+100

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The %npcstat% %npctype% attacks.
ping localhost -n 2 >nul
echo The %npcstat% %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAID-2
goto fs1RAID-2
)
goto fs1RAID-2


:checkiflvlupRAID-2
set destination=checkiflvlupRAID-2
if %playerxp% GTR %origxp% goto levelupRAID-2



:dropitemRAID-2
set destination=dropitemRAID-2
if %npctype% EQU Goblin goto golbindropRAID-2
if %npctype% EQU Crab goto CrabdropRAID-2
if %npctype% EQU Buff-Lobster goto Buff-LobsterdropRAID-2
if %npctype% EQU Fisherman goto FishermandropRAID-2
if %npctype% EQU Dave goto DavedropRAID-2
if %npctype% EQU Human goto humandropRAID-2
if %npctype% EQU Farmer goto farmerdropRAID-2
if %npctype% EQU Land-Fish goto Land-FishdropRAID-2
if %npctype% EQU Boulder goto BoulderdropRAID-2
if %npctype% EQU Corrupted goto CorrupteddropRAID-2
if %npctype% EQU Thief goto ThiefdropRAID-2
if %npctype% EQU Bob goto BobdropRAID-2
if %npctype% EQU Rat goto Land-FishdropRAID-2

::set /a gmail=%gmail%+1
:goblindropRAID-2
set destination=golbindropRAID-2
set word=1
set drop=Goblin Mail
set /a gmail=%gmail%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+100
goto nextprtRAID2

:CrabdropRAID-2
set destination=CrabdropRAID-2
set word=3
set drop=Crab Legs
set /a clegs=%clegs%+3
set /a gold=%gold%+2
set /a qc1=%qc1%+1
set /a playerxp=%playerxp%+122
goto nextprtRAID2

:Buff-LobsterdropRAID-2
set destination=Buff-LobsterdropRAID-2
set word=1
set drop=Buff-Lobster Claws
set /a bufflegs=%bufflegs%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+100
goto nextprtRAID2

:FishermandropRAID-2
set destination=FishermandropRAID-2
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+122
goto nextprtRAID2

:DavedropRAID-2
set destination=DavedropRAID-2
set word=1
set drop=Dave Brain fragment
set /a dbrain=%dbrain%+1
set /a gold=%gold%+7
set /a playerxp=%playerxp%+300
goto nextprtRAID2

:humandropRAID-2
set destination=humandropRAID-2
set word=1
set drop=Human Skin
set /a skin=%skin%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+150
goto nextprtRAID2

:farmerdropRAID-2
set destination=farmerdropRAID-2
set word=3
set drop=Seeds
set /a seeds=%seeds%+3
set /a gold=%gold%+1
set /a playerxp=%playerxp%+20
goto nextprtRAID2

:Land-FishdropRAID-2
set destination=Land-FishdropRAID-2
set word=1
set drop=Fish Fins
set /a fins=%fins%+1
set /a gold=%gold%+2
set /a playerxp=%playerxp%+10
goto nextprtRAID2

:BoulderdropRAID-2
set destination=BoulderdropRAID-2
set word=3
set drop=Rocks
set /a rocks=%rocks%+3
set /a gold=%gold%+7
set /a playerxp=%playerxp%+100
goto nextprtRAID2

:CorrupteddropRAID-2
set destination=CorrupteddropRAID-2
set word=1
set drop=Corrupted Shard
set /a cshard=%cshard%+1
set /a gold=%gold%+10
set /a playerxp=%playerxp%+250
goto nextprtRAID2

:ThiefdropRAID-2
set destination=ThiefdropRAID-2
set word=2
set drop=Old Coins
set /a ocoins=%ocoins%+2
set /a gold=%gold%+25
set /a playerxp=%playerxp%+100
goto nextprtRAID2

:BobdropRAID-2
set destination=BobdropRAID-2
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
set /a gold=%gold%+50
set /a playerxp=%playerxp%+285
goto nextprtRAID2


:levelupRAID-2
set destination=levelupRAID-22
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+100
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelupRAID-22
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllvRAID-2
)
goto levelupRAID-22

:testllvRAID-2
if %health% LEQ 0 goto test2RAID-2
goto fs1RAID-2
:test2RAID-2
if %levell% LEQ 10 goto dropitemRAID-2
if NOT %levell% LEQ 10 goto fs1RAID-2
goto dropitemRAID-2

:nextprtRAID2
if %counter% LSS 3 goto raidnpc1-2
if %counter% GEQ 3 goto raidnpcBOSS-2
set errornum=RAID-R2
goto error404

// MARK: Raid Two BOSS
:raidnpcBOSS-2
set /a counter=0
set destination=raidnpcBOSS-2
if %hp% EQU 0 goto MENU

:BATTLE_VARIABLESRAIDBOSS-2
set destination=BATTLE_VARIABLESRAIDBOSS-2
set /a health=3000
set /a level=48
goto F_STARTRAIDBOSS-2


:F_STARTRAIDBOSS-2
set destination=F_STARTRAIDBOSS-2
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Second Boss Room and...
echo encounter a level %level% Shadow Of The Dark.
echo.
echo %linevar%
ping localhost -n 2 >nul
goto fs1RAIDBOSS-2


:fs1RAIDBOSS-2
set destination=fs1RAIDBOSS-2
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mShadow Of The Dark[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Flee[0m
echo.
echo Raid Boss Battle
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atkRAIDBOSS-2
if "%select%"=="2" set select=1&goto flee
)
goto fs1RAIDBOSS-2


:atkRAIDBOSS-2
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
if %swordtype% EQU Necrosis set /a orighp=%orighp%+1
set destination=atkRAIDBOSS-2
if %swordtype% EQU Your set /a damage=%random%*0/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %npcstat% EQU Tough if not %damage% LEQ 85 set /a damage=%damage%-85
if %damage% GTR %health% set /a damage=%health%

cls
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mShadow Of The Dark[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the Shadow Of The Dark!
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the Shadow Of The Dark^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause>nul
if %hp% LEQ 0 goto die
if %health% LEQ 0 goto dropitemRAIDBOSS-2
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDBOSS-2
goto fs3RAIDBOSS-2
)


:fs3RAIDBOSS-2
set destination=fs3RAIDBOSS-2
set /a dmgnpc=%random%*305/32767+1
if %armortype% EQU Steel set /a dmgnpc=%dmgnpc%-8
if %armortype% EQU Titanium set /a  dmgnpc=%dmgnpc%-25
if %armortype% EQU Platinum set /a  dmgnpc=%dmgnpc%-100

if %dmgnpc% LSS 0 set dmgnpc=0

cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mShadow Of The Dark[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The Shadow Of The Dark attacks.
ping localhost -n 2 >nul
echo The Shadow Of The Dark deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDBOSS-2
goto fs1RAIDBOSS-2
)
goto fs1RAIDBOSS-2


:checkiflvlupRAIDBOSS-2
set destination=checkiflvlupRAIDBOSS-2
if %playerxp% GTR %origxp% goto levelupRAIDBOSS-2



:dropitemRAIDBOSS-2
set destination=dropitemRAIDBOSS-2
goto BossDrop1-2

::set /a gmail=%gmail%+1
:BossDrop1-2
set /a dropp=%random% %% 4+1
if %dropp% EQU 1 goto dropp1
if %dropp% EQU 2 goto dropp1
if %dropp% EQU 3 goto dropp1
if %dropp% EQU 4 goto dropp2
goto bossDrop1-2

:dropp1
set destination=BossDrop1-2
set word=1
set drop=Dungeon Chest
set /a dchest=%dchest%+1
set /a gold=%gold%+345
set /a playerxp=%playerxp%+500
goto win

:dropp2
set destination=BossDrop1-2
set word=1
set drop=Raid Health Elixer
set /a dchest=%raidpot%+1
set /a gold=%gold%+345
set /a playerxp=%playerxp%+550
goto win


:winBOSS2
set destination=winBOSS2-2
set /a counter=0
if %as% EQU Online goto SAVE_GAME_FILES
:winBOSS2-2
set /a hp=%orighp%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Congrats Adventurer!
echo %linevar%
echo.
echo You won the battle against the Shadow Of The Dark.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto MENU
)
goto winBOSS2-2

:levelupRAIDBOSS-2
set destination=levelupRAIDBOSS-22
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+100
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelupRAIDBOSS-22
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllvRAIDBOSS-2
)
goto levelupRAIDBOSS-22

:testllvRAIDBOSS-2
if %health% LEQ 0 goto test2RAIDBOSS-2
goto fs1RAIDBOSS-2
:test2RAIDBOSS-2
if %levell% LEQ 10 goto dropitemRAIDBOSS-2
if NOT %levell% LEQ 10 goto fs1RAIDBOSS-2
goto dropitemRAIDBOSS-2


// MARK: Mythic Raid One
:mraidnpc1
set destination=mraidnpc1
set /a counter=%counter%+1
if %hp% EQU 0 goto MENU
set /a npc=%random% %% 13+1
if %npc% EQU 1 set npctype=Goblin
if %npc% EQU 2 set npctype=Crab
if %npc% EQU 3 set npctype=Buff-Lobster
if %npc% EQU 4 set npctype=Fisherman
if %npc% EQU 5 set npctype=Dave
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Farmer
if %npc% EQU 8 set npctype=Land-Fish
if %npc% EQU 9 set npctype=Boulder
if %npc% EQU 10 set npctype=Corrupted
if %npc% EQU 11 set npctype=Thief
if %npc% EQU 12 set npctype=Bob
if %npc% EQU 13 set npctype=Rat

:pickstatm
set destination=pickstatm
set /a stat=%random% %% 5+1
if %stat% EQU 1 set npcstat=Normal
if %stat% EQU 2 set npcstat=Enraged
if %stat% EQU 3 set npcstat=Strong
if %stat% EQU 4 set npcstat=Tough
if %stat% EQU 5 set npcstat=Weak

:BATTLE_VARIABLESRAIDm
if %levell% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_STARTRAIDm )
if %levell% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_STARTRAIDm )
if %levell% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_STARTRAIDm )
if %levell% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_STARTRAIDm )
if %levell% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_STARTRAIDm )
if %levell% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_STARTRAIDm )
if %levell% LEQ 35 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_STARTRAIDm )
if %levell% LEQ 40 (
set /a health=%random% %% 100 + 1025
set /a level=%random% %% 20 + 35
goto F_STARTRAIDm )
if %levell% LEQ 45 (
set /a health=%random% %% 100 + 1150
set /a level=%random% %% 25 + 40
goto F_STARTRAIDm )
if %levell% LEQ 50 (
set /a health=%random% %% 100 + 1275
set /a level=%random% %% 30 + 45
goto F_STARTRAIDm )
if %levell% LEQ 55 (
set /a health=%random% %% 100 + 1400
set /a level=%random% %% 35 + 50
goto F_STARTRAIDm )
if %levell% LEQ 60 (
set /a health=%random% %% 100 + 1525
set /a level=%random% %% 40 + 55
goto F_STARTRAIDm )
if %levell% LEQ 65 (
set /a health=%random% %% 100 + 1650
set /a level=%random% %% 45 + 60
goto F_STARTRAIDm )
if %levell% LEQ 70 (
set /a health=%random% %% 100 + 1775
set /a level=%random% %% 50 + 65
goto F_STARTRAIDm )
if %levell% LEQ 75 (
set /a health=%random% %% 100 + 1900
set /a level=%random% %% 55 + 70
goto F_STARTRAIDm )
if %levell% LEQ 80 (
set /a health=%random% %% 100 + 2025
set /a level=%random% %% 60 + 75
goto F_STARTRAIDm )
if %levell% LEQ 85 (
set /a health=%random% %% 100 + 2150
set /a level=%random% %% 65 + 80
goto F_STARTRAIDm )
if %levell% LEQ 90 (
set /a health=%random% %% 100 + 2275
set /a level=%random% %% 70 + 85
goto F_STARTRAIDm )
if %levell% LEQ 95 (
set /a health=%random% %% 100 + 2400
set /a level=%random% %% 75 + 90
goto F_STARTRAIDm )
if %levell% LEQ 100 (
set /a health=%random% %% 100 + 2525
set /a level=%random% %% 80 + 95
goto F_STARTRAIDm )
if %levell% LEQ 105 (
set /a health=%random% %% 100 + 2650
set /a level=%random% %% 85 + 100
goto F_STARTRAIDm )
if %levell% LEQ 110 (
set /a health=%random% %% 100 + 2875
set /a level=%random% %% 90 + 105
goto F_STARTRAIDm )
if %levell% LEQ 115 (
set /a health=%random% %% 100 + 3100
set /a level=%random% %% 95 + 110
goto F_STARTRAIDm )
if %levell% LEQ 120 (
set /a health=%random% %% 100 + 3225
set /a level=%random% %% 100 + 115
goto F_STARTRAIDm )
if %levell% LEQ 125 (
set /a health=%random% %% 100 + 3350
set /a level=%random% %% 105 + 120
goto F_STARTRAIDm )


:F_STARTRAIDm
if %npcstat% EQU Tough set /a health=%health%+200
set destination=F_STARTRAIDm
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Second Raid and...
echo encounter a level %level% %npcstat% %npctype%.
echo.
echo %linevar%
ping localhost -n 2 >nul
if %npcstat% equ Quick goto fs3RAIDm
goto fs1RAIDm


:fs1RAIDm
set destination=fs1RAIDm
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Flee[0m
echo.
echo Round %counter%
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atkRAIDm
if "%select%"=="2" set select=1&goto flee
)
goto fs1RAIDm


:atkRAIDm
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
set destination=atkRAIDm
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %artifacttype% EQU Storm set /a damage=%damage%+%random%*100/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the %npcstat% %npctype%!
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npcstat% %npctype%^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
pause>nul
if %hp% LEQ 0 goto die
if %health% LEQ 0 goto dropitemRAIDm
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDm
goto fs3RAIDm
)


:fs3RAIDm
set destination=fs3RAIDm
if %npctype% EQU Rat set /a dmgnpc=%random%*23/32767+1
if %npctype% EQU Goblin set /a dmgnpc=%random%*30/32767+1
if %npctype% EQU Crab set /a dmgnpc=%random%*40/32767+1
if %npctype% EQU Buff-Lobster set /a dmgnpc=%random%*80/32767+1
if %npctype% EQU Fisherman set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Dave set /a dmgnpc=%random%*100/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*50/32767+1
if %npctype% EQU Farmer set /a dmgnpc=%random%*85/32767+1
if %npctype% EQU Land-Fish set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Rock set /a dmgnpc=%random%*111/32767+1
if %npctype% EQU Corrupted set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Thief set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Bob set /a dmgnpc=%random%*360/32767+1
if %npcstat% EQU if %dmgnpc% GTR 50 Weak set /a dmgnpc=%damage%-50
if %npcstat% EQU if %health% GTR 50 Weak set /a health=%health%-50
if %npcstat% EQU Enraged set /a dmgnpc=%damage%+85
if %npcstat% EQU Strong set /a dmgnpc=%damage%+50
if %npcstat% EQU Tough set /a health=%health%+100


cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37m%npcstat% %npctype%[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The %npcstat% %npctype% attacks.
ping localhost -n 2 >nul
echo The %npcstat% %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDm
goto fs1RAIDm
)
goto fs1RAIDm


:checkiflvlupRAIDm
set destination=checkiflvlupRAIDm
if %playerxp% GTR %origxp% goto levelupRAIDm



:dropitemRAIDm
set destination=dropitemRAIDm
if %npctype% EQU Goblin goto golbindropRAIDm
if %npctype% EQU Crab goto CrabdropRAIDm
if %npctype% EQU Buff-Lobster goto Buff-LobsterdropRAIDm
if %npctype% EQU Fisherman goto FishermandropRAIDm
if %npctype% EQU Dave goto DavedropRAIDm
if %npctype% EQU Human goto humandropRAIDm
if %npctype% EQU Farmer goto farmerdropRAIDm
if %npctype% EQU Land-Fish goto Land-FishdropRAIDm
if %npctype% EQU Boulder goto BoulderdropRAIDm
if %npctype% EQU Corrupted goto CorrupteddropRAIDm
if %npctype% EQU Thief goto ThiefdropRAIDm
if %npctype% EQU Bob goto BobdropRAIDm
if %npctype% EQU Rat goto Land-FishdropRAIDm

::set /a gmail=%gmail%+1
:golbindropRAIDm
set destination=golbindropRAIDm
set word=1
set drop=Goblin Mail
set /a gmail=%gmail%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+100
goto nextprtRAID3

:CrabdropRAIDm
set destination=CrabdropRAIDm
set word=3
set drop=Crab Legs
set /a clegs=%clegs%+3
set /a gold=%gold%+2
set /a qc1=%qc1%+1
set /a playerxp=%playerxp%+122
goto nextprtRAID3

:Buff-LobsterdropRAIDm
set destination=Buff-LobsterdropRAIDm
set word=1
set drop=Buff-Lobster Claws
set /a bufflegs=%bufflegs%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+100
goto nextprtRAID3

:FishermandropRAIDm
set destination=FishermandropRAIDm
set word=1
set drop=Broken Fishing Pole
set /a bfp=%bfp%+1
set /a gold=%gold%+3
set /a playerxp=%playerxp%+122
goto nextprtRAID3

:DavedropRAIDm
set destination=DavedropRAIDm
set word=1
set drop=Dave Brain fragment
set /a dbrain=%dbrain%+1
set /a gold=%gold%+7
set /a playerxp=%playerxp%+300
goto nextprtRAID3

:humandropRAIDm
set destination=humandropRAIDm
set word=1
set drop=Human Skin
set /a skin=%skin%+1
set /a gold=%gold%+5
set /a playerxp=%playerxp%+150
goto nextprtRAID3

:farmerdropRAIDm
set destination=farmerdropRAIDm
set word=3
set drop=Seeds
set /a seeds=%seeds%+3
set /a gold=%gold%+1
set /a playerxp=%playerxp%+20
goto nextprtRAID3

:Land-FishdropRAIDm
set destination=Land-FishdropRAIDm
set word=1
set drop=Fish Fins
set /a fins=%fins%+1
set /a gold=%gold%+2
set /a playerxp=%playerxp%+10
goto nextprtRAID3

:BoulderdropRAIDm
set destination=BoulderdropRAIDm
set word=3
set drop=Rocks
set /a rocks=%rocks%+3
set /a gold=%gold%+7
set /a playerxp=%playerxp%+100
goto nextprtRAID3

:CorrupteddropRAIDm
set destination=CorrupteddropRAIDm
set word=1
set drop=Corrupted Shard
set /a cshard=%cshard%+1
set /a gold=%gold%+10
set /a playerxp=%playerxp%+250
goto nextprtRAID3

:ThiefdropRAIDm
set destination=ThiefdropRAIDm
set word=2
set drop=Old Coins
set /a ocoins=%ocoins%+2
set /a gold=%gold%+25
set /a playerxp=%playerxp%+100
goto nextprtRAID3

:BobdropRAIDm
set destination=BobdropRAIDm
set word=1
set drop=Bobs Tear
set /a bobst=%bobst%+1
set /a gold=%gold%+50
set /a playerxp=%playerxp%+285
goto nextprtRAID3


:levelupRAIDm
set destination=levelupRAIDm22
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+100
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelupRAIDm22
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllvRAIDm
)
goto levelupRAIDm22

:testllvRAIDm
if %health% LEQ 0 goto test2RAIDm
goto fs1RAIDm
:test2RAIDm
if %levell% LEQ 10 goto dropitemRAIDm
if NOT %levell% LEQ 10 goto fs1RAIDm
goto dropitemRAIDm

:nextprtRAID3
if %counter% LSS 3 goto mraidnpc1
if %counter% GEQ 3 goto raidnpcBOSSm
set errornum=RAID-MR1
goto error404



// MARK: Mythic Raid One BOSS
:raidnpcBOSSm
set /a counter=0
set destination=raidnpcBOSSm
if %hp% EQU 0 goto MENU

:BATTLE_VARIABLESRAIDBOSSm
set destination=BATTLE_VARIABLESRAIDBOSSm
set /a health=5000
set /a level=67
goto F_STARTRAIDBOSSm


:F_STARTRAIDBOSSm
set destination=F_STARTRAIDBOSSm
cls
mode con cols=48 lines=35
echo.
echo %linevar%
echo.
echo You are wandering the Second Boss Room and...
echo encounter a level %level% Mythic Monstrosity.
echo.
echo %linevar%
ping localhost -n 2 >nul
goto fs1RAIDBOSSm


:fs1RAIDBOSSm
set destination=fs1RAIDBOSSm
cls
mode con cols=48 lines=35
if %select% gtr 2 set select=1
if %select% lss 1 set select=2
set s1=-
set s2=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mMythic Monstrosity[0m: %health%.[31mHP[0m
echo %linevar%
echo What would you like to do?
echo [0m
echo [%s1%] Attack[0m
echo [%s2%] Flee[0m
echo.
echo Raid Boss Battle
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:wsmid /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" goto mainmenu
if "%errorlevel%"=="4" goto checkitemsINV
if "%errorlevel%"=="5" (
if "%select%"=="1" set select=1&goto atkRAIDBOSSm
if "%select%"=="2" set select=1&goto flee
)
goto fs1RAIDBOSSm


:atkRAIDBOSSm
if %swordtype% EQU Necrosis set /a hp=%hp%+%random%*250/32767+1
if %swordtype% EQU Necrosis set /a orighp=%orighp%+1
set destination=atkRAIDBOSSm
if %swordtype% EQU Your set /a damage=%random%*0/32767+1
if %swordtype% EQU Plastic set /a damage=%random%*100/32767+1
if %swordtype% EQU Old set /a damage=%random%*118/32767+1
if %swordtype% EQU Refurbished set /a damage=%random%*145/32767+1
if %swordtype% EQU Battle set /a damage=%random%*180/32767+1
if %swordtype% EQU Poison set /a damage=%random%*230/32767+1
if %swordtype% EQU Strong set /a damage=%random%*280/32767+1
if %swordtype% EQU Sharp set /a damage=%random%*310/32767+1
if %swordtype% EQU Warriors set /a damage=%random%*325/32767+1
if %swordtype% EQU Shadow set /a damage=%random%*375/32767+1
if %swordtype% EQU Necrosis set /a damage=%random%*450/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mMythic Monstrosity[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo You attack the Mythic Monstrosity!
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*%xpmul%+1)
set /a playerxp=%playerxp%+%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the Mythic Monstrosity^^!
echo It now has %health%.[31mHP[0m left.
echo.
echo %linevar%
echo +%atkxp% EXP.
if %hp% LEQ 0 goto die
if %health% LEQ 0 goto dropitemRAIDBOSSm
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDBOSSm
goto fs3RAIDBOSSm
)


:fs3RAIDBOSSm
set destination=fs3RAIDBOSSm
set /a dmgnpc=%random%*350/32767+1


cls
mode con cols=48 lines=35
echo %linevar%
echo - Lv.%levell% [37m%Username1%[0m: %hp%.[31mHP[0m
echo - Lv.%level% [37mMythic Monstrosity[0m: %health%.[31mHP[0m
echo %linevar%
echo.
echo The Mythic Monstrosity attacks.
ping localhost -n 2 >nul
echo The Mythic Monstrosity deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo %linevar%
if %hp% LEQ 0 goto die
echo You now have %hp% health left.
pause>nul
if %levell% LSS 225 (
if %playerxp% GTR %origxp% goto levelupRAIDBOSSm
goto fs1RAIDBOSSm
)
goto fs1RAIDBOSSm


:checkiflvlupRAIDBOSSm
set destination=checkiflvlupRAIDBOSSm
if %playerxp% GTR %origxp% goto levelupRAIDBOSSm



:dropitemRAIDBOSSm
set destination=dropitemRAIDBOSSm
goto BossDrop1m

::set /a gmail=%gmail%+1
:BossDrop1m
goto dropp1m
goto BossDrop1m

:dropp1m
set destination=BossDrop1m
set word=10
set drop=Dungeon Chest
set /a dchest=%dchest%+10
set /a gold=%gold%+3345
set /a playerxp=%playerxp%+500
goto win

:dropp2m
set destination=BossDrop1m
set word=1
set drop=Raid Health Elixer
set /a dchest=%raidpot%+1
set /a gold=%gold%+345
set /a playerxp=%playerxp%+550
goto win

:levelupRAIDBOSSm
set destination=levelupRAIDBOSSm22
set /a levell=%levell%+1
set /a ttlvl=%ttlvl%+1
set /a origxp=%origxp%+500
set /a orighp=%orighp%+25
set /a hp=%orighp%
set /a gold=%gold%+100
set /a playerxp=0
if %levell% GEQ 225 set /a levell=225
if %as% EQU Online goto SAVE_GAME_FILES
:levelupRAIDBOSSm22
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo You have leveled up! You are now level %levell%.
echo %linevar%
echo And you now have %hp% health.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto testllvRAIDBOSSm
)
goto levelupRAIDBOSSm22

:testllvRAIDBOSSm
if %health% LEQ 0 goto test2RAIDBOSSm
goto fs1RAIDBOSSm
:test2RAIDBOSSm
if %levell% LEQ 10 goto dropitemRAIDBOSSm
if NOT %levell% LEQ 10 goto fs1RAIDBOSSm
goto dropitemRAIDBOSSm

:winMBOSS
set destination=winMBOSS-2
set /a counter=0
if %as% EQU Online goto SAVE_GAME_FILES
if %swordtype% EQU Necrosis set /a orighp=%orighp%+5
:winMBOSS-2
set /a hp=%orighp%
cls
mode con cols=48 lines=35
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo Congrats Adventurer!
echo %linevar%
echo.
echo You won the battle against the Shadow Of The Dark.
echo And You recieved %word% %drop%.
echo.
echo [%s1%] Okay
echo.
echo %linevar%
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto MENU
)
goto winMBOSS-2
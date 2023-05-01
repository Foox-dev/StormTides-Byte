@echo off
color 0f
title StormTides Byte - Luancher
mode con cols=48 lines=35
setlocal enabledelayedexpansion

if not exist Stormtides_data\lib\boot.config (
(
echo [MAIN_CONFIG]
echo [SAVE_FILE_LOCATION] : 
echo C:\StormTides
echo.
echo [PACKAGES_FOLDER_LOCATION] : 
echo Stormtides_data\bin\packages
echo.
echo [CORE_PROGRAM_LOCATION] :
echo Stormtides_data\bin\core.bat
) > Stormtides_data\lib\boot.config
goto hth
)

< Stormtides_data\lib\boot.config (
set /p null=
set /p null=
set /p dir_path=
set /p null=
set /p null=
set /p pak_path=
set /p null=
set /p null=
set /p crf_path=
)


< Stormtides_data\bin\defaults.config (
set /p null=
set /p null=
set /p autosave_default=
set /p null=
set /p null=
set /p licence_default=
)
< %pak_path%\redr_window-client.pak (
set /p linevar=
set /p linevar2=
set /p linevar3=
)
< %dir_path%\packages\achv_window-save.pak (
set /p unitcount=
set /p unit1=
set /p unit2=
set /p unit3=
set /p unit4=
set /p unit5=
set /p unit6=
)
< %dir_path%\packages\arvc_window-client.pak (
set /p code1=
set /p code2=
set /p code3=
set /p code4=
set /p code5=
)
set select=1
set version=[90mv1.0.1: Early Accses[97m
net use Y: /delete
set msplash=y
set nsplash=y

FOR /F "usebackq tokens=3*" %%A IN (`REG QUERY "HKCU\Console" /v QuickEdit`) DO (
  set quickEditSetting=%%A %%B
)
if %quickEditSetting%==0x1 (
  :: Disable QuickEdit Mode
  reg add HKCU\Console /v QuickEdit /t REG_DWORD /d 0 /f

  :: Open script in a new Command Prompt window
  start "" "%~dpnx0" %* && exit
)

if %licence_default% EQU True START LICENSE.txt

:startgame
color 0f
cls
mode con cols=48 lines=35
if %select% gtr 3 set select=1
if %select% lss 1 set select=3
set s1=-
set s2=-
set s3=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo Welcome to [34mStorm[36mTides[0m  ^|  %version%
echo %linevar2%
echo [0m
echo [%s1%] Play[0m
echo [%s2%] Changelog[0m
echo [%s3%] Credits[0m
echo.
echo %linevar%
if "%msplash%"=="y" echo.
if "%msplash%"=="y" echo Use W,S To Navigate, D To Select
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto start
if "%select%"=="2" set select=1&goto changelog
if "%select%"=="3" set select=1&goto credits
)
goto startgame


:start
CALL %crf_path%
goto startgame

:credits
title StormTides - Credits
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Vault Of Achivments
echo %linevar2%
echo Units Unlocked: %unitcount%/50
echo.
echo [%s1%] Testers[0m
echo [%s2%] Creators[0m
echo [%s3%] Unit Handbook[0m
echo.
echo %linevar%
echo [%s4%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto TestersMenu
if "%select%"=="2" set select=1&goto CreatorsMenu
if "%select%"=="3" set select=1&goto UnitHandbook
if "%select%"=="4" set select=1&goto startgame
)
goto credits

:TestersMenu
title StormTides
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Testers
echo %linevar2%
echo.
echo [32mGrayWolfc[0m [[90m%unit1%[0m]  ^|  [32mRyoto[0m [[90m%unit2%[0m]
echo.
echo [92mShadowCrystals[0m [[90m%unit3%[0m]
echo.
echo [92mJaspersrab[0m [[90m%unit3%[0m]
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto credits
)
goto TestersMenu

:CreatorsMenu
title StormTides
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Creator
echo %linevar2%
echo.
echo [35mFoox[0m [[90m%unit4%[0m]  ^|  [35mTakumi[0m [[90m%unit5%[0m]
echo.
echo [31mD3adVib3Zz[0m [[90m%unit6%[0m]
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto credits
)
goto CreatorsMenu

:UnitHandbook
title StormTides
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
echo [%s1%] Unit Raritys[0m
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
if "%select%"=="1" set select=1&goto page1
if "%select%"=="2" set select=1&goto UnitHandbook
if "%select%"=="3" set select=1&goto credits
)
goto UnitHandbook

:page1
title StormTides
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Unit Raritys
echo %linevar2%
echo.
echo Unit raritys orginized by colors.The higher the rarity the harder the unit is to obtain.
echo The raritys are simple to recognize:
echo.
echo [92mCommon[0m
echo [32mUncommon[0m
echo [34mRare[0m
echo [33mLegendary[0m
echo [35mMythic[0m
echo.
echo [31mGhost[0m
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto UnitHandbook
)
goto page1

:changelog
title StormTides - Changelog
cls
if %select% gtr 4 set select=1
if %select% lss 1 set select=4
set s1=-
set s2=-
set s3=-
set s4=-
set s%select%=[90m#[0m[97m
echo %linevar%
echo [34mStorm[36mTides[0m  ^|  %version% Changelog
echo %linevar%
echo [0m
echo [%s1%] Bug Fixes[0m
echo [%s2%] New Features[0m
echo [%s3%] Changes[0m
echo.
echo %linevar%
echo [%s4%] Back[0m
if "%msplash%"=="y" echo.
choice /c:wsd /n /m ""
set msplash=n
if "%errorlevel%"=="1" set /a select-=1
if "%errorlevel%"=="2" set /a select+=1
if "%errorlevel%"=="3" (
if "%select%"=="1" set select=1&goto bugs
if "%select%"=="2" set select=1&goto features
if "%select%"=="3" set select=1&goto changes
if "%select%"=="4" set select=1&goto startgame
)
goto changelog

:bugs
title StormTides
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Bug Fixes
echo %linevar2%
echo.
echo - Fixed a bug where the enemys health in 
echo   certain wanders would stay at 10 hp
echo - Fixed a bug on sand beach where enemys
echo   would steal items from your inventory
echo - Fixed numerus bugs linked with the
echo   dungeons
echo - Fixed lots of bugs linked with the
echo   inventory
echo - Fixed a text mistake in the quick invntory
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto changelog
)
goto bugs

:features
title StormTides
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  New Features
echo %linevar2%
echo.
echo - Added three new towns
echo - Added 2 new un-used weapons
echo - Added the Blacksmith
echo - Added the Temple
echo - Added a new unused area in the map
echo - Added the Tavern
echo - Added many coming soon areas
echo - Added the class type on the inspect
echo   weapons menu
echo - Added an emergency repir for the boot
echo   config
echo - Added text on the top of the window of
echo   where you are located
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto changelog
)
goto features

:changes
title StormTides
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo %linevar2%
echo [34mStorm[36mTides[0m  ^|  Changes
echo %linevar2%
echo.
echo - Revamped the map
echo - The Kirin Tor Tower has been temp 
echo   removed
echo - Changed the text on the weapon inspect
echo   menu
echo - Changed the look of the load save menu
echo.
echo %linevar%
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto changelog
)
goto changes

:hth
title StormTides | How?
cls
if %select% gtr 1 set select=1
if %select% lss 1 set select=1
set s1=-
set s%select%=[90m#[0m[97m
echo [34mStorm[36mTides[0m  ^|  Changes
echo.
echo You have been sent to this menu because you
echo somehow deleted the boot config. This mean that
echo you deleted the path to the main files and paks.
echo We have no idea ho you did this but congrats, you're
echo stupid.
echo.
echo [%s1%] Back
if "%msplash%"=="y" echo.
choice /c:d /n /m ""
set msplash=n
if "%errorlevel%"=="1" (
if "%select%"=="1" set select=1&goto startgame
)
goto hth

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
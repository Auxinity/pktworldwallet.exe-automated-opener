CHCP 65001
@echo off
title PktWorldWallet.exe miner automatic start shit script v.6.9
color 0a
 
::Searches if PktWorldWallet.exe process open, if it is, will terminate it and re-opens it
tasklist | find /I "PktWorldWallet.exe" | find /I "pktwallet.exe"
		timeout /t 2
			if errorlevel 0  (
				::Closes PktWorldWallet.exe and pktwallet.exe
				echo Closing PktWorldWallet.exe and pktwallet.exe
				Taskkill /im PktWorldWallet.exe | Taskkill /F /im pktwallet.exe
goto loopa
)
::Searches csgo.exe process if it exists, if it doesn't, opens up pktworldwallet.exe
:loopa
echo Searching csgo.exe process
	timeout /t 2
tasklist | find /I "csgo.exe"
	if errorlevel 1 (
		echo csgo.exe not found
		timeout /t 2
		echo Looking for PktWorldWallet.exe
		echo PktWorldWallet.exe found
		cd "C:\Users\Pc\AppData\Local\Programs\PktWorldWallet"
				echo Opening program PktWorldWallet.exe
					timeout /t 2
				start /min PktWorldWallet.exe
					goto loopb ) Else ( echo csgo.exe found
					goto loopd )
 
:loopb
echo Searching csgo.exe process
	timeout /t 5
tasklist | find /I "csgo.exe"
	if errorlevel 1 (
		echo csgo.exe process not found
		timeout /t 5
		goto loopb
) Else ( 
	goto loopc
)
 
:loopc
echo Searching PktWorldWallet.exe
tasklist | find /I "csgo.exe"
	if errorlevel 0 (
		echo PktWorldWallet.exe found, shutdown in 5 seconds
			Taskkill /im PktWorldWallet.exe
			timeout /t 5
			echo PktWorldWallet.exe succesfully terminated
			goto loopd
			) Else ( goto loopb
			)
 
:loopd
tasklist | find /I "PktWorldWallet.exe"
	if errorlevel 1 (
		echo Searching PktWorldWallet.exe
		timeout /t 5
		echo PktWorldWallet.exe not found
		goto loopa )
@echo off
set serverName=Your Server Name Here
set serverLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::サーバーファイル階層
set serverPort=2302
::LANサーバーポート指定
set serverConfig=serverDZ.cfg
::設定ファイル読み込み
set serverCPU=2
::使用CPUコア指定
title %serverName% batch
cd "%serverLocation%"
echo (%time%) %serverName% started.
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% "-profiles=config" "-mod=@CF;@Community-Online-Tools" -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck
::Mod読み込み・CPUコア数指定
timeout 7200
::サーバーシャットダウンカウント
taskkill /im DayZServer_x64.exe /F
timeout 10
goto start
@echo off
setlocal
rem get the keys
for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces`) do (
  rem add the values
  reg add %%i /f /v "TcpAckFrequency" /d "1" /t REG_DWORD
  reg add %%i /f /v "TCPNoDelay" /d "1" /t REG_DWORD
  )
rem get the keys
for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces`) do (
  rem delete the values
  reg delete %%i /v "TcpAckFrequency" /f
  reg delete %%i /v "TCPNoDelay" /f
  )
endlocal
pause
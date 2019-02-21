@echo off

:初始化
mode con cols=53 lines=13 & color f0
if not exist "非法字符验证容器.ini" cd.>非法字符验证容器.ini
setlocal enabledelayedexpansion
title=用户注册端
set "returna=0"
set "returnb=0"
set "returnc=0"

:声明
echo=声明
echo=——————————————————————————
echo=抱歉，为了便利程序开发，注册端没有GUI界面。
echo=注册也就一次的事，往后您不会一直面对命令行操作的。
echo=(强行找借口掩饰，Emmm)
echo=注册端没有恶意代码，请放心使用。
echo=——————————————————————————
echo=按任意键跳过10秒声明的等待
timeout 10 >nul

:注册录入账号
CLS
echo=验值提示框
echo=^+———————————^+
if "!returna!"=="0" if "!returnb!"=="0" if "!returnc!"=="0" echo=^|暂无消息              ^|
if "!returna!"=="1" echo=^|请输入8位以上的字符^!   ^|
if "!returnb!"=="1" echo=^|请输入20位以内的字符^!  ^|
if "!returnc!"=="1" echo=^|出现非法字符^!          ^|
echo=^+———————————^+

::账号输入
set /p typeaccount=注册账号:

::账号输入判断模块
if "!typeaccount:~7,1!"=="" (set "returna=1"&set "returnc=0"&set "returnb=0"&goto 注册录入账号) else (set "returnc=0"&set "returnb=0"&set "returna=0")
if "!typeaccount:~20,1!" neq "" (set "returnb=1"&goto 注册录入账号) else (set "returnb=0")
ren "非法字符验证容器.ini" "!typeaccount!.ini"
if not exist "非法字符验证容器.ini" (if exist "!typeaccount!.ini" (set "returnc=0) else (set "returnc=1"&goto 注册录入账号)) else (set "returnc=1"&goto 注册录入账号)
echo=账号符合要求。

::判断参数归零
ren "!typeaccount!.ini" "非法字符验证容器.ini"
set "returna=0"
set "returnb=0"
set "returnc=0"

:注册录入密码
CLS
echo=您正为!typeaccount!账号设置密码
echo=验值提示框
echo=^+———————————^+
if "!returna!"=="0" if "!returnb!"=="0" if "!returnc!"=="0" echo=^|暂无消息              ^|
if "!returna!"=="1" echo=^|请输入8位以上的字符^!   ^|
if "!returnb!"=="1" echo=^|请输入20位以内的字符^!  ^|
if "!returnc!"=="1" echo=^|出现非法字符^!          ^|
echo=^+———————————^+

::密码输入
set /p typepassword=输入密码:

::密码输入判断模块
if "!typepassword:~7,1!"=="" (set "returna=1"&goto 注册录入密码) else (set "returnc=0"&set "returnb=0"&set "returna=0")
if "!typepassword:~20,1!" neq "" (set "returnb=1"&set "returnc=0"&set "returnb=0"&goto 注册录入密码) else (set "returnb=0")
ren "非法字符验证容器.ini" "!typepassword!.ini"
if not exist "非法字符验证容器.ini"（if exist "!typepassword!.ini" (set "returnc=0") else (set "returnc=1"&goto 注册录入密码)) else (set "returnc=1"&goto 注册录入账号)
echo=密码符合要求

::残留处理
CLS
ren "!typepassword!.ini" "非法字符验证容器.ini"
set "returna=0"
set "returnb=0"
set "returnc=0"
del /f /q 非法字符验证容器.ini
set "errorlevel=0"

:创建用户
echo=您的账号是!typeaccount!
echo=您的密码是!typepassword!
echo=请您牢记。
echo=写入数据中。
echo [用户信息]>!typeaccount!.ini
echo 账号=!typeaccount!>>!typeaccount!.ini
echo 密码=!typepassword!>>!typeaccount!.ini
echo 注册日期=!date!!time!>>!typeaccount!.ini
echo.>>!typeaccount!.ini
echo [编译支持]>>!typeaccount!.ini
xcopy /c /y "!typeaccount!.ini" %~dp0用户\
del /f /q "!typeaccount!.ini"

:结束处理
CLS
echo=程序15秒内关闭，请熟记账号密码。（按键跳过等待）
echo=您的账号是!typeaccount!
echo=您的密码是!typepassword!
timeout 15
echo=感谢注册。
timeout 1 >nul
@echo off

:��ʼ��
mode con cols=53 lines=13 & color f0
if not exist "�Ƿ��ַ���֤����.ini" cd.>�Ƿ��ַ���֤����.ini
setlocal enabledelayedexpansion
title=�û�ע���
set "returna=0"
set "returnb=0"
set "returnc=0"

:����
echo=����
echo=����������������������������������������������������
echo=��Ǹ��Ϊ�˱������򿪷���ע���û��GUI���档
echo=ע��Ҳ��һ�ε��£�����������һֱ��������в����ġ�
echo=(ǿ���ҽ�����Σ�Emmm)
echo=ע���û�ж�����룬�����ʹ�á�
echo=����������������������������������������������������
echo=�����������10�������ĵȴ�
timeout 10 >nul

:ע��¼���˺�
CLS
echo=��ֵ��ʾ��
echo=^+����������������������^+
if "!returna!"=="0" if "!returnb!"=="0" if "!returnc!"=="0" echo=^|������Ϣ              ^|
if "!returna!"=="1" echo=^|������8λ���ϵ��ַ�^!   ^|
if "!returnb!"=="1" echo=^|������20λ���ڵ��ַ�^!  ^|
if "!returnc!"=="1" echo=^|���ַǷ��ַ�^!          ^|
echo=^+����������������������^+

::�˺�����
set /p typeaccount=ע���˺�:

::�˺������ж�ģ��
if "!typeaccount:~7,1!"=="" (set "returna=1"&set "returnc=0"&set "returnb=0"&goto ע��¼���˺�) else (set "returnc=0"&set "returnb=0"&set "returna=0")
if "!typeaccount:~20,1!" neq "" (set "returnb=1"&goto ע��¼���˺�) else (set "returnb=0")
ren "�Ƿ��ַ���֤����.ini" "!typeaccount!.ini"
if not exist "�Ƿ��ַ���֤����.ini" (if exist "!typeaccount!.ini" (set "returnc=0) else (set "returnc=1"&goto ע��¼���˺�)) else (set "returnc=1"&goto ע��¼���˺�)
echo=�˺ŷ���Ҫ��

::�жϲ�������
ren "!typeaccount!.ini" "�Ƿ��ַ���֤����.ini"
set "returna=0"
set "returnb=0"
set "returnc=0"

:ע��¼������
CLS
echo=����Ϊ!typeaccount!�˺���������
echo=��ֵ��ʾ��
echo=^+����������������������^+
if "!returna!"=="0" if "!returnb!"=="0" if "!returnc!"=="0" echo=^|������Ϣ              ^|
if "!returna!"=="1" echo=^|������8λ���ϵ��ַ�^!   ^|
if "!returnb!"=="1" echo=^|������20λ���ڵ��ַ�^!  ^|
if "!returnc!"=="1" echo=^|���ַǷ��ַ�^!          ^|
echo=^+����������������������^+

::��������
set /p typepassword=��������:

::���������ж�ģ��
if "!typepassword:~7,1!"=="" (set "returna=1"&goto ע��¼������) else (set "returnc=0"&set "returnb=0"&set "returna=0")
if "!typepassword:~20,1!" neq "" (set "returnb=1"&set "returnc=0"&set "returnb=0"&goto ע��¼������) else (set "returnb=0")
ren "�Ƿ��ַ���֤����.ini" "!typepassword!.ini"
if not exist "�Ƿ��ַ���֤����.ini"��if exist "!typepassword!.ini" (set "returnc=0") else (set "returnc=1"&goto ע��¼������)) else (set "returnc=1"&goto ע��¼���˺�)
echo=�������Ҫ��

::��������
CLS
ren "!typepassword!.ini" "�Ƿ��ַ���֤����.ini"
set "returna=0"
set "returnb=0"
set "returnc=0"
del /f /q �Ƿ��ַ���֤����.ini
set "errorlevel=0"

:�����û�
echo=�����˺���!typeaccount!
echo=����������!typepassword!
echo=�����μǡ�
echo=д�������С�
echo [�û���Ϣ]>!typeaccount!.ini
echo �˺�=!typeaccount!>>!typeaccount!.ini
echo ����=!typepassword!>>!typeaccount!.ini
echo ע������=!date!!time!>>!typeaccount!.ini
echo.>>!typeaccount!.ini
echo [����֧��]>>!typeaccount!.ini
xcopy /c /y "!typeaccount!.ini" %~dp0�û�\
del /f /q "!typeaccount!.ini"

:��������
CLS
echo=����15���ڹرգ�������˺����롣�����������ȴ���
echo=�����˺���!typeaccount!
echo=����������!typepassword!
timeout 15
echo=��лע�ᡣ
timeout 1 >nul
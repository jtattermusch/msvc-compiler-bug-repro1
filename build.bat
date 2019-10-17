SET INCLUDE=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\ATLMFC\include;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\include;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\include\um;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\ucrt;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\shared;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\um;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\winrt;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\cppwinrt
SET PATH=C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.23.28105/bin/HostX64/x64;%PATH%
SET LIB=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\ATLMFC\lib\x64;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\lib\x64;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\lib\um\x64;C:\Program Files (x86)\Windows Kits\10\lib\10.0.18362.0\ucrt\x64;C:\Program Files (x86)\Windows Kits\10\lib\10.0.18362.0\um\x64;

@rem show compiler details
cl.exe /Bv

cl.exe /nologo /DCOMPILER_MSVC /DNOMINMAX /D_WIN32_WINNT=0x0601 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_SECURE_NO_WARNINGS /bigobj /Zm500 /EHsc /wd4351 /wd4291 /wd4250 /wd4996 /I. /Iinclude /MD /O2 /Oy- /DNDEBUG /wd4117 /Gy /Gw /c slice2.cc
cl.exe /nologo /DCOMPILER_MSVC /DNOMINMAX /D_WIN32_WINNT=0x0601 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_SECURE_NO_WARNINGS /bigobj /Zm500 /EHsc /wd4351 /wd4291 /wd4250 /wd4996 /I. /Iinclude /MD /O2 /Oy- /DNDEBUG /wd4117 /Gy /Gw /c main.cc

lib.exe /nologo /MACHINE:X64 slice2.obj /ignore:4221
link.exe /nologo main.obj slice2.lib /SUBSYSTEM:CONSOLE /MACHINE:X64 /DEFAULTLIB:msvcrt.lib /OPT:ICF /OPT:REF

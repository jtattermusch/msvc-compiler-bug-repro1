SET INCLUDE=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\ATLMFC\include;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\include;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\include\um;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\ucrt;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\shared;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\um;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\winrt;C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\cppwinrt
set PATH=C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.23.28105/bin/HostX64/x64;%PATH%

@rem show compiler details
cl.exe /Bv

cl.exe /nologo /DCOMPILER_MSVC /DNOMINMAX /D_WIN32_WINNT=0x0601 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_SECURE_NO_WARNINGS /bigobj /Zm500 /EHsc /wd4351 /wd4291 /wd4250 /wd4996 /I. /Iinclude /showIncludes /MD /O2 /Oy- /DNDEBUG /wd4117 -D__DATE__="redacted" -D__TIMESTAMP__="redacted" -D__TIME__="redacted" /Gy /Gw /Foslice2.obj /c slice2.cc
cl.exe /nologo /DCOMPILER_MSVC /DNOMINMAX /D_WIN32_WINNT=0x0601 /D_CRT_SECURE_NO_DEPRECATE /D_CRT_SECURE_NO_WARNINGS /bigobj /Zm500 /EHsc /wd4351 /wd4291 /wd4250 /wd4996 /I. /Iinclude /showIncludes /MD /O2 /Oy- /DNDEBUG /wd4117 -D__DATE__="redacted" -D__TIMESTAMP__="redacted" -D__TIME__="redacted" /Gy /Gw /Fomain.obj /c main.cc

lib.exe /nologo /OUT:grpc_slice_alt.lib /MACHINE:X64 slice2.obj /ignore:4221

SET LIB=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\ATLMFC\lib\x64;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\lib\x64;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\lib\um\x64;C:\Program Files (x86)\Windows Kits\10\lib\10.0.18362.0\ucrt\x64;C:\Program Files (x86)\Windows Kits\10\lib\10.0.18362.0\um\x64;
link.exe /nologo /OUT:slice_test_binary.exe main.obj grpc_slice_alt.lib /SUBSYSTEM:CONSOLE /MACHINE:X64 /DEFAULTLIB:msvcrt.lib /OPT:ICF /OPT:REF

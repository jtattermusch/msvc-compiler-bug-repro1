### General description

The code in this repo reproduces what is potentially a MSVC compiler bug.
The problem is that optimizer can be too aggressive in some situations
and we can actually observe that it has modified the code in a way
that results in incorrect behavior (two different local variables
show up as if they resided on the same address).
There are detailed comments in the code that try to describe what I think is
happening.

I was able to reproduce with all of VS2015, VS2017 and VS2019.

The latest compiler I tried with
```
cl.exe /Bv
Microsoft (R) C/C++ Optimizing Compiler Version 19.23.28106.4 for x64
Copyright (C) Microsoft Corporation.  All rights reserved.

Compiler Passes:
 C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\HostX64\x64\cl.exe:        Version 19.23.28106.4
 C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\HostX64\x64\c1.dll:        Version 19.23.28106.4
 C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\HostX64\x64\c1xx.dll:      Version 19.23.28106.4
 C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\HostX64\x64\c2.dll:        Version 19.23.28106.4
 C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\HostX64\x64\link.exe:      Version 14.23.28106.4
 C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\HostX64\x64\mspdb140.dll:  Version 14.23.28106.4
 C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.23.28105\bin\HostX64\x64\1033\clui.dll: Version 19.23.28106.4
```

Context:
https://github.com/grpc/grpc/pull/20555#issuecomment-542201234



### Reproduce

run `build.bat`

run `main.exe`

### Reproduce with bazel

 you can override VS version using instuctions here: https://docs.bazel.build/versions/master/windows.html
 
 ```
 bazel-0.29.1-windows-x86_64.exe run --compilation_mode=opt //:main -s
 ```
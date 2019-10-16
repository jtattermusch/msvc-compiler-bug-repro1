
### Reproduce

run `build.bat`

run `main.exe`

### Reproduce with bazel

 you can override VS version using instuctions here: https://docs.bazel.build/versions/master/windows.html
 
 ```
 bazel-0.29.1-windows-x86_64.exe run --compilation_mode=opt //:main -s
 ```
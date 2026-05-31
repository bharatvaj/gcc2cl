gcc2cl
======

gcc2cl is a fork of gcc2msvc.

This program is a wrapper for msvc's cl.exe and is intended to be used in Windows environment,
differing from WSL only nature of gcc2msvc.

It is invoked with gcc options (only a limited number) and turns them into msvc options to call cl.exe.

The msvc options may not exactly do the same as their gcc counterparts.


Configuration
-------------

gcc2cl appends .a files for libpath when a -l flag is given. If you prefer .lib instead,
use gcc2cl --disable-unix-style-static-libs

Depending on your environemnt, you may set the set CC="gcc2cl --disable-unix-style-static-libs"


For flags not supported by gcc2cl, you can try using the CL variable

```cmd
set CL=test.cpp /Zi
```

NOTE: gcc2msvc has hardcoded paths for major cl versions. gcc2cl does not do any of it, it just
converts the flags.


Downloads
---------

Instead of installing the full Visual Studio IDE you can also get the standalone command line
build tools at Visual Studio's homepage: http://landinghub.visualstudio.com/visual-cpp-build-tools


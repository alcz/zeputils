@echo off

echo %Time%

if not exist "..\vcpkg\" (
  echo Download vcpkg from github
  git clone --single-branch --branch master https://github.com/Rezonality/vcpkg.git ..\vcpkg
  if not exist "..\vcpkg\vcpkg.exe" (
    cd ..\vcpkg 
    call bootstrap-vcpkg.bat -disableMetrics
    cd %~dp0
  )
)

cd ..\vcpkg
echo Installing Libraries 
vcpkg install kissfft cppcodec clipp date kubazip tinydir fmt portaudio nanovg libcuckoo foonathan-memory cpp-httplib tinyfiledialogs gl3w gsl-lite glm concurrentqueue utfcpp stb catch2 magic-enum nlohmann-json cpptoml toml11 drlibs dirent freetype sdl2 --triplet x64-windows-static-md --recurse
cd %~dp0

echo %Time%


cd /d %~dp0

rem Check to make sure we've actually copied over at least something that could be the OSVR and Managed-OSVR binaries.
if not exist OSVR-Unity\Assets\Plugins\x86\*.dll exit /B 1

"C:\Program Files (x86)\Unity\Editor\Unity.exe" -quit -batchmode -projectPath "%~dp0OSVR-Unity" -executeMethod OSVRUnityBuild.build

rem Fail the build if we didn't get a unitypackage out.
if not exist OSVR-Unity\*.unitypackage exit /B 1

rem Copy the unitypackage to the dist directory if it exists.
if exist OSVR-Unity-Dist xcopy OSVR-Unity\*.unitypackage OSVR-Unity-Dist /Y

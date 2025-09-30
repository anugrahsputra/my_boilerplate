@echo off
echo 🚀 Setting up your Flutter project...

set /p package="Enter your app package name (e.g., com.example.myapp): "
set /p appname="Enter your app name: "
set /p projectname="Enter your project name: "

echo ➡️ Package: %package%
echo ➡️ App name: %appname%
echo ➡️ Project name: %projectname%

flutter pub global activate rename
flutter pub global run rename setBundleId --targets android,ios --value %package%
flutter pub global run rename setAppName --targets android,ios --value %appname%

flutter pub global activate change_project_name
flutter pub global run change_project_name %projectname%

flutter clean
flutter pub get

echo ✅ Setup complete! You're ready to code 🚀
pause

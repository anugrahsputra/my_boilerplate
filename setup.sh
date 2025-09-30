#!/usr/bin/env bash
set -e

echo "🚀 Setting up your Flutter project..."

# Check Flutter
command -v flutter >/dev/null 2>&1 || { echo "❌ Flutter not found. Install Flutter first."; exit 1; }

# Inputs
read -r -p "Enter your app package name (e.g., com.example.myapp): " package
read -r -p "Enter your app name: " appname
read -r -p "Enter your project name: " projectname

# Confirm
echo "➡️ Package: $package"
echo "➡️ App name: $appname"
echo "➡️ Project name: $projectname"
read -r -p "Proceed with these values? (y/n): " confirm
[[ $confirm == [yY] ]] || exit 1

# Ensure tools installed
if ! flutter pub global list | grep -q rename; then
  flutter pub global activate rename
fi
if ! flutter pub global list | grep -q change_project_name; then
  flutter pub global activate change_project_name
fi

# Apply changes
flutter pub global run rename setBundleId --targets android,ios --value "$package"
flutter pub global run rename setAppName --targets android,ios --value "$appname"
flutter pub global run change_project_name "$projectname"

# Clean & get dependencies
flutter clean
flutter pub get

echo "✅ Setup complete! You're ready to code 🚀"

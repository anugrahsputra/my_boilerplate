#!/bin/bash
echo "🚀 Setting up your Flutter project..."

# 1. Rename app
read -r -p "Enter your app package name (e.g., com.example.myapp): " package
read -r -p "Enter your app name: " appname

# 2. Change package name automatically
flutter pub global activate rename
flutter pub global run rename setBundleId --targets android,ios --value  "$package"

# 3. Change app name automatically
flutter pub global run rename setAppName --targets android,ios --value  "$appname"

# 4. Clean & get dependencies
flutter clean
flutter pub get

echo "✅ Setup complete! You're ready to code 🚀"

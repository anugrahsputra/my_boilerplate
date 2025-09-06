plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val MAJOR_VERSION: Int by rootProject.extra
val MINOR_VERSION: Int by rootProject.extra
val PATCH_VERSION: Int by rootProject.extra

private fun generateVersionCode(): Int {
    return MAJOR_VERSION * 10000 + MINOR_VERSION * 100 + PATCH_VERSION
}

private fun generateVersionName(): String {
    return "$MAJOR_VERSION.$MINOR_VERSION.$PATCH_VERSION"
}

android {
    namespace = "com.example.my_boilerplate"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.downormal.myBoilerplate"
        resValue("string", "build_config_package", "com.example.my_boilerplate")
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = generateVersionCode()
        versionName = generateVersionName()
    }

    buildFeatures {
        buildConfig = true
    }

    buildTypes {
        getByName("release") {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.

            isMinifyEnabled = true
            isShrinkResources = true
            signingConfig = signingConfigs.getByName("debug")
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    flavorDimensions += "env"
    productFlavors {
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "My Boilerplate - Dev")
        }
        create("stag") {
            dimension = "env"
            applicationIdSuffix = ".staging"
            versionNameSuffix = "-staging"
            resValue("string", "app_name", "My Boilerplate - Staging")
        }
        create("prod") {
            dimension = "env"
            resValue("string", "app_name", "My Boilerplate")
        }
    }
}

flutter {
    source = "../.."
}

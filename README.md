# Flutter Boilerplate

A comprehensive, production-ready Flutter boilerplate project with clean architecture, dependency injection, state management, and modern development practices.

## 🚀 Features

### Architecture & Design Patterns
- **Clean Architecture** with clear separation of concerns (Data, Domain, Presentation layers)
- **BLoC Pattern** for state management using `flutter_bloc`
- **Dependency Injection** with `get_it` for service locator pattern
- **Repository Pattern** for data access abstraction
- **Use Case Pattern** for business logic encapsulation

### State Management
- **BLoC/Cubit** for reactive state management
- **Freezed** for immutable data classes and union types
- **Equatable** for value equality comparisons

### Network & API
- **Dio** for HTTP client with interceptors
- **Certificate Pinning** for enhanced security
- **Request Retry** mechanism with exponential backoff
- **Caching** with encrypted storage using `dio_cache_interceptor`
- **Network Interceptors** for logging and error handling

### Data Persistence
- **ObjectBox** for local database
- **Hive** for NoSQL storage
- **Shared Preferences** for simple key-value storage
- **Secure Storage** for sensitive data encryption
- **SQLite** support via `sqflite`

### Security
- **Certificate Pinning** to prevent MITM attacks
- **Encrypted Storage** for sensitive data
- **Secure Key Management** with `flutter_secure_storage`
- **Form Sanitization** for input validation

### UI/UX
- **Responsive Design** with `flutter_screenutil`
- **Material Design 3** with `flex_color_scheme`
- **Custom Theme** system with dark/light mode support
- **Form Validation** with `formz`
- **Loading States** and error handling
- **Navigation** with route management

### Development Tools
- **Code Generation** with `build_runner`, `freezed`, and `json_serializable`
- **Testing** setup with `mockito` for mocking
- **Logging** with structured logging and Sentry integration
- **Error Tracking** with Sentry for production monitoring
- **Code Quality** with `flutter_lints` and `dart_code_metrics`

### Performance & Monitoring
- **Sentry Integration** for error tracking and performance monitoring
- **Logging Integration** with Sentry
- **Network Performance** monitoring
- **Memory Management** with proper disposal patterns

## 📁 Project Structure

```
lib/
├── app/                    # Application-level components
│   ├── app.dart           # Main app widget
│   ├── app_cubit.dart     # App state management
│   ├── app_initialize.dart # App initialization
│   └── app_splash.dart    # Splash screen
├── core/                   # Core functionality
│   ├── data/              # Core data layer
│   ├── domain/            # Core domain layer
│   ├── presentation/      # Core presentation layer
│   └── utils/             # Utility classes
├── features/              # Feature modules
│   ├── auth/              # Authentication feature
│   │   ├── data/          # Auth data layer
│   │   ├── domain/        # Auth domain layer
│   │   └── presentation/  # Auth UI layer
│   └── general/           # General features
├── di.dart                # Dependency injection setup
└── main.dart              # App entry point
```

## 🛠 Setup Instructions

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK 3.8.1 or higher
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url> <your-project-name>
   cd <your-project-name>
   ```

2. **Setup project name**
  ```bash
   chmod +x setup.sh
   ./setup.sh
  ``` 

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Generate code**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

#### Environment Setup
- Update Sentry DSN in `lib/app/app_initialize.dart`
- Configure certificate pinning fingerprints in `lib/core/utils/sha_fingerprints.dart`
- Set up your API endpoints in `lib/core/data/api_endpoints.dart`

#### Icons & Assets
- Replace app icons in `assets/icon/`
- Run icon generation: `flutter pub run flutter_launcher_icons`

## 🏗 Architecture Overview

### Clean Architecture Layers

1. **Presentation Layer** (`presentation/`)
   - UI components (Widgets, Pages)
   - State management (BLoCs, Cubits)
   - Navigation and routing

2. **Domain Layer** (`domain/`)
   - Business logic and use cases
   - Entity models
   - Repository interfaces

3. **Data Layer** (`data/`)
   - Repository implementations
   - Data sources (API, Local)
   - DTOs and mappers

### Dependency Injection
The project uses `get_it` for dependency injection with a centralized setup in `lib/di.dart`:

```dart
// Register services
di.registerLazySingleton<AuthRepository>(
  () => AuthRepositoryImpl(
    dataSource: di<AuthDataSource>(),
    localStorageManager: di<LocalStorageManager>(),
  ),
);

// Register BLoCs
di.registerFactory<LoginBloc>(
  () => LoginBloc(loginUsecase: di<LoginUsecase>()),
);
```

## 🔧 Development Guidelines

### Adding New Features

1. **Create feature structure**:
   ```
   lib/features/your_feature/
   ├── data/
   │   ├── datasource/
   │   ├── dto/
   │   ├── mapper/
   │   └── repository/
   ├── domain/
   │   ├── model/
   │   ├── repository/
   │   └── usecase/
   └── presentation/
       ├── bloc/
       └── view/
   ```

2. **Generate code**:
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

3. **Register dependencies** in `lib/di.dart`

## 🧪 Testing

The project includes comprehensive testing setup with 74 passing tests covering core functionality:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate HTML coverage report
genhtml coverage/lcov.info -o coverage/html

# Run specific test file
flutter test test/core/domain/safe_call_test.dart

# Run tests in a directory
flutter test test/features/auth/
```

### Test Structure
- **Unit Tests**: Test individual classes and methods (SafeCall, form validation, etc.)
- **BLoC Tests**: Test state management with proper mocking
- **Form Validation Tests**: Test email and password validation rules
- **Repository Tests**: Test data layer logic with mocked dependencies

### Test Coverage
The project includes tests for:
- ✅ **Core Utilities**: SafeCall error handling, form validation
- ✅ **Domain Layer**: Use case logic and business rules
- ✅ **Data Layer**: Repository implementations and data sources
- ✅ **Presentation Layer**: BLoC state management and form handling

**Current Coverage**: **11.1%** (126 of 1,134 lines covered)

#### Coverage Highlights
- 🏆 **100% Coverage**: Request retrier, email validation, API endpoints
- 🥈 **80%+ Coverage**: Network client, failures, interceptor mixin
- 📈 **Areas for Improvement**: Business logic, UI components, repositories

### Testing Documentation
- **Testing Guide**: [test/README.md](test/README.md)
- **Coverage Report**: [test/COVERAGE_REPORT.md](test/COVERAGE_REPORT.md)
- **HTML Coverage**: `coverage/html/index.html` (after running `flutter test --coverage`)

## 📱 Platform Support

- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 12.0+
- **Web**: Supported
- **Desktop**: Supported

## 🔒 Security Features

- **Certificate Pinning**: Prevents man-in-the-middle attacks
- **Encrypted Storage**: Sensitive data is encrypted at rest
- **Secure Key Management**: Keys stored in secure storage
- **Input Validation**: Form sanitization and validation

## 📊 Monitoring & Analytics

- **Sentry Integration**: Error tracking and performance monitoring
- **Structured Logging**: Comprehensive logging system
- **Network Monitoring**: Request/response logging and error tracking

## 🚀 Deployment

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the documentation
- Review the test examples

---

**Happy Coding! 🎉**

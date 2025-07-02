# My Boilerplate

A comprehensive Flutter boilerplate project.

## Getting Started

This project serves as a robust starting point for new Flutter applications, incorporating a structured and scalable architecture.

### Prerequisites

- Flutter SDK: Ensure you have the Flutter SDK installed. For installation instructions, refer to the [official Flutter documentation](https://docs.flutter.dev/get-started/install).
- IDE: An IDE with Flutter support, such as Visual Studio Code or Android Studio.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/my_boilerplate.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd my_boilerplate
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

### Running the Application

To run the application, use the following command:

```bash
flutter run
```

## Project Structure

The project follows a feature-based architecture, with a clear separation of concerns between the data, domain, and presentation layers.

-   `lib/`: Contains the main application code.
    -   `app/`: Core application setup and initialization.
    -   `core/`: Shared components, utilities, and foundational services.
        -   `data/`: Data sources, repositories, and models.
        -   `domain/`: Business logic and use cases.
        -   `presentation/`: UI components, themes, and navigation.
    -   `features/`: Individual feature modules (e.g., `auth`, `general`).
    -   `di.dart`: Dependency injection setup using `get_it`.
    -   `main.dart`: The main entry point of the application.
-   `assets/`: Static assets, such as images and icons.
-   `test/`: Unit and widget tests.

## Key Dependencies

This boilerplate comes pre-configured with a set of essential packages to streamline development:

-   **State Management:** `flutter_bloc` for predictable state management.
-   **Dependency Injection:** `get_it` for service locator-based dependency injection.
-   **Networking:** `dio` for robust network requests, with caching and certificate pinning.
-   **Navigation:** A custom `AppNavigator` for declarative routing.
-   **UI:**
    -   `flutter_screenutil` for responsive UI design.
    -   `flex_color_scheme` for flexible and customizable color schemes.
-   **Local Storage:**
    -   `shared_preferences` for simple key-value storage.
    -   `objectbox` for efficient local database management.
-   **Error Reporting:** `sentry_flutter` for real-time error monitoring.

For a complete list of dependencies, see the `pubspec.yaml` file.

## API Endpoints

The application interacts with the following API endpoints, defined in `lib/core/data/api_endpoints.dart`:

-   **Login:** `https://reqres.in/api/login`
-   **Register:** `https://reqres.in/api/register`

## Further Resources

-   [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
-   [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
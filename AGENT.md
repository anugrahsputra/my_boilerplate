# Shared Package Agent Documentation

> **READ THIS FIRST**
> This document is the **single source of truth** for any AI agent working on the **my_boilerplate** project.
> It defines architectural intent, development constraints, and non-negotiable behavioral rules.

---

## 1. Philosophy & Guidelines

### Core Philosophy

- **Safety First**
  Never risk user data, stability, or backward compatibility.
  When uncertain, stop and ask for clarification.

- **Incremental Progress**
  Break complex tasks into small, verifiable steps.
  Large, speculative changes are forbidden.

- **Clear Intent Over Cleverness**
  Prefer readable, boring, maintainable solutions.
  Clever hacks are a liability.

- **Native Performance Mindset**
  Optimize only when necessary and with evidence.
  Avoid premature optimization.

---

### Eight Honors and Eight Shames

- **Shame** in guessing APIs, **Honor** in careful research
- **Shame** in vague execution, **Honor** in seeking confirmation
- **Shame** in assuming business logic, **Honor** in human verification
- **Shame** in creating new abstractions, **Honor** in reusing existing ones
- **Shame** in skipping validation, **Honor** in proactive testing
- **Shame** in breaking architecture, **Honor** in following specifications
- **Shame** in pretending to understand, **Honor** in honest ignorance
- **Shame** in blind modification, **Honor** in careful refactoring

---

## 2. Quality Standards

### Language & Style

- **English Only**
  All code, comments, documentation, identifiers, and error messages must be written in English.

- **No Unnecessary Comments**
  Do not comment _what_ the code does.
  Comments are allowed **only** to explain _why_ a decision exists.

---

### Dart & Flutter Standards

- **Idiomatic Dart & Flutter**
  Code must follow official Dart and Flutter best practices:
    - Sound null safety
    - No `dynamic` unless explicitly justified
    - Prefer `final` and `const`
    - Avoid force unwrap (`!`) unless logically guaranteed

- **Analyzer Cleanliness**
  Generated code must compile with zero analyzer warnings or errors.

---

### API & Architecture

- **Minimal Public Surface**
  Expose the smallest possible public API.
  Internal helpers, models, and utilities must remain private.

- **Single Responsibility**
  Each file, class, and function must have exactly one responsibility.
  If responsibilities grow, split — do not extend scope.

- **Predictable Structure**
  Project structure must be feature-based and easy to navigate.
  Global state, god objects, and hidden side effects are prohibited.

---

### Performance & Safety

- **Performance-Safe Defaults**
    - No heavy work in `build()`
    - No unnecessary widget rebuilds
    - Dispose all controllers, streams, and subscriptions
    - Avoid synchronous I/O on the UI thread

- **Explicit Error Handling**
  Errors must never be swallowed.
  Fail fast with meaningful, typed exceptions.
  Silent fallbacks and no-op behavior are not allowed.

---

### Platform & Dependencies

- **Platform Awareness**
  Platform-specific behavior must be explicit and isolated.
  Unsupported platforms must fail immediately with clear errors.

- **Dependency Discipline**
  Do not introduce new dependencies unless strictly necessary.
  Prefer standard libraries and existing project dependencies.

---

### Testability & Determinism

- **Test-Aware Design**
    - No hidden state
    - No hard-coded singletons
    - Dependencies must be injectable
    - Logic must be testable without UI

- **Deterministic Behavior**
  Avoid randomness, time-based behavior, or environment-dependent logic
  unless explicitly required.

---

### Hard Prohibitions (Non-Negotiable)

The agent **must not** generate:

- Dead code
- Commented-out code
- TODOs without explicit instruction
- Placeholder or fake implementations
- Over-engineered abstractions
- Speculative features or APIs

---

## 3. Project Identity

- **Name**: my_boilerplate
- **Purpose**: A ready-to-use production-ready flutter project for flutter developers
- **Core Value**: A comprehensive, production-ready Flutter boilerplate project with clean architecture, dependency injection, state management, and modern development practices.

---

## 4. Technology Stack

### Core Framework & Language
* Flutter: Cross-platform mobile development.
* Dart: Primary programming language.

### Architecture & State Management
* BLoC/Cubit: (flutter_bloc) Used for state management across the application.
* Clean Architecture: The project is structured into core, features, data, domain, and presentation layers.
* Dependency Injection: get_it is used for service location and DI.
* Functional Programming: dartz is used, likely for handling errors via the Either type.

### Networking & Security
* Dio: A powerful HTTP client for Dart.
* Caching: dio_cache_interceptor with http_cache_hive_store.
* Certificate Pinning: http_certificate_pinning for enhanced network security.
* Connectivity: internet_connection_checker to monitor network status.

### Data Storage
* ObjectBox: A high-performance NoSQL database.
* Hive: A lightweight and blazing fast key-value database.
* SQFlite: SQLite plugin for Flutter.
* Persistence: shared_preferences and flutter_secure_storage for encrypted sensitive data.

### Code Generation & Serialization
* Freezed: For data classes and union types (sealed classes).
* JSON Serializable: For automated JSON parsing logic.
* Equatible: For value-based object equality.

### UI & Design
* Flex Color Scheme: Advanced theme management.
* Google Fonts: For typography.
* Flutter SVG: For vector graphics.
* Flutter ScreenUtil: For responsive UI and screen adaptation.
* Material Design: Built-in Material 3/2 support.

### Monitoring & Quality
* Sentry: Comprehensive error tracking and performance monitoring (sentry_flutter, sentry_dio, sentry_logging).
* Logging: logging package for internal application logs.
* Analysis: very_good_analysis for strict linting and code quality rules.

### Utilities & CI/CD
* Shorebird: Used for over-the-air (OTA) code updates (shorebird.yaml found in root).
* Formz: For standardizing form validation logic.
* Localization: Built-in Flutter l10n with intl.
* Permission Handler: Managing device permissions.

---

## 5. Repository Architecture and Infrastructure

### 1. Repository Architecture

The project adopts a Feature-First Clean Architecture, ensuring scalability and separation of concerns.

* Structure: Code is organized by Feature (e.g., `auth`, `general`), and each feature contains its own layers:
    * Data: Repositories, Data Sources (API/Local), Models.
    * Domain: Entities, Usecases, Repository Interfaces.
    * Presentation: BLoCs/Cubits, Widgets, Pages.
* State Management: BLoC / Cubit (`flutter_bloc`) is the standard for managing UI state and business logic.
* Dependency Injection: GetIt (`get_it`) functions as the Service Locator, wiring up dependencies (Repositories, Usecases, BLoCs) in lib/di.dart.
* Navigation: Centralized named routing via `AppRoutes.onGenerateRoute` (`core/presentation/routes/`).
* Localization: Native Flutter `l10n` using .`arb` files for multi-language support.

### 2. Infrastructure & Key Services

* Error Tracking & Monitoring:
    * Sentry: Integrated at the entry point (`main.dart`) to capture global errors and in the network layer (`sentry_dio`) to track failed HTTP requests.
* Networking (Dio):
    * Caching: Uses dio_cache_interceptor backed by Hive (`HiveCacheStore`) for offline support.
    * Security: FlutterSecureStorage protects sensitive data, including encryption keys for Hive.
    * Interceptors: Custom `NetworkInterceptor` handles standard request/response transformations.
* CI/CD & DevOps:
    * Code Push: Shorebird (`shorebird.yaml`) is configured for Over-The-Air (`OTA`) updates.
    * Scripts: setup.sh and setup.bat exist for environment bootstrapping.
    * IDE Config: Pre-configured run profiles for VS Code (`.vscode/launch.json`) and IntelliJ/Android Studio (`.run/`).
    * Linting: Enforces strict code quality using `very_good_analysis`.

---

## 6. Agent Behavioral Constraints

- **No Large Changes by Default**
  The agent must not perform wide-ranging refactors, renames, or architectural changes
  unless explicitly instructed.

- **Ask Before Assumptions**
  If requirements, expected behavior, or side effects are unclear, the agent must stop
  and request clarification.

- **Small, Reviewable Diffs**
  Prefer small, incremental changes that are easy to review and revert.

- **Respect Stability**
  Public APIs and shared infrastructure are assumed to be consumed by multiple projects.
  Breaking changes are forbidden unless explicitly requested.

- **No Silent Behavior Changes**
  Any change that alters runtime behavior must be clearly explained.

---

## 7. Stability Rules

- **Modification Policy**
    - Additive changes are preferred over modifications
    - Existing behavior must not change silently
    - Refactors must preserve public contracts

---

## 8. Pre-Change Checklist (Agent Self-Review)

Before producing output, the agent must verify:

- [ ] The change is necessary and scoped
- [ ] No public API is broken
- [ ] No new dependency is introduced unnecessarily
- [ ] The code is testable
- [ ] The behavior change (if any) is explicitly explained

---

### Final Reality Check

If a change:

- Can’t be explained clearly
- Can’t be tested easily
- Or risks breaking consumers

**It doesn’t belong here.**

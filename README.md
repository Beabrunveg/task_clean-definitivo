# Easy Clean

## Description

Easy Clean is a mobile app that helps you keep track of your daily tasks and chores. It allows you to create, edit, and delete tasks, set reminders. The app also provides a summary of your completed tasks and allows you to share your progress with friends and family.

## Features

* **Task Management:** Create, edit, and delete tasks.
* **Reminders:** Set reminders for important tasks.
* **Completed taks:** View a summary of your completed tasks.
* **Sharing person:** Share your progress with friends and family.
* **Dark Mode:** Support for dark mode.
* **Notificaciones:** Receive notifications for upcoming tasks.
* **List Promotions:** View a list of promotions and discounts on cleaning products.
* **User Profile:** Create a user profile with your name and photo.
* **Settings:** Customize the app with your preferred settings.
* **Register photo evidence:** Register photo evidence of completed tasks.
* **Login with google:** Login with your google account.
* **Login with credentials:** Login with your email and password.
* **Integration with Firebase:** Store your tasks and user data in the cloud.  

## Requirements

### Development Environment

* **Flutter:** [Specify the minimum Flutter version required (e.g., Flutter 3.34.0)]
* **Android Studio/VS Code:** [Mention the recommended IDE and any necessary plugins]
* **Android Emulator/Device:** [Specify minimum Android version or API level]
* **iOS Simulator/Device:** [Specify minimum iOS version if applicable]

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/[your-username]/taks_daily_app.git
    ```
2. **Install the dependencies:**
   ```bash
   flutter clean
   ```
3. **Install the dependencies:**
   ```bash
   flutter pub get
   ```
4. **Build the app Preview:**
   ```bash
   make b
    ```
5. **Run the app:**
   ```bash
   Use Play button in Visual studio code.
    ```

## Usage

1. **Create a new task:**
   - Click on the "+" button.
   - Selected create first person or selected person.
   - Selected Person: 
   - Insert detail taks and accept.
   - The task will be added to the list of tasks.
2. **Remove a task:**
   - Swipe left on the task.
   - The task will be removed from the list.
3. **Completed task:**
   - Click on the task.
   - Register photo evidence of completed tasks and comment.
4. **View Promotions**
   - Click button top in view More.
   - View a list of promotions and discounts on cleaning products.
5. **Configuration:**
   - Click on the Menu button.
   - Click in the "configuration" button.
6. **Register my inventory:**
    - Click on the Menu button.
    - Click in the "Mi Inventario" button.
7. **Profile:**
    - Click on the Menu button.
    - Click in the "Perfil" button.
8. **History taks:**
    - Click on the Menu button.
    - Click in the "Historial de tareas" button.
9. **History cod:**
    - Click on the Menu button.
    - Click in the "Historial de códigos" button.
10. **Logout:**
    - Click on the Menu button.
    - Click in the "Cerrar sesión" button.

## Architecture

This app follows a simplified Clean Architecture approach to improve code organization, testability, and maintainability. Here's a breakdown:

**1. Data Layer:**

* **Models:**  Represent the data structures used throughout the app. They are plain Dart objects (often using `freezed` for immutability and code generation).
    * Example: `User`, `Task`, `InventoryItem` 
* **Repositories (Interfaces):** Define abstract contracts for data access. They specify the methods available for interacting with data sources (database, network, etc.) without revealing the implementation details.
    * Example: `UserRepository`, `TaskRepository`
* **Data Sources:** Concrete implementations of the repositories. They handle the actual interaction with the underlying data storage or APIs.
    * Example: `LocalDataSource` (using SQLite), `RemoteDataSource` (using HTTP client)

**2. Domain Layer (Use Cases):**

* **Use Cases:** Represent business logic and actions the app can perform. They operate on data provided by repositories and return results to the presentation layer.
    * Example: `LoginUser`, `GetTasksForDay`, `UpdateTaskCompletion`

**3. Presentation Layer:**

* **Screens/Widgets:**  Compose the user interface and handle user interactions.
* **ViewModels (ChangeNotifier/StateNotifier):**  Manage the state of the UI, interact with use cases, and expose data to widgets.
* **Riverpod:**  Provides a way to inject dependencies (use cases) into view models and share state across the widget tree.

**Simplified Flow:**

1. A user interacts with the UI (e.g., taps a button).
2. The widget notifies its corresponding view model.
3. The view model executes a use case.
4. The use case interacts with the appropriate repository.
5. The repository retrieves or manipulates data from the data source.
6. The use case returns the result to the view model.
7. The view model updates its state, triggering UI updates.

**Benefits:**

* **Testability:** Each layer can be tested independently.
* **Maintainability:** Changes in one layer have minimal impact on others.
* **Scalability:**  Easier to add new features or data sources. 
## Dependencies

* **auto_route:** Navigation and routing framework for Flutter. Simplifies route management and deep linking.
* **awesome_dio_interceptor:** Provides a collection of useful interceptors for the Dio HTTP client, such as logging, error handling, and request/response modification.
* **camera:** Allows access to the device's camera to capture images and videos.
* **cupertino_icons:** Provides a set of icons designed to match Apple's iOS design language.
* **device_preview:** A helpful tool for previewing your Flutter app on different devices and screen sizes within the Flutter emulator or on real devices.
* **dio:** A powerful HTTP client for Dart, providing features like global configuration, interceptors, request cancellation, and FormData support.
* **envied:** Simplifies loading environment variables from .env files into your Flutter app.
* **expansion_widget:** Creates expandable/collapsible widgets to show and hide content dynamically.
* **firebase_auth:** Enables user authentication with Firebase, supporting various sign-in methods like email/password, social logins, and phone number authentication.
* **firebase_core:** The core plugin for integrating Firebase services into your Flutter app.
* **flutter:** The Flutter SDK itself.
* **flutter_colorpicker:** Provides a UI widget for selecting colors in your app.
* **flutter_confetti:** Creates fun confetti animations for celebratory moments in your app.
* **flutter_facebook_auth:** Enables user authentication with Facebook.
* **flutter_local_notifications:** Allows scheduling and displaying local notifications on the user's device.
* **flutter_native_splash:** Customizes the native splash screen displayed while your Flutter app initializes.
* **flutter_riverpod:** A reactive state-management solution for Flutter, providing a predictable and testable way to manage your app's state.
* **flutter_secure_storage:** Provides a secure way to store sensitive data, such as API keys or user credentials, on the user's device.
* **flutter_svg:** Enables rendering SVG (Scalable Vector Graphics) images in your Flutter app.
* **fluttertoast:** Displays brief toast messages to provide feedback to the user.
* **fpdart:** Brings functional programming concepts and utilities to Dart, promoting code clarity and composability.
* **freezed:** A code-generation library that simplifies creating immutable data classes and unions in Dart.
* **freezed_annotation:** Annotations used with Freezed to customize code generation.
* **get_it:** A simple service locator for Dart, making it easy to access dependencies throughout your app.
* **google_sign_in:** Enables user authentication with Google.
* **hooks_riverpod:** Provides a way to use Flutter Hooks with Riverpod for more concise and readable state management.
* **image_picker:** Allows users to select images from their device's gallery or camera.
* **injectable:** A compile-time dependency injection framework for Dart and Flutter.
* **intl:** Provides internationalization and localization support for Flutter apps, enabling you to adapt your app to different languages and regions.
* **json_annotation:** Annotations used for code generation to serialize and deserialize JSON data in Dart.
* **mask_text_input_formatter:** Helps format text input in TextFields, such as phone numbers or credit card numbers.
* **path_provider:** Provides access to commonly used file paths on the device, such as the documents directory.
* **provider:** A popular state management solution for Flutter, making it easy to propagate state changes across your widget tree.
* **riverpod_annotation:** Annotations used with Riverpod for code generation and improved developer experience.
* **sqflite:** Enables interaction with SQLite databases in Flutter, allowing you to store data locally on the device.
* **ticket_clippers:** Provides custom clipper widgets for creating ticket-shaped UI elements.

## Dev Dependencies

* **auto_route_generator:** Code generator for the AutoRoute package.
* **build_runner:** A tool for running code generators in Dart.
* **custom_lint:** Allows you to define custom linting rules for your Dart code.
* **flutter_flavorizr:** Simplifies managing different build flavors for your Flutter app, such as development, staging, and production.
* **flutter_lints:** Provides a set of recommended linting rules for Flutter apps.
* **flutter_test:** The Flutter testing framework.
* **injectable_generator:** Code generator for the Injectable dependency injection framework.
* **json_serializable:** Code generator for serializing and deserializing JSON data in Dart.
* **riverpod_generator:** Code generator for the Riverpod state management solution.
* **riverpod_lint:** Linting rules specific to the Riverpod package.
* **very_good_analysis:** A stricter set of analysis options for Dart, enforcing better code quality.

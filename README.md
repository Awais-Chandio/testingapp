🚀 Simple Login App

A Flutter test project demonstrating clean architecture and integration with a real API using modern Flutter tools and best practices.

✨ Features

🔄 State Management: flutter_bloc
 (Cubit)

🌐 Networking: dio

⚙️ Dependency Injection: get_it

🧩 JSON Parsing: json_serializable

🧱 Architecture: Simplified MVVM pattern (Model, View, ViewModel/Bloc)

📱 App Workflow

The user enters their email and password on the login screen.

On tapping Login, the app:

Sends a POST request to the API using Dio.

Shows a loading indicator while waiting.

If the API response is successful, the app navigates to the Home Screen showing:

Welcome Message

If the API response fails, an error message is displayed.

🔧 Setup & Run Instructions
1️⃣ Clone or create a new Flutter project, then replace/add the provided files.
2️⃣ Install dependencies:
flutter pub get

3️⃣ Generate model serialization code (if deleted):
flutter pub run build_runner build --delete-conflicting-outputs

4️⃣ Run the app:
flutter run



🧠 Project Structure
lib/
│
├── model/
│   └── login_response.dart
│
├── view/
│   ├── login_screen.dart
│   └── home_screen.dart
│
├── viewmodel/
│   └── login_cubit.dart
│
└── service/
    └── service_locator.dart

🏁 Summary

This project highlights:

Clean and modular code organization

Practical use of Flutter BLoC + Dio + GetIt

Real API integration and response handling

Beginner-friendly demonstration of MVVM architecture
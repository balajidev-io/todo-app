Flutter Todo App

A fully functional Todo List application built with Flutter and Firebase that allows users to manage their daily tasks with secure authentication and real-time database storage.

📌 Project Description

This project is a Flutter-based Todo List application integrated with Firebase Authentication and Firebase Realtime Database.

Users can sign up or log in securely and manage their personal tasks including adding, editing, completing, and deleting tasks. The application demonstrates clean project structure, Provider state management, and REST API communication with Firebase.

This project was developed as part of a Flutter Developer hiring task for Herody, Bangalore.

🚀 Features

🔐 User Authentication

Email & Password Sign Up / Login

Google Sign In

Persistent login session

Secure logout

📝 Task Management

View all tasks

Add new tasks

Edit existing tasks

Mark tasks as completed

Delete tasks with confirmation dialog

🔄 State Management

Provider for Authentication state

Provider for Task state

Automatic UI updates using notifyListeners()

🔥 Firebase Integration

Firebase Authentication

Firebase Realtime Database

REST API communication

User-specific task storage

📱 Responsive UI

Works on different screen sizes

Clean Material Design interface

🛠 Technologies Used

Flutter

Dart

Firebase Authentication

Firebase Realtime Database

Provider (State Management)

HTTP Package (REST API)

Google Sign In

UUID (Task ID generation)

Intl (Date formatting)

📂 Project Structure
todo_app
│
├── lib
│   ├── main.dart
│   ├── firebase_options.dart
│
│   ├── models
│   │   └── task_model.dart
│
│   ├── providers
│   │   ├── auth_provider.dart
│   │   └── task_provider.dart
│
│   ├── screens
│   │   ├── splash_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   └── home_screen.dart
│
│   ├── services
│   │   └── firebase_service.dart
│
│   └── widgets
│       ├── task_tile.dart
│       └── add_edit_task_sheet.dart
│
├── android
│   └── app
│       └── google-services.json
│
└── pubspec.yaml
⚙️ Setup & Installation
1️⃣ Clone the repository
git clone https://github.com/balajidev-io/todo-app.git
cd todo-app
2️⃣ Install dependencies
flutter pub get
3️⃣ Firebase Setup

Go to Firebase Console

Create a new project

Enable Email/Password Authentication

Enable Realtime Database

Download google-services.json

Place it inside

android/app/

Update your firebase_options.dart with Firebase configuration values.

4️⃣ Run the app
flutter run
5️⃣ Build APK
flutter build apk --release
📦 Dependencies
firebase_core: ^3.1.0
firebase_auth: ^5.1.0
google_sign_in: ^6.2.1
provider: ^6.1.2
http: ^1.2.1
shared_preferences: ^2.2.3
fluttertoast: ^8.2.5
uuid: ^4.4.0
intl: ^0.19.0
👨‍💻 Developer

Balaji

GitHub
https://github.com/balajidev-io

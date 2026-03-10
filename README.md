📝 Todo App — Flutter + Firebase
A fully functional Todo List App built with Flutter, featuring Firebase Authentication and Firebase Realtime Database. Developed as part of a Flutter Developer hiring task for Herody, Bangalore.

📱 Screenshots

Login Screen | Home Screen | Add Task | Task Management


🚀 Features

🔐 User Authentication

Email & Password Sign Up / Sign In
Google Sign In
Persistent login state
Secure logout


✅ Task Management

View all tasks (All / Pending / Done tabs)
Add new tasks with title & description
Edit existing tasks
Mark tasks as completed
Delete tasks with confirmation dialog


🔄 State Management

Provider for Authentication state
Provider for Task state
Real-time UI updates


🔥 Firebase Integration

Firebase Authentication (Email/Password + Google)
Firebase Realtime Database via REST API calls
Per-user task isolation


📱 Responsive UI

Works on all screen sizes
Material Design 3
Clean and modern interface




🛠️ Tech Stack
TechnologyUsageFlutterUI FrameworkDartProgramming LanguageFirebase AuthUser AuthenticationFirebase Realtime DatabaseCloud DatabaseProviderState ManagementHTTPREST API callsGoogle Sign InOAuth Authentication

📁 Project Structure
todo_app/
├── lib/
│   ├── main.dart                   # App entry point + MultiProvider setup
│   ├── firebase_options.dart       # Firebase configuration
│   ├── models/
│   │   └── task_model.dart         # Task data model
│   ├── providers/
│   │   ├── auth_provider.dart      # Authentication state management
│   │   └── task_provider.dart      # Task state management
│   ├── screens/
│   │   ├── splash_screen.dart      # Auth gate screen
│   │   ├── login_screen.dart       # Login UI
│   │   ├── signup_screen.dart      # Registration UI
│   │   └── home_screen.dart        # Main tasks screen
│   ├── services/
│   │   └── firebase_service.dart   # Firebase REST API calls
│   └── widgets/
│       ├── task_tile.dart          # Task card widget
│       └── add_edit_task_sheet.dart # Bottom sheet for add/edit
├── android/
│   └── app/
│       └── google-services.json    # Firebase Android config
└── pubspec.yaml                    # Dependencies

⚙️ Setup & Installation
Prerequisites

Flutter SDK (>= 3.0.0)
Android Studio / VS Code
Firebase account

Steps

Clone the repository

bashgit clone https://github.com/balajidev-io/todo-app.git
cd todo-app

Install dependencies

bashflutter pub get

Firebase Setup

Create a Firebase project at console.firebase.google.com
Enable Email/Password Authentication
Enable Realtime Database
Download google-services.json and place in android/app/
Update lib/firebase_options.dart with your config values


Run the app

bashflutter run

Build APK

bashflutter build apk --release

📦 Dependencies
yamldependencies:
  firebase_core: ^3.1.0
  firebase_auth: ^5.1.0
  google_sign_in: ^6.2.1
  provider: ^6.1.2
  http: ^1.2.1
  shared_preferences: ^2.2.3
  fluttertoast: ^8.2.5
  uuid: ^4.4.0
  intl: ^0.19.0

📲 Download APK
👉 Download Latest APK

🏗️ Architecture
UI Layer (Screens & Widgets)
        ↓
State Layer (Providers)
        ↓
Service Layer (FirebaseService)
        ↓
Firebase Realtime Database (REST API)

👨‍💻 Developer
Balaji

GitHub: @balajidev-io

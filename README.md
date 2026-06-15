<h1 align="center">🌿 MindHaven</h1>

<p align="center">
  A modern Mental Wellness & Self-Care Application built with Flutter.
</p>

<p align="center">
  Flutter • Supabase • PostgreSQL • Provider • Cross-Platform
</p>

---

## 📖 Project Overview

MindHaven is a cross-platform mental wellness application designed to help users track emotions, maintain personal journals, practice mindfulness, and preserve meaningful memories in a calming digital environment.

The project combines modern Flutter development with a secure Supabase backend to provide a scalable, user-focused wellness platform. MindHaven emphasizes emotional awareness, self-reflection, and personal growth while maintaining a clean, responsive, and aesthetically pleasing user experience.

The application currently features a production-ready backend foundation with secure authentication, cloud storage integration, PostgreSQL database architecture, and Row-Level Security (RLS). Current development efforts are focused on journal synchronization, analytics visualization, notifications, and production deployment.

---

# 🚀 Tech Stack

## Frontend
- Flutter
- Dart
- Provider (State Management)

## Local Storage
- Shared Preferences

## Backend
- Supabase
- PostgreSQL

## Authentication
- Supabase Auth

## Cloud Infrastructure
- Supabase Storage
- Row-Level Security (RLS)

## Deployment Targets
- Flutter Web
- Android

---

# 🔐 Authentication & Security

- Secure Supabase Authentication
- Persistent User Sessions
- Cross-Platform Session Management
- Deep-Link Redirect Handling
- Row-Level Security (RLS)
- User-Isolated Data Access
- Secure Database Policies

---

# ☁️ Cloud Infrastructure

- PostgreSQL Database
- Supabase Storage Bucket Integration
- Cloud Image Asset Management
- Journal Media Upload Support
- Scalable Backend Architecture
- Secure Data Synchronization

---

# ✨ Features

## 🎨 Theme Management System

- Light Mode
- Dark Mode
- Persistent Theme Selection
- Theme Switching from Settings

---

## 🌄 Custom Background Environment System

Users can personalize the application using multiple visual environments.

### Calm Theme
- Calm Light
- Calm Dark

### Forest Theme
- Forest Light
- Forest Dark

### Galaxy Theme
- Galaxy Light
- Galaxy Dark

---

## 🏠 Home Dashboard

- Personalized Welcome Message
- Daily Motivational Quotes
- Mood Summary Section
- Journal Reminder Card
- Mindfulness Prompt
- Usage Statistics Overview

---

## 😊 Mood Tracker

### Supported Mood Types

- 😊 Happy
- 😌 Calm
- 😔 Sad
- 😡 Angry
- 😴 Tired

### Features

- Mood Logging
- Historical Mood Tracking
- Daily Mood Records
- Analytics-Ready Data Pipeline

---

## 📓 Journal Module

### Features

- Rich Text Journal Writing
- Reflection Notes
- Daily Entries
- Cloud Synchronization
- Image Attachment Support
- Markdown-Based Content Storage

---

## 💭 Memory Reflection Module

### Features

- Memory Storage
- Reflection Writing
- Personal Growth Tracking
- Memory History Management

---

## 🧘 Mindfulness Module

### Features

- Guided Breathing Exercises
- Relaxation Sessions
- Wellness Prompts

---

## ⚙️ Settings Module

### Current Features

- Theme Selection
- Background Selection
- Preference Management
- Persistent User Settings

---

# 📊 Project Progress

| Module | Status |
|----------|----------|
| UI Screens | ✅ 95% Complete |
| Navigation Architecture | ✅ 100% Complete |
| Theme Management | ✅ 90% Complete |
| Background Management | 🟡 75% Complete |
| Shared Preferences | ✅ Complete |
| Authentication System | ✅ Complete |
| Database Schema Design | ✅ Complete |
| Supabase Infrastructure | ✅ Complete |
| Row-Level Security (RLS) | ✅ Complete |
| Cloud Storage Integration | ✅ Complete |
| Journal Synchronization | 🟡 75% Complete |
| Analytics Dashboard | 🟡 70% Complete |
| Notification System | ❌ Not Started |
| Production Web Build | ❌ Not Started |

### Overall Progress

- **Frontend:** ~90% Complete
- **Backend:** ~85% Complete
- **Overall Project:** ~85% Complete

---

# 🏗️ System Architecture

## Flutter Project Structure

```text
lib/
│
├── screens/
│   ├── home/
│   ├── journal/
│   ├── mood/
│   └── settings/
│
├── providers/
│   ├── auth_provider.dart
│   ├── journal_provider.dart
│   ├── mood_provider.dart
│   ├── theme_manager.dart
│   └── background_manager.dart
│
├── services/
│   ├── supabase_service.dart
│   └── storage_service.dart
│
├── widgets/
├── assets/
└── main.dart
```

## Database Schema (Supabase PostgreSQL)

### Profiles
- id, username, full_name, avatar_url, email
- age, background, dob
- created_at, updated_at

### Moods
- id, user_id, mood, date, created_at

### Journals
- id, user_id, title, content, date, image_url, created_at

### Memories
- id, user_id, title, date, image_url, created_at

---

# 📌 Remaining Development Roadmap

## Phase 1: Journal Synchronization

- [ ] Complete journal_provider refactoring
- [ ] Connect markdown editor directly to Supabase
- [ ] Finalize image upload synchronization
- [ ] Optimize cloud data flow

## Phase 2: Analytics Dashboard

- [ ] Complete fl_chart integration
- [ ] Build mood trend visualizations
- [ ] Implement weekly wellness summaries
- [ ] Add journal activity statistics

## Phase 3: Notification System

- [ ] Implement local notifications
- [ ] Configure timezone-aware reminders
- [ ] Add recurring wellness check-ins

## Phase 4: Production Deployment

- [ ] Verify Flutter Web compilation
- [ ] Perform responsive layout testing
- [ ] Configure production environment variables
- [ ] Deploy production build

---

# 🔮 Future Enhancements

- AI Wellness Assistant
- Personalized Quotes
- Mood Prediction & Insights
- Journal Export (PDF)
- Calendar Integration
- Wellness Streak Tracking
- Advanced Data Visualization
- Guided Meditation Library

---

# 🛠️ Getting Started

```bash
git clone https://github.com/Dhriti2513/mindhaven.git
cd mindhaven
flutter pub get
flutter run
```

## Configure Supabase

Create a `.env` file:

```env
SUPABASE_URL=your_project_url
SUPABASE_ANON_KEY=your_project_anon_key
```

---

# 📄 License

This project is developed for educational, learning, and portfolio purposes.

---

## 👩‍💻 Developer

**Dhriti Dixit**

B.Tech Computer Science & Engineering (Artificial Intelligence)

Flutter Developer • AI Enthusiast • Full-Stack Learner

MindHaven represents my journey of combining Flutter development, cloud technologies, and mental wellness to build a scalable, production-ready cross-platform application focused on well-being and self-growth.

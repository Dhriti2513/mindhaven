<h1 align="center">🌿 MindHaven</h1>

<p align="center">
  A modern Mental Wellness & Self-Care Application built with Flutter.
</p>

MindHaven is a cross-platform wellness application designed to help users track emotions, maintain personal journals, practice mindfulness, and reflect on memories in a calming digital environment. The project focuses on creating a safe and aesthetically pleasing space for self-growth while demonstrating modern Flutter development practices.

---

## 📖 Project Overview

MindHaven combines mental wellness tools into a single platform where users can:

- Track daily moods using emoji-based mood logging
- Maintain personal journals and reflections
- Practice mindfulness through guided breathing exercises
- Review emotional history and self-growth patterns
- Customize their experience using themes and background environments

The application is currently frontend-focused and is being prepared for backend integration using Supabase and PostgreSQL.

---

## 🚀 Tech Stack

### Frontend
- Flutter
- Dart
- Provider (State Management)

### Local Storage
- Shared Preferences

### Backend
- Supabase
- PostgreSQL

### Authentication
- Supabase Auth

### Deployment Target
- Flutter Web
- Android

---

# ✨ Features

## 🎨 Theme Management System

- Light Mode
- Dark Mode
- Persistent Theme Selection
- Theme Switching from Settings

---

## 🌄 Custom Background Environment System

Users can personalize the app using multiple visual environments:

### Calm Theme
- Calm Light
- Calm Dark

### Forest Theme
- Forest Light
- Forest Dark

### Galaxy Theme
- Galaxy Light
- Galaxy Dark

Backgrounds are designed to be applied consistently throughout the application using a centralized background management system.

---

## 🏠 Home Dashboard

The Home Screen includes:

- Personalized Welcome Message
- Daily Motivational Quote
- Mood Summary Section
- Journal Reminder Card
- Mindfulness Prompt
- Usage Statistics Overview

---

## 😊 Mood Tracker

Track emotions using emoji-based mood selection.

### Supported Mood Types

- 😊 Happy
- 😌 Calm
- 😔 Sad
- 😡 Angry
- 😴 Tired

### Planned Enhancements

- Mood History
- Mood Calendar
- Mood Analytics
- Trend Visualization

---

## 📓 Journal Module

A dedicated space for writing thoughts and reflections.

### Features

- Journal Writing Interface
- Reflection Notes
- Daily Entries

### Planned Enhancements

- Cloud Storage
- Edit Journal Entries
- Delete Journal Entries
- Search Functionality

---

## 🧘 Mindfulness Module

Designed to encourage relaxation and mental clarity.

### Features

- Guided Breathing Interface
- Relaxation Exercises

### Planned Enhancements

- Breathing Animations
- Meditation Timer
- Audio Sessions
- Sleep and Focus Guides

---

## 💭 Memory Reflection Module

A personal reflection space where users can revisit meaningful memories and experiences.

### Features

- Reflection Writing
- Memory Storage Interface

### Planned Enhancements

- Reflection History
- Timeline View
- Search and Filtering

---

## ⚙️ Settings Module

### Current Features

- Theme Selection
- Background Selection
- Preference Management

---

# 📊 Project Progress

| Module | Status |
|----------|----------|
| UI Screens | ✅ 95% Complete |
| Navigation System | ✅ 100% Complete |
| Theme Management | ✅ 90% Complete |
| Background Management | 🟡 75% Complete |
| Shared Preferences | 🟡 70% Complete |
| Database Schema Design | ✅ 100% Complete |
| Supabase Project Setup | ✅ Complete |
| Supabase Configuration | 🟡 In Progress |
| Supabase Authentication | ❌ Not Started |
| CRUD Integration | ❌ Not Started |
| Analytics Dashboard | 🟡 20% Complete |
| Web Deployment | ❌ 0% Complete |

### Overall Progress

- **Frontend:** ~85-90% Complete
- **Backend:** Not Started
- **Total Project:** ~60-65% Complete

---

# 🏗️ System Architecture

## Flutter Project Structure

```text
lib/
│
├── screens/
│   ├── home
│   ├── journal
│   ├── mood
│   ├── mindfulness
│   ├── reflection
│   └── settings
│
├── providers/
│   ├── theme_manager
│   └── background_manager
│
├── widgets/
│
├── assets/
│   ├── calm
│   ├── forest
│   └── galaxy
│
└── main.dart
```

## Database Schema (Supabase PostgreSQL)

### Profiles

| Field | Type |
|---------|---------|
| id | UUID |
| username | Text |
| full_name | Text |
| avatar_url | Text |
| email | Text |
| age | Integer |
| background | Text |
| dob | Date |
| created_at | Timestamp |
| updated_at | Timestamp |

### Moods

| Field | Type |
|---------|---------|
| id | UUID |
| user_id | UUID |
| mood | Text |
| date | Date |
| created_at | Timestamp |

### Journals

| Field | Type |
|---------|---------|
| id | UUID |
| user_id | UUID |
| title | Text |
| content | Text |
| date | Date |
| image_url | Text |
| created_at | Timestamp |

### Memories

| Field | Type |
|---------|---------|
| id | UUID |
| user_id | UUID |
| title | Text |
| date | Date |
| image_url | Text |
| created_at | Timestamp |

### Relationships

```text
auth.users
    │
    └── profiles
          │
          ├── moods
          ├── journals
          └── memories
```
---

# 📌 Pending Tasks

## Phase 1: Frontend Polish

- [ ] Fix global background wrapper
- [ ] Resolve background inconsistency across screens
- [ ] Fix Mindfulness screen background coverage
- [ ] Improve responsiveness
- [ ] UI consistency review

---

## Phase 2: Supabase Integration

- [ ] Connect Flutter application to Supabase
- [ ] Configure environment variables and secure credentials
- [ ] Implement Supabase Authentication
- [ ] Enable Row Level Security (RLS)
- [ ] Create service layer for database operations

---

## Phase 3: Database Connectivity

- [ ] Implement Journal CRUD Operations
- [ ] Implement Mood CRUD Operations
- [ ] Implement Memory CRUD Operations
- [ ] Create Repository/Service Layer
- [ ] Connect Screens to Supabase

---

## Phase 4: Analytics Dashboard

- [ ] Mood Trends
- [ ] Journal Statistics
- [ ] Wellness Score
- [ ] Activity Streaks
- [ ] Weekly Insights

---

## Phase 5: Mindfulness Improvements

- [ ] Guided Audio Sessions
- [ ] Meditation Timers
- [ ] Animated Breathing Exercises
- [ ] Focus Sessions

---

## Phase 6: Web Deployment

- [ ] Deploy Flutter Web Application
- [ ] Configure Production Environment Variables
- [ ] Deploy to Vercel / Netlify / Supabase-compatible Hosting

---

# 🔮 Future Enhancements

- Google Sign-In via Supabase Auth
- Email Authentication
- User Profile Management
- Personalized Quotes
- Mood Prediction
- AI Wellness Assistant
- Journal Export (PDF)
- Calendar Integration
- Wellness Streak Tracking
- Data Visualization Dashboard

---

# 🛠️ Getting Started

### Clone Repository

```bash
git clone https://github.com/yourusername/mindhaven.git
cd mindhaven
```

### Install Dependencies

```bash
flutter pub get
```

### Configure Supabase

Create a `.env` file in the project root and add:

```env
SUPABASE_URL=your_project_url
SUPABASE_ANON_KEY=your_anon_key
```

### Run Application

```bash
flutter run
```

### Build Web Version

```bash
flutter build web
```

---

# 📄 License

This project is developed for educational, learning, and portfolio purposes.

---

## 👩‍💻 Developer

**Dhriti Dixit**

B.Tech Computer Science & Engineering (Artificial Intelligence)  
Flutter Developer • AI Enthusiast • Full-Stack Learner

Passionate about building impactful applications that combine technology, user experience, and well-being.

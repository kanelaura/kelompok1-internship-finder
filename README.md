# Kelompok 1 Internship Finder - Mobile App

Aplikasi mobile untuk mencari dan melamar lowongan magang dengan mudah dan cepat.

**Tugas Besar:** Dasar Pemrograman Perangkat Bergerak (DPPB)  
**Universitas:** Telkom University  
**Semester:** 3

---

## Team Members

| Nama | NIM | Role | File |
|------|-----|------|------|
| **Hidayat Nurwahid** | 1103213xxx | Authentication & Splash | [`lib/hidayat_auth.dart`](lib/hidayat_auth.dart) |
| **Arsyad Defira Maulana** | 1103213xxx | Home & Internship Management | [`lib/arsyad-home.dart`](lib/arsyad-home.dart) |
| **M Dzikra Hafidz Fauzan** | 1103213xxx | Profile & Application Management | [`lib/dzikra-profile.dart`](lib/dzikra-profile.dart) |

---

## Features Overview

### Module 1: Authentication & Splash (Hidayat Nurwahid)

**Screens:**
- Splash Screen - Tampilan awal dengan logo dan auto navigation (3 detik)
- Login Screen - Form autentikasi dengan email dan password
- Register Screen - Pendaftaran akun baru dengan validasi lengkap

**Alerts:**
- Login error dialog
- Forgot password dialog
- Register validation error dialog
- Register success dialog

**Navigation:**
- Navigator.pushReplacement (Splash to Login, Login to Main)
- Navigator.push (Login to Register)
- Navigator.pop (Close dialogs, Register to Login)

---

### Module 2: Home & Internship Management (Arsyad Defira Maulana)

**Screens:**
- Main Screen - Bottom Navigation Bar dengan 4 tabs
- Home Screen - List lowongan magang dengan Card layout
- Search Screen - Pencarian lowongan dengan TextField
- Internship Detail Screen - Informasi lengkap lowongan

**Features:**
- Bottom Navigation (Home, Saved, Applications, Profile)
- List lowongan dengan dummy data
- Search functionality dengan empty state
- Filter Bottom Sheet (Lokasi dan Tipe Pekerjaan)
- Bookmark functionality dengan SnackBar feedback
- Notification dialog

**Navigation:**
- Bottom Navigation tab switching (setState)
- Navigator.push (Home to Search, Home to Detail)
- Navigator.pop (Back from Search/Detail)

---

### Module 3: Profile & Application Management (M Dzikra Hafidz Fauzan)

**Screens:**
- Application Form Screen - Form lamaran dengan validasi
- Applications History Screen - Riwayat lamaran dengan status badge
- Profile Screen - Info user dengan menu navigasi
- Edit Profile Screen - Update data pribadi

**Features:**
- Form lamaran lengkap (Nama, Email, Phone, Education, Cover Letter)
- Status badge color-coding (Orange: Direview, Green: Diterima, Red: Ditolak)
- Profile menu dengan Card + ListTile
- Edit foto profil (placeholder)
- Logout dengan clear navigation stack

**Alerts:**
- Submit confirmation dialog
- Application success dialog
- Logout confirmation dialog
- Profile update success dialog
- Info dialogs untuk fitur yang belum tersedia

**Navigation:**
- Navigator.push (Profile to Edit, Profile to History)
- Navigator.pop (Back from Edit/History)
- Navigator.pushAndRemoveUntil (Logout to Login)

---

## Project Summary

| Metric | Count |
|--------|-------|
| **Total Screens** | 11 screens |
| **Total Alerts** | 13+ dialogs, bottom sheets, snackbars |
| **Navigation Types** | push, pop, pushReplacement, pushAndRemoveUntil, bottom nav |
| **Lines of Code** | Approx. 1600+ lines (main.dart) |
| **Team Members** | 3 members |

---

## Tech Stack

- **Framework:** Flutter 3.0+
- **Language:** Dart
- **Platform:** Android & iOS (Cross-platform)
- **State Management:** setState (basic state management)
- **UI Components:** Material Design widgets
- **Navigation:** Navigator (Flutter built-in)
- **Data Management:** Dummy data with List<Map<String, dynamic>>
- **Form Handling:** TextEditingController with validation

---

## Installation & Setup

### Prerequisites

Pastikan sudah terinstall:
- Flutter SDK 3.0 atau lebih baru
- Dart SDK 3.0 atau lebih baru
- Android Studio / VS Code dengan Flutter plugin
- Android Emulator / iOS Simulator / Chrome browser

### Installation Steps

```bash
# 1. Clone repository
git clone https://github.com/kanelaura/kelompok1-internship-finder.git

# 2. Masuk ke folder project
cd kelompok1-internship-finder

# 3. Install dependencies
flutter pub get

# 4. Verify Flutter installation
flutter doctor

# 5. Run application
flutter run

# Atau run di platform spesifik:
flutter run -d chrome          # Run di Chrome browser
flutter run -d android         # Run di Android emulator
flutter run -d <device_id>     # Run di device tertentu
```

### Check Available Devices

```bash
flutter devices
```

---

## Testing Credentials

Untuk login ke aplikasi, gunakan kredensial berikut:

```
Email:    user@mail.com
Password: 123456
```

**Note:** Ini adalah dummy credentials untuk keperluan testing aplikasi.

---

## Project Structure

```
kelompok1-internship-finder/
├── lib/
│   ├── main.dart              # File gabungan lengkap (semua module terintegrasi)
│   ├── hidayat_auth.dart      # Module Authentication (Hidayat)
│   ├── arsyad-home.dart       # Module Home & Internship (Arsyad)
│   └── dzikra-profile.dart    # Module Profile & Application (Dzikra)
├── docs/                      # Dokumentasi project (akan ditambahkan)
│   ├── DOKUMENTASI_PROJECT.md
│   ├── LAPORAN_PROGRESS.md
│   └── screenshots/           # Screenshot aplikasi
├── .gitignore
├── pubspec.yaml
└── README.md
```

---

## Features Checklist

### Assessment 2 Requirements

- [x] Minimal 3 screen per anggota
- [x] Navigasi lengkap (push, pop, pushReplacement, pushAndRemoveUntil)
- [x] Alert/Dialog implementation (minimal 1 per anggota)
- [x] Form validation
- [x] Widget variety (Column, Row, Container, Card, ListView, TextField, Button, dll)
- [x] State management dengan setState
- [x] Commit history jelas per anggota
- [x] Dummy data untuk testing

---

## Screenshots

**Note:** Screenshots akan ditambahkan setelah development selesai.

### Authentication Module
- Splash Screen
- Login Screen
- Register Screen

### Home & Internship Module
- Main Screen (Bottom Navigation)
- Home Screen (List Lowongan)
- Search Screen
- Internship Detail Screen

### Profile & Application Module
- Application Form Screen
- Applications History Screen
- Profile Screen
- Edit Profile Screen

---

## Development Timeline

| Week | Activities | Status |
|------|-----------|--------|
| Week 1 | Setup project, diskusi pembagian tugas, dokumentasi | Completed |
| Week 2 | Parallel development (Auth, Home, Profile modules) | In Progress |
| Week 3 | Integration, testing, bug fixing | Planned |
| Week 4 | Final testing, screenshots, dokumentasi lengkap | Planned |
| Week 5 | Review dan submission | Planned |

---

## Commit Guidelines

Format commit message yang digunakan:

```
<type>(<scope>): <description> - <nama anggota>

type: feat, fix, docs, chore, refactor, style
scope: auth, home, profile, main
description: penjelasan singkat perubahan
nama anggota: Hidayat, Arsyad, Dzikra, atau Team
```

**Contoh:**
```
feat(auth): add splash screen with auto navigation - Hidayat
fix(home): repair card layout on small screens - Arsyad
docs: update README with installation guide - Team
```

---

## Known Issues

- CORS policy error saat load gambar eksternal di web browser (solved: testing di mobile)
- Belum ada integrasi dengan backend (menggunakan dummy data)
- Fitur Ubah Password belum diimplementasikan (placeholder)
- Fitur Upload Foto belum diimplementasikan (placeholder)

---

## Future Improvements

- Integrasi dengan REST API backend
- Implementasi state management yang lebih advanced (Provider/Riverpod/Bloc)
- Upload foto profil dan dokumen lamaran
- Real-time notification
- Filter dan sorting yang lebih kompleks
- Pagination untuk list lowongan
- Dark mode support

---

## Documentation

Dokumentasi lengkap tersedia di folder `docs/`:
- [DOKUMENTASI_PROJECT.md](docs/DOKUMENTASI_PROJECT.md) - Dokumentasi lengkap project
- [LAPORAN_PROGRESS.md](docs/LAPORAN_PROGRESS.md) - Laporan progress pengerjaan
- [PANDUAN_GITHUB.md](docs/PANDUAN_GITHUB.md) - Panduan Git & GitHub

---

## Contributing

Project ini adalah tugas akademik untuk mata kuliah Dasar Pemrograman Perangkat Bergerak. Kontribusi terbatas untuk anggota kelompok:

1. **Hidayat Nurwahid** - Authentication & Splash
2. **Arsyad Defira Maulana** - Home & Internship Management
3. **M Dzikra Hafidz Fauzan** - Profile & Application Management

---

## License

Academic Project - Dasar Pemrograman Perangkat Bergerak  
Telkom University © 2025

Project ini dibuat untuk keperluan akademik dan pembelajaran.

---

## Contact

**Kelompok 1 - Internship Finder**

| Anggota | Email | GitHub |
|---------|-------|--------|
| Hidayat Nurwahid | [email] | [@username] |
| Arsyad Defira Maulana | [email] | [@username] |
| M Dzikra Hafidz Fauzan | [email] | [@username] |

**Repository:** https://github.com/kanelaura/kelompok1-internship-finder  
**Last Updated:** 11 Desember 2025  
**Version:** 1.0.0

---

## Acknowledgments

- Dosen Pengampu: [Nama Dosen]
- Mata Kuliah: Dasar Pemrograman Perangkat Bergerak
- Institusi: Telkom University
- Semester: 3 / Tahun Akademik 2025/2026

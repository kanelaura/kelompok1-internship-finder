# INTERNSHIP FINDER
## Dokumentasi Project - Assessment 2

**Mata Kuliah:** Dasar Pemrograman Perangkat Bergerak (DPPB)  
**Semester:** 3 / Tahun Akademik 2025/2026  
**Kelompok:** 1  
**Assessment:** Assessment 2 - Layout, Widget & Navigasi

---

## DESKRIPSI APLIKASI

**Internship Finder** adalah aplikasi mobile berbasis Flutter yang membantu mahasiswa mencari dan melamar lowongan magang dengan mudah dan cepat.

### Tujuan Aplikasi:
- Memudahkan mahasiswa dalam mencari lowongan magang
- Menyediakan informasi lengkap tentang posisi magang
- Mempermudah proses aplikasi/melamar magang
- Mengelola riwayat lamaran dalam satu platform

### Target User:
- Mahasiswa yang sedang mencari program magang/internship
- Fresh graduate yang ingin mendapat pengalaman kerja

---

## FITUR APLIKASI

### 1. Authentication & Splash (Hidayat Nurwahid)
**Screens (3):**
- Splash Screen dengan auto navigation
- Login Screen dengan validasi
- Register Screen dengan validasi lengkap

**Alerts (4):**
- Login error dialog
- Forgot password dialog
- Register validation dialog
- Register success dialog

**Teknologi:**
- Widget: TextField, Column, Row, AlertDialog, ElevatedButton
- Navigation: pushReplacement, push, pop
- State: setState, TextEditingController

---

### 2. Home & Internship Management (Arsyad Defira Maulana)
**Screens (4):**
- Main Screen dengan Bottom Navigation (4 tabs)
- Home Screen dengan list lowongan
- Search Screen dengan filter
- Detail Screen dengan informasi lengkap

**Alerts (4):**
- Notification dialog
- Filter Bottom Sheet (lokasi & tipe)
- Bookmark SnackBar
- Filter applied SnackBar

**Teknologi:**
- Widget: BottomNavigationBar, ListView.builder, Card, GestureDetector
- Widget: ModalBottomSheet, DropdownButtonFormField
- Navigation: Bottom nav switching, push, pop
- Data: List<Map<String, dynamic>>

---

### 3. Profile & Application Management (M Dzikra Hafidz Fauzan)
**Screens (4):**
- Application Form dengan validasi
- Applications History dengan status badge
- Profile Screen dengan menu
- Edit Profile

**Alerts (5):**
- Submit confirmation dialog
- Application success dialog
- Logout confirmation dialog
- Profile update success dialog
- Info dialogs

**Teknologi:**
- Widget: Form, TextFormField, ListView.builder, Stack, Positioned
- Widget: CircleAvatar, Card, ListTile
- Navigation: push, pop, pushAndRemoveUntil
- Features: Form validation, Status badge color-coding

---

## PEMBAGIAN TUGAS KELOMPOK

| Anggota | NIM | Kontribusi | File |
|---------|-----|------------|------|
| **Hidayat Nurwahid** | 607012400045 | Auth & Splash (3 screens, 4 alerts) | `hidayat-auth.dart` |
| **Arsyad Defira Maulana** | 607012400094 | Home & Internship (4 screens, 4 alerts) | `arsyad-home.dart` |
| **M Dzikra Hafidz Fauzan** | 607012400050 | Profile & Application (4 screens, 5 alerts) | `dzikra-profile.dart` |

---

## SUMMARY

| Metric | Count |
|--------|-------|
| **Total Screens** | 11 screens |
| **Total Alerts** | 13 alerts |
| **Navigation Types** | 4 types |
| **Team Members** | 3 members |

---

## REQUIREMENT ASSESSMENT 2

### Ketentuan Tugas Besar - Assessment 2
**Fokus:** Layout, Widget & Navigasi

| Requirement | Minimum | Actual | Status |
|-------------|---------|--------|--------|
| Screens per anggota | 3 | 3-4 |  Exceeded |
| Alert per anggota | 1 | 4-5 |  Exceeded |
| Widget & Layout | Required | 20+ widgets |  Complete |
| Navigasi | Required | 4 types |  Complete |

**Kesimpulan:** Semua requirement terpenuhi dengan melebihi target minimum.

---

## TEKNOLOGI YANG DIGUNAKAN

- **Framework:** Flutter 3.0+
- **Language:** Dart
- **Platform:** Android & iOS (Cross-platform)
- **State Management:** setState
- **UI:** Material Design
- **Navigation:** Navigator (built-in)
- **Data:** Dummy data (List<Map<String, dynamic>>)

---

## TIMELINE PENGERJAAN

| Phase | Period | Status |
|-------|--------|--------|
| Setup & Planning | 28 Nov - 4 Des 2025 | Completed |
| Development & Testing | 5 Des - 10 Des 2025 | Completed |
| Presentasi Assessment 2 | 11 Des 2025 | Proses |

**Total Duration:** 14 hari (28 Nov - 11 Des 2025)

---

## DELIVERABLES ASSESSMENT 2

- [X] Source code (main.dart + 3 module files)
- [X] GitHub repository dengan commit history
- [X] Dokumentasi lengkap
- [X] Screenshot 11 screens
- [] Akan presentasi

---

## NEXT PHASE - ASSESSMENT 3

**Fokus:** Alert, ListView & HTTP

**Planned Features:**
- API integration (dari APSI/PABW atau API publik)
- HTTP Methods (GET, POST, PUT/DELETE)
- Replace dummy data dengan real API data
- ListView dengan data dari API

**Timeline:** TBA (akan ditentukan setelah Assessment 2)

---

**Dosen Pengampu:** Lukmanul Hakim Firdaus  
**Repository:** https://github.com/kanelaura/kelompok1-internship-finder  
**Assessment 2 Status:**  Akan presentasi  
**Last Updated:** 11 Desember 2025

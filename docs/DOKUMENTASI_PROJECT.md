# INTERNSHIP FINDER
## Dokumentasi Project - Tugas Besar DPPB

## DESKRIPSI APLIKASI

**Internship Finder** adalah aplikasi mobile berbasis Flutter yang akan membantu mahasiswa mencari dan melamar lowongan magang dengan mudah dan cepat.

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

### 1. Authentication (Login & Register)
- Login dengan email dan password
- Register akun baru
- Validasi input

### 2. Home & Pencarian
- List lowongan magang
- Search lowongan
- Filter (lokasi & tipe)
- Bookmark lowongan favorit

### 3. Detail Lowongan
- Info lengkap lowongan
- Deskripsi, requirements, benefit
- Gaji/Stipend
- Apply button

### 4. Aplikasi Lamaran
- Form lengkap
- Data pribadi & cover letter
- Validasi form

### 5. Manajemen Lamaran
- Riwayat lamaran
- Status tracking (Direview/Diterima/Ditolak)
- Tanggal aplikasi

### 6. Profil & Settings
- View & edit profil
- Change password
- Logout

### 7. Bottom Navigation
- 4 tabs (Home, Saved, Applications, Profile)

---

## PEMBAGIAN TUGAS KELOMPOK

### ANGGOTA 1 - Hidayat Nurwahid (Authentication & Splash)

| No | Use Case / Fitur | Deskripsi & Fungsionalitas |
|----|-----------------|---------------------------|
| 1. | Splash Screen | Membuat tampilan awal dengan logo, auto navigation ke Login setelah 3 detik menggunakan `Future.delayed` dan `Navigator.pushReplacement` |
| 2. | Login | Form email & password dengan validasi, toggle show/hide password, navigate ke Main Screen jika berhasil, error dialog jika gagal |
| 3. | Register | Form lengkap (nama, email, password, confirm password) dengan validasi (semua field terisi, password match, minimal 6 karakter), success dialog |
| 4. | Alert: Login Error | Dialog error saat login gagal dengan credentials dummy: user@mail.com / 123456 |
| 5. | Alert: Forgot Password | Dialog info untuk lupa password |
| 6. | Alert: Register Validation | Error dialog untuk validasi registrasi |
| 7. | Alert: Register Success | Success dialog setelah registrasi berhasil |

---

### ANGGOTA 2 - Arsyad Defira Maulana (Home & Internship Management)

| No | Use Case / Fitur | Deskripsi & Fungsionalitas |
|----|-----------------|---------------------------|
| 1. | Main Screen (Bottom Nav) | Screen dengan Bottom Navigation 4 tab, state management dengan `setState` dan `_selectedIndex` |
| 2. | Home Screen | List lowongan dalam Card dengan ListView, search bar, filter button, bookmark |
| 3. | Search Screen | TextField di AppBar dengan autofocus, dummy search results, empty state, clear button |
| 4. | Internship Detail | Info lengkap (deskripsi, requirements, benefit), scrollable dengan SingleChildScrollView, button "Lamar Sekarang" |
| 5. | Alert: Notification | Dialog notifikasi saat icon notification ditekan |
| 6. | Alert: Filter Bottom Sheet | Modal bottom sheet dengan 2 dropdown (Lokasi & Tipe), button Apply dan Reset |
| 7. | Alert: SnackBar | SnackBar feedback untuk bookmark dan filter |
| 8. | Bookmark | Fitur bookmark dengan SnackBar konfirmasi |
| 9. | Dummy Data | Manage data lowongan dalam `List<Map<String, dynamic>>` |

---

### ANGGOTA 3 - M Dzikra Hafidz Fauzan (Profile & Application Management)

| No | Use Case / Fitur | Deskripsi & Fungsionalitas |
|----|-----------------|---------------------------|
| 1. | Application Form | Form data pribadi (nama, email, phone, education) dan cover letter multiline, validasi semua field terisi |
| 2. | Applications History | List riwayat lamaran dengan Card, status badge color-coded (Orange/Green/Red), tanggal aplikasi |
| 3. | Profile Screen | CircleAvatar, nama & email, menu list dengan Card + ListTile |
| 4. | Edit Profile | Form edit dengan TextEditingController initial values, edit foto placeholder, button Simpan |
| 5. | Alert: Submit Confirmation | Confirmation dialog sebelum kirim lamaran (Batal/Kirim) |
| 6. | Alert: Application Success | Success dialog setelah lamaran dikirim, close dengan double pop |
| 7. | Alert: Logout Confirmation | Confirmation dialog logout dengan `Navigator.pushAndRemoveUntil` |
| 8. | Alert: Profile Update | Success dialog setelah update profil |
| 9. | Alert: Info Dialogs | Info dialog untuk fitur belum tersedia |
| 10. | Dummy Data | Data riwayat lamaran dalam `List<Map<String, dynamic>>` |

---

## SUMMARY PEMBAGIAN TUGAS

| Anggota | Screens | Alerts | Navigasi |
|---------|---------|--------|----------|
| Anggota 1 | 3 | 4 | push, pop, pushReplacement |
| Anggota 2 | 4 | 4 | push, pop, bottom nav |
| Anggota 3 | 4 | 5 | push, pop, pushAndRemoveUntil |
| **TOTAL** | **11** | **13+** | **Complete** |

---

## KRITERIA PENILAIAN

- [ ] 3+ screen per anggota
- [ ] Navigasi lengkap
- [ ] 1+ alert per anggota
- [ ] Widget: Column, Row, Container, Card, ListView, TextField, Button
- [ ] State management: setState
- [ ] Form handling: TextEditingController

---

## CATATAN TEKNIS

- Framework: Flutter 3.0+
- Bahasa: Dart
- Platform: Android & iOS
- Dummy Data: `List<Map<String, dynamic>>`
- No Backend (Assessment 2)

---

## TIMELINE PENGERJAAN

| Minggu | Aktivitas | Status |
|--------|-----------|--------|
| Minggu 1 | Setup & dokumentasi | Belum |
| Minggu 2 | Development parallel | Belum |
| Minggu 3 | Integration & testing | Belum |
| Minggu 4 | Final testing & screenshot | Belum |
| Minggu 5 | Review & submission | Belum |

---

## DELIVERABLES

- [ ] Source code (main.dart)
- [ ] Screenshot (11 screens)
- [ ] Dokumentasi project
- [ ] APK file
- [ ] Video demo (opsional)

---

**Last Updated:** 11 Desember 2025

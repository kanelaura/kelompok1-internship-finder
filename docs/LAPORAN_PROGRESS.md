# LAPORAN PROGRESS INTERNSHIP FINDER - DPPB

**Kelompok:** 1  
**Assessment:** Assessment 2 - Layout, Widget & Navigasi  
**Status:**  Akan presentasi (11 Des 2025)  
**Tanggal Laporan:** 11 Desember 2025

---

## RINGKASAN PROGRESS

| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| **Total Screens** | 9+ | 11 | Completed |
| **Total Alerts** | 3+ | 13 | Completed |
| **Development** | 100% | 100% | Completed |
| **Testing** | 100% | 100% | Completed |
| **Documentation** | 100% | 100% | Completed |
| **Screenshots** | 11 | 11 | Completed |

**Overall Progress:** 100% - Assessment 2 Complete

---

## PROGRESS PER ANGGOTA

### ANGGOTA 1 - HIDAYAT NURWAHID

| Item | Detail |
|------|--------|
| **NIM** | 607012400045 |
| **Role** | Authentication & Splash |
| **Kontribusi** | 3 screens, 4 alerts |
| **File** | `lib/hidayat-auth.dart` |
| **Status** |  Complete |

**Screens:**
1. Splash Screen - Auto navigation (3 detik)
2. Login Screen - Form dengan validasi
3. Register Screen - Form registrasi lengkap

**Alerts:**
1. Login error dialog
2. Forgot password dialog
3. Register validation dialog
4. Register success dialog

**Teknologi:**
- Widgets: TextField, Column, Row, AlertDialog
- Navigation: pushReplacement, push, pop
- State: setState, TextEditingController

---

### ANGGOTA 2 - ARSYAD DEFIRA MAULANA

| Item | Detail |
|------|--------|
| **NIM** | 607012400094 |
| **Role** | Home & Internship Management |
| **Kontribusi** | 4 screens, 4 alerts |
| **File** | `lib/arsyad-home.dart` |
| **Status** |  Complete |

**Screens:**
1. Main Screen - Bottom Navigation (4 tabs)
2. Home Screen - List lowongan
3. Search Screen - Pencarian dengan filter
4. Detail Screen - Info lengkap lowongan

**Alerts:**
1. Notification dialog
2. Filter Bottom Sheet
3. Bookmark SnackBar
4. Filter applied SnackBar

**Teknologi:**
- Widgets: BottomNavigationBar, ListView.builder, Card
- Widgets: ModalBottomSheet, DropdownButtonFormField
- Navigation: Bottom nav, push, pop
- Data: List<Map<String, dynamic>>

---

### ANGGOTA 3 - M DZIKRA HAFIDZ FAUZAN

| Item | Detail |
|------|--------|
| **NIM** | 607012400050 |
| **Role** | Profile & Application Management |
| **Kontribusi** | 4 screens, 5 alerts |
| **File** | `lib/dzikra-profile.dart` |
| **Status** |  Complete |

**Screens:**
1. Application Form - Form lamaran
2. Applications History - Riwayat dengan status
3. Profile Screen - Info user
4. Edit Profile - Update data

**Alerts:**
1. Submit confirmation dialog
2. Application success dialog
3. Logout confirmation dialog
4. Profile update success dialog
5. Info dialogs

**Teknologi:**
- Widgets: Form, TextFormField, ListView.builder
- Widgets: Stack, Positioned, CircleAvatar
- Navigation: push, pop, pushAndRemoveUntil
- Features: Form validation, Status badge

---

## SCREENSHOTS

### Authentication Module
![01_splash](screenshots/01_splash.png)
![02_login](screenshots/02_login.png)
![03_register](screenshots/03_register.png)

### Home & Internship Module
![04_main](screenshots/04_main.png)
![05_home](screenshots/05_home.png)
![06_search](screenshots/06_search.png)
![07_detail](screenshots/07_detail.png)

### Profile & Application Module
![08_application_form](screenshots/08_application_form.png)
![09_application_history](screenshots/09_application_history.png)
![10_profile](screenshots/10_profile.png)
![11_edit_profile](screenshots/11_edit_profile.png)

---

## TIMELINE DEVELOPMENT

| Date | Phase | Activities | Status |
|------|-------|-----------|--------|
| 28 Nov - 4 Des 2025 | Setup | Project setup, pembagian tugas, dokumentasi | Completed |
| 5 Des - 10 Des 2025 | Development | Coding, testing, screenshots | Completed |
| 11 Des 2025 | Presentation | Presentasi Assessment 2 | Proses |

**Total Duration:** 14 hari

---

## TEKNOLOGI YANG DIGUNAKAN

| Kategori | Detail |
|----------|--------|
| **Framework** | Flutter 3.0+ |
| **Language** | Dart |
| **Platform** | Android & iOS |
| **State Management** | setState |
| **UI** | Material Design |
| **Navigation** | Navigator |
| **Data** | Dummy data |

---

## ASSESSMENT 2 COMPLIANCE

| Requirement | Status |
|-------------|--------|
| Minimal 3 screen per anggota |  11 screens total |
| Minimal 1 alert per anggota |  13 alerts total |
| Widget & Layout yang tepat |  20+ widgets |
| Navigasi |  4 types |
| Dokumentasi | Complete |
| Screenshot |  11 screens |

**Conclusion:** Semua requirement Assessment 2 terpenuhi.

---

## NEXT STEPS - ASSESSMENT 3

**Fokus:** Alert, ListView & HTTP

**Planned Additions:**
- [ ] API integration
- [ ] HTTP Methods (GET, POST, PUT/DELETE)
- [ ] Real data dari API
- [ ] ListView dengan data API

**Timeline:** TBA

---

**Repository:** https://github.com/kanelaura/kelompok1-internship-finder  
**Assessment 2 Status:**  Proses & Akan presentasi  
**Dosen Pengampu:** Lukmanul Hakim Firdaus  
**Last Updated:** 11 Desember 2025

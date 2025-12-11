# PANDUAN GITHUB PROJECT - INTERNSHIP FINDER

**Kelompok:** 1  
**Repository:** https://github.com/kanelaura/kelompok1-internship-finder  
**Last Updated:** 12 Desember 2025

---

## SETUP AWAL

### Step 1: Install Git

1. Download Git: https://git-scm.com/download/win
2. Install dengan default settings
3. Verify installation:
```bash
git --version
```

### Step 2: Setup Git Config

Setiap anggota setup dengan nama masing-masing:
```bash
# Hidayat
git config --global user.name "Hidayat Nurwahid"
git config --global user.email "paslimkimochi@gmail.com"

# Arsyad
git config --global user.name "Arsyad Defira Maulana"
git config --global user.email "arsyad@student.telkomuniversity.ac.id"

# Dzikra
git config --global user.name "M Dzikra Hafidz Fauzan"
git config --global user.email "dzikra@student.telkomuniversity.ac.id"
```

### Step 3: Clone Repository
```bash
git clone https://github.com/kanelaura/kelompok1-internship-finder.git
cd kelompok1-internship-finder
```

---

## CARA COMMIT & PUSH

### Workflow Standard:
```bash
# 1. Pull update terbaru (PENTING!)
git pull origin main

# 2. Edit file kamu

# 3. Check status
git status

# 4. Add file yang sudah diubah
git add lib/hidayat_auth.dart
# atau add semua:
git add .

# 5. Commit dengan message jelas
git commit -m "feat(auth): implement login screen - Hidayat"

# 6. Push ke GitHub
git push origin main
```

---

## FORMAT COMMIT MESSAGE
```
<type>(<scope>): <description> - <nama>

type: feat, fix, docs, chore, refactor
scope: auth, home, profile, main
description: apa yang dikerjakan
nama: Hidayat, Arsyad, Dzikra
```

### Contoh Commit Message:
```bash
# Feature baru
git commit -m "feat(auth): add splash screen - Hidayat"
git commit -m "feat(home): add search functionality - Arsyad"
git commit -m "feat(profile): add application form - Dzikra"

# Bug fix
git commit -m "fix(auth): repair login validation - Hidayat"
git commit -m "fix(home): fix card layout - Arsyad"

# Documentation
git commit -m "docs: update README with screenshots - Team"
git commit -m "docs: add progress report - Hidayat"

# Chore (maintenance)
git commit -m "chore: move main.dart to lib folder - Team"
```

---

## BEST PRACTICES

### DO's ✅

- ✅ **Pull before push** - Selalu pull sebelum push
- ✅ **Commit often** - Commit setiap selesai 1 fitur
- ✅ **Clear messages** - Message yang jelas dan deskriptif
- ✅ **Test first** - Test dulu sebelum commit
- ✅ **One task per commit** - 1 commit untuk 1 task

### DON'Ts ❌

- ❌ **Jangan commit tanpa test** - Bisa break aplikasi
- ❌ **Jangan generic message** - "update", "fix", "test"
- ❌ **Jangan commit file temporary** - .DS_Store, build/, dll
- ❌ **Jangan overwrite** - Selalu pull dulu

---

## TROUBLESHOOTING

### Error: "rejected - non-fast-forward"

**Penyebab:** Ada perubahan di GitHub yang belum di-pull

**Solusi:**
```bash
git pull origin main
git push origin main
```

### Error: Conflict saat Pull

**Penyebab:** File yang sama diedit di 2 tempat

**Solusi:**
1. Pull dan lihat file yang conflict
2. Buka file, cari marker:
```
<<<<<<< HEAD
Kode kamu
=======
Kode di GitHub
>>>>>>> origin/main
```
3. Edit manual, pilih kode yang benar
4. Hapus marker (<<<<, ====, >>>>)
5. Save file
6. Add, commit, push:
```bash
git add .
git commit -m "fix: resolve merge conflict"
git push origin main
```

### Error: "not a git repository"

**Penyebab:** Salah folder

**Solusi:**
```bash
cd "C:\path\to\kelompok1-internship-finder"
git status  # cek apakah sudah benar
```

---

## STRATEGI COMMIT PER ANGGOTA

### Timeline Commit (Sudah Selesai):

**Week 1 (28 Nov - 4 Des 2025):**
```bash
# Hidayat
git commit -m "chore: setup Flutter project - Hidayat"
git commit -m "docs: add project documentation - Hidayat"
git commit -m "feat(auth): add splash screen - Hidayat"

# Arsyad
git commit -m "feat(home): add bottom navigation - Arsyad"
git commit -m "feat(home): add home screen - Arsyad"

# Dzikra
git commit -m "feat(profile): add profile screen - Dzikra"
```

**Week 2 (5 Des - 11 Des 2025):**
```bash
# Hidayat
git commit -m "feat(auth): add login screen - Hidayat"
git commit -m "feat(auth): add register screen - Hidayat"
git commit -m "feat(auth): add alerts and validation - Hidayat"

# Arsyad
git commit -m "feat(home): add search screen - Arsyad"
git commit -m "feat(home): add detail screen - Arsyad"
git commit -m "feat(home): add filter bottom sheet - Arsyad"

# Dzikra
git commit -m "feat(profile): add application form - Dzikra"
git commit -m "feat(profile): add applications history - Dzikra"
git commit -m "feat(profile): add edit profile - Dzikra"

# Team
git commit -m "feat: integrate all modules to main.dart - Team"
git commit -m "docs: add screenshots - Team"
```

---

## SHARE KE DOSEN

**Repository Link:**
```
https://github.com/kanelaura/kelompok1-internship-finder
```

**Template Email:**
```
Subject: Repository GitHub - Assessment 2 DPPB - Kelompok 1

Yth. Bapak Lukmanul Hakim Firdaus,

Berikut link repository GitHub untuk Assessment 2:
https://github.com/kanelaura/kelompok1-internship-finder

Repository ini berisi:
✅ Source code lengkap (11 screens)
✅ Commit history dari semua anggota
✅ Dokumentasi lengkap
✅ Screenshot aplikasi

Anggota Kelompok 1:
1. Hidayat Nurwahid (607012400045) - Authentication
2. Arsyad Defira Maulana (607012400094) - Home & Internship
3. M Dzikra Hafidz Fauzan (607012400050) - Profile & Application

Terima kasih.

Hormat kami,
Kelompok 1 - Internship Finder
```

---

## VERIFIKASI GITHUB

### Checklist:

- [x] Repository public
- [x] README.md lengkap
- [x] Folder docs/ dengan dokumentasi
- [x] Folder docs/screenshots/ dengan 11 screenshots
- [x] File lib/ dengan 4 files (main + 3 modules)
- [x] Commit history jelas per anggota
- [x] .gitignore ada

### Cara Verify:

1. Buka: https://github.com/kanelaura/kelompok1-internship-finder
2. Check commit history (harus ada dari 3 anggota)
3. Check file structure
4. Check screenshots muncul di README

---

**Assessment 2 Status:** ✅ Complete  
**Repository:** https://github.com/kanelaura/kelompok1-internship-finder  
**Last Updated:** 12 Desember 2025

\# PANDUAN GITHUB PROJECT - INTERNSHIP FINDER



\## SETUP AWAL



\### Step 1: Install Git

\- Download: https://git-scm.com/download/win

\- Install dengan default settings

\- Verify: `git --version`



\### Step 2: Setup Git Config

```bash

git config --global user.name "Nama Lengkap"

git config --global user.email "email@example.com"

```



\### Step 3: Clone Repository

```bash

git clone https://github.com/kanelaura/kelompok1-internship-finder.git

cd kelompok1-internship-finder

```



---



\## CARA COMMIT \& PUSH



\### Workflow Setiap Anggota:

```bash

\# 1. Pull update terbaru

git pull origin main



\# 2. Edit file kamu



\# 3. Check status

git status



\# 4. Add file

git add lib/hidayat\_auth.dart



\# 5. Commit dengan message jelas

git commit -m "feat(auth): implement login screen - Hidayat"



\# 6. Push

git push origin main

```



---



\## FORMAT COMMIT MESSAGE

```

<type>(<scope>): <description> - <nama>



type: feat, fix, docs, chore

scope: auth, home, profile

description: apa yang dikerjakan

nama: Hidayat, Arsyad, Dzikra

```



\*\*Contoh:\*\*

```bash

git commit -m "feat(auth): add splash screen - Hidayat"

git commit -m "fix(home): repair navigation - Arsyad"

git commit -m "docs: update README - Team"

```



---



\## BEST PRACTICES



\### DO's:

\- Commit sering (frequent commits)

\- Pull sebelum push

\- Message yang jelas

\- Test sebelum commit



\### DON'Ts:

\- Jangan commit file yang tidak perlu

\- Jangan push tanpa test

\- Jangan commit dengan message "wip", "test"

\- Jangan overwrite pekerjaan teman



---



\## TROUBLESHOOTING



\### Error: "rejected - non-fast-forward"

```bash

git pull origin main

git push origin main

```



\### Error: Conflict saat Pull

1\. Pull dan lihat conflict

2\. Buka file yang conflict

3\. Edit manual, hapus marker <<<< ==== >>>>

4\. Save file

5\. `git add .`

6\. `git commit -m "fix: resolve conflict"`

7\. `git push origin main`



---



\## SHARE KE DOSEN



\*\*Template Email:\*\*

```

Subject: Repository GitHub - Tugas Besar DPPB - Kelompok 1



Yth. Bapak/Ibu \[Lukmanul Hakim Firdaus],



Berikut link repository GitHub:

https://github.com/kanelaura/kelompok1-internship-finder



Anggota:

1\. Hidayat Nurwahid - Authentication

2\. Arsyad Defira Maulana - Home \& Internship

3\. M Dzikra Hafidz Fauzan - Profile \& Application



Terima kasih.

Kelompok 1

```



---



\*\*Good luck! 🚀\*\*


# aplikasi_guru

Aplikasi Mobile Untuk Guru

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Aplikasi Pengelolaan Data Siswa

## Tentang Aplikasi

Aplikasi Pengelolaan Data Siswa adalah aplikasi mobile yang dibuat untuk membantu pengguna dalam mengelola data siswa dengan lebih mudah dan teratur. Aplikasi ini menyediakan beberapa menu yang dapat digunakan untuk melihat, menambahkan, mengubah, dan menghapus data siswa.

Pembuatan aplikasi ini bertujuan untuk menerapkan materi pemrograman mobile yang telah dipelajari, mulai dari pembuatan tampilan (UI), penggunaan komponen, pengaturan navigasi antarhalaman, hingga penerapan fitur pengelolaan data atau CRUD (*Create, Read, Update, Delete*).

Aplikasi memiliki tampilan sederhana dengan perpaduan warna biru dan putih. Setiap menu dilengkapi ikon yang sesuai dengan fungsinya sehingga pengguna tidak kesulitan ketika ingin menggunakan fitur yang tersedia.

##  Fitur yang Tersedia

Berikut beberapa fitur yang terdapat di dalam aplikasi:

1. **Login** – Digunakan untuk masuk ke aplikasi menggunakan email dan password.
2. **Profil Pengguna** – Menampilkan informasi akun pengguna yang sedang masuk.
3. **Dashboard** – Menjadi halaman utama untuk mengakses seluruh menu aplikasi.
4. **Lihat Data Siswa** – Menampilkan daftar siswa yang sudah tersimpan.
5. **Input Data Siswa** – Digunakan untuk menambahkan data siswa baru.
6. **Edit Data Siswa** – Digunakan untuk mengubah informasi siswa.
7. **Hapus Data Siswa** – Digunakan untuk menghapus data siswa yang dipilih.
8. **Logout** – Digunakan untuk keluar dari akun dan kembali ke halaman login.

---

##  Tampilan Aplikasi

### 1. Halaman Login

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/74166fa0-eadb-46b9-8f23-3c400964362d" />


Halaman login merupakan halaman pertama yang muncul ketika aplikasi dibuka. Pada halaman ini, pengguna harus memasukkan email dan password untuk masuk ke dalam aplikasi.

Tampilan login dibuat sederhana dengan sebuah ikon di bagian atas, judul Login, serta dua kolom untuk memasukkan informasi akun. Kolom email digunakan untuk mengisi alamat email, sedangkan kolom password digunakan untuk memasukkan kata sandi.

Pada bagian password juga tersedia ikon mata yang berfungsi untuk menampilkan atau menyembunyikan kata sandi. Setelah mengisi kedua kolom tersebut, pengguna dapat menekan tombol Login untuk melanjutkan ke halaman utama aplikasi.

**Komponen yang terdapat pada halaman login:**
- Ikon atau logo aplikasi.
- Kolom input email.
- Kolom input password.
- Tombol tampilkan dan sembunyikan password.
- Tombol Login.

### 2. Halaman Profil Pengguna

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/c7ec964c-5972-4406-a739-823d3cbe6d68" />


Halaman profil pengguna digunakan untuk melihat informasi akun yang sedang digunakan untuk mengakses aplikasi.

Pada bagian atas terdapat judul Profil Pengguna dan tombol kembali untuk menuju halaman sebelumnya. Di bagian tengah terdapat ikon profil, nama pengguna, serta keterangan jenis akun. Selanjutnya, terdapat bagian Informasi Pengguna yang menampilkan nama lengkap dan alamat email.

Tampilan dibuat dalam bentuk kartu berwarna putih dengan sudut melengkung agar informasi terlihat lebih rapi dan mudah dibaca.

**Informasi dan komponen yang ditampilkan:**
- Foto atau ikon profil pengguna.
- Nama pengguna, yaitu Umar.
- Keterangan jenis akun, yaitu Profil Guru.
- Nama lengkap pengguna.
- Alamat email pengguna.
- Tombol Kembali ke Dashboard.

### 3. Halaman Dashboard

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/5b4daf39-cfe8-4eb9-b367-cc93424a62ed" />


Dashboard merupakan halaman utama yang digunakan untuk mengakses berbagai fitur pengelolaan data siswa.

Pada bagian atas terdapat judul Dashboard dengan keterangan Menu utama aplikasi. Di sebelah kanan terdapat tombol profil untuk melihat informasi akun dan tombol logout untuk keluar dari aplikasi.

Di bawah bagian judul terdapat tampilan sambutan Selamat Datang yang berisi informasi singkat mengenai aplikasi. Bagian ini juga dilengkapi keterangan bahwa aplikasi siap digunakan.

Selanjutnya, terdapat bagian Menu Pengelolaan yang berisi empat menu utama. Setiap menu memiliki ikon dan keterangan singkat sesuai dengan kegunaannya.

**Menu yang tersedia pada dashboard:**

- **Lihat Data:** Digunakan untuk membuka halaman yang menampilkan seluruh data siswa yang telah tersimpan.
- **Input Data:** Digunakan untuk membuka formulir penambahan data siswa baru.
- **Edit Data:** Digunakan untuk memilih dan mengubah informasi siswa yang sudah ada.
- **Hapus Data:** Digunakan untuk memilih dan menghapus data siswa yang tidak diperlukan.

Dashboard dibuat menggunakan tampilan kartu agar setiap menu memiliki bagian tersendiri dan lebih mudah dikenali oleh pengguna.

### 4. Halaman Lihat Data Siswa

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/5d75c222-bced-44bf-acf0-17815e743a9a" />


Halaman Data Siswa digunakan untuk melihat daftar siswa yang sudah dimasukkan ke dalam aplikasi. Data ditampilkan dalam bentuk kartu sehingga informasi setiap siswa dapat dibedakan dengan jelas.

Pada bagian atas halaman terdapat judul Data Siswa, tombol kembali, dan ikon refresh yang dapat digunakan untuk memuat ulang tampilan data.

Di bawah bagian tersebut terdapat kotak informasi Total Data Siswa yang menunjukkan jumlah siswa yang tersimpan. Setelah itu, daftar siswa ditampilkan secara berurutan berdasarkan nomor masing-masing.

Setiap kartu siswa menampilkan beberapa informasi, yaitu:

- Nomor urut siswa.
- Nama lengkap siswa.
- NIPD (Nomor Induk Peserta Didik).
- Kelas.
- Jurusan.

Pada tampilan yang digunakan, terdapat dua data siswa, yaitu Umar dan Mochammad Irfan Ardiansyah. Keduanya berasal dari kelas XII dengan jurusan RPL.

Dengan adanya halaman ini, pengguna dapat melihat informasi siswa tanpa harus membuka data satu per satu melalui formulir.

### 5. Halaman Input Data Siswa

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/3ff4ecd2-c2d3-4305-9f0c-b7dd57841d17" />


Halaman Input Data Siswa digunakan untuk memasukkan informasi siswa baru ke dalam aplikasi. Pada halaman ini tersedia beberapa kolom yang harus diisi sesuai dengan data siswa.

Setiap kolom dilengkapi ikon untuk membantu pengguna mengenali informasi yang perlu dimasukkan. Susunan formulir dibuat secara berurutan agar proses pengisian data lebih mudah dilakukan.

**Kolom yang tersedia pada formulir input:**

1. **NIPD:** Untuk memasukkan nomor induk peserta didik.
2. **Nama Lengkap:** Untuk memasukkan nama lengkap siswa.
3. **Jenis Kelamin:** Untuk memilih jenis kelamin siswa melalui pilihan yang tersedia.
4. **Alamat:** Untuk memasukkan alamat tempat tinggal siswa.
5. **Kelas:** Untuk menentukan kelas siswa.
6. **Jurusan:** Untuk menentukan jurusan atau program keahlian siswa.

Setelah semua informasi diisi, pengguna dapat menekan tombol Simpan Data untuk menyimpan data yang telah dimasukkan.

Selain itu, tersedia tombol Kembali untuk kembali ke halaman sebelumnya tanpa melanjutkan ke proses penyimpanan.

### 6. Halaman Hapus Data Siswa

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/c7aac8f8-583a-426e-8b74-a673edec11a7" />

Halaman Hapus Data Siswa digunakan untuk menampilkan daftar siswa yang datanya dapat dihapus dari aplikasi.

Setiap siswa ditampilkan dalam bentuk kartu berwarna putih. Di dalam kartu terdapat ikon pengguna, nama lengkap, NIPD, serta informasi kelas dan jurusan.

Pada bagian kanan setiap kartu terdapat ikon tempat sampah berwarna merah yang digunakan sebagai tombol untuk menghapus data siswa yang dipilih.

**Komponen yang terdapat pada halaman ini:**
- Daftar nama siswa.
- Informasi NIPD setiap siswa.
- Informasi kelas dan jurusan.
- Ikon hapus untuk setiap data siswa.
- Tombol kembali.
- Tombol refresh untuk memuat ulang data.

Dengan adanya fitur ini, pengguna dapat mengelola data yang sudah tidak diperlukan. Tombol hapus juga ditempatkan pada masing-masing kartu agar pengguna dapat memilih data siswa yang ingin dihapus.

### 7. Halaman Edit Data Siswa

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/d668ee95-0178-4f2f-a7f4-be399eca1c47" />

Halaman Edit Data Siswa memiliki tampilan yang hampir sama dengan halaman Hapus Data Siswa. Perbedaannya terletak pada fungsi tombol yang tersedia di setiap kartu.

Halaman ini digunakan untuk memilih data siswa yang ingin diperbarui. Informasi siswa ditampilkan dalam bentuk kartu yang berisi ikon pengguna, nama lengkap, NIPD, kelas, dan jurusan.

Pada bagian kanan kartu terdapat ikon pensil berwarna oranye. Ikon tersebut digunakan sebagai tombol untuk memilih data siswa yang akan diedit.

Setelah pengguna memilih salah satu siswa, aplikasi akan menampilkan formulir pengeditan agar informasi yang sebelumnya tersimpan dapat diperbarui sesuai kebutuhan.

**Komponen yang terdapat pada halaman ini:**
- Daftar siswa yang sudah tersimpan.
- Nama lengkap siswa.
- NIPD.
- Informasi kelas dan jurusan.
- Ikon pensil untuk mengedit data.
- Tombol kembali.
- Tombol refresh.

Fitur edit ini dibuat agar pengguna tidak perlu menghapus dan memasukkan ulang seluruh informasi ketika terdapat kesalahan atau perubahan data siswa.

---

##  Alur Penggunaan Aplikasi

Secara umum, aplikasi digunakan melalui beberapa tahapan berikut:

1. Pengguna membuka aplikasi dan masuk melalui halaman Login.
2. Setelah berhasil masuk, pengguna diarahkan ke halaman Dashboard.
3. Pengguna dapat membuka halaman Profil untuk melihat informasi akun.
4. Untuk melihat data siswa, pengguna memilih menu Lihat Data.
5. Untuk menambahkan siswa baru, pengguna memilih menu Input Data dan mengisi formulir yang tersedia.
6. Untuk memperbarui informasi siswa, pengguna memilih menu Edit Data dan menentukan siswa yang ingin diubah.
7. Untuk menghapus informasi siswa, pengguna memilih menu Hapus Data dan menekan ikon hapus pada data yang dipilih.
8. Setelah selesai menggunakan aplikasi, pengguna dapat menekan tombol Logout untuk keluar dari akun.

##  Desain dan Tampilan

Dalam pembuatan aplikasi ini, saya menggunakan konsep desain yang sederhana agar setiap halaman mudah dipahami dan digunakan.

Beberapa bagian desain yang diterapkan antara lain:

- **Warna biru:** Digunakan sebagai warna utama pada header, tombol, ikon, dan beberapa bagian penting aplikasi.
- **Warna putih:** Digunakan sebagai warna kartu dan latar beberapa komponen untuk memberikan tampilan yang bersih.
- **Ikon:** Digunakan untuk menggambarkan fungsi setiap menu, seperti ikon folder, tambah, edit, hapus, profil, dan lainnya.
- **Rounded Corner:** Digunakan pada kartu, tombol, dan kolom input agar tampilan terlihat lebih modern.
- **Card Layout:** Digunakan untuk menampilkan menu dashboard dan daftar siswa agar informasi lebih terorganisir.
- **Navigasi:** Setiap halaman dilengkapi tombol kembali atau navigasi sesuai dengan kebutuhan.

## Teknologi dan Tools

Teknologi dan perangkat yang digunakan dalam pengembangan aplikasi:

- **Android Studio:** Digunakan sebagai IDE untuk membuat dan mengembangkan aplikasi Android.
- **Flutter:** Digunakan untuk membangun tampilan dan fitur aplikasi berbasis mobile.
- **Dart:** Digunakan sebagai bahasa pemrograman dalam pengembangan aplikasi Flutter.

##  Tujuan Pembuatan

Aplikasi ini dibuat sebagai salah satu bentuk penerapan pembelajaran pemrograman aplikasi mobile. Melalui proyek ini, saya mempelajari cara membuat tampilan aplikasi, mengatur perpindahan antarhalaman, menggunakan berbagai komponen Flutter, serta membuat fitur untuk mengelola data siswa.

Selain itu, proyek ini juga menjadi latihan untuk memahami bagaimana sebuah aplikasi dirancang agar memiliki tampilan yang menarik sekaligus fungsi yang dapat digunakan sesuai kebutuhan.

##  Penutup

Dengan dibuatnya Aplikasi Pengelolaan Data Siswa ini, diharapkan proses pengelolaan informasi siswa dapat dilakukan dengan lebih mudah dan teratur.

Melalui pengerjaan proyek ini, saya mendapatkan pengalaman dalam mengembangkan aplikasi mobile, mulai dari merancang tampilan hingga membuat berbagai menu yang memiliki fungsi berbeda. Tentunya, aplikasi ini masih dapat dikembangkan lebih lanjut dengan menambahkan fitur lain agar penggunaannya menjadi lebih lengkap.

---

**Dibuat oleh:** Mochammad Irfan Ardiansyah
                 Umar Hafidz Muhyidin

**Program Keahlian:** Rekayasa Perangkat Lunak (RPL)






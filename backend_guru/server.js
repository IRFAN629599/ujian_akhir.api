
require('dotenv').config();

const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
const jwt = require('jsonwebtoken');

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Validasi konfigurasi JWT
if (!process.env.JWT_SECRET) {
  console.error('JWT_SECRET belum diatur di file .env');
  process.exit(1);
}

// Koneksi database
const db = mysql.createPool({
  host: process.env.DB_HOST || '127.0.0.1',
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'login_db',
  waitForConnections: true,
  connectionLimit: 10,
});

// Tes API dan database
app.get('/', async (req, res) => {
  try {
    await db.query('SELECT 1');

    res.json({
      success: true,
      message: 'API Aplikasi Guru berhasil berjalan!',
      database: 'Terhubung ke login_db',
    });
  } catch (error) {
    console.error('Database error:', error.message);

    res.status(500).json({
      success: false,
      message: 'Database gagal terhubung.',
    });
  }
});

// API LOGIN
app.post('/api/login', async (req, res) => {
  const { email, password } = req.body || {};

  if (
    typeof email !== 'string' ||
    typeof password !== 'string' ||
    !email.trim() ||
    !password
  ) {
    return res.status(400).json({
      success: false,
      message: 'Email dan password wajib diisi.',
    });
  }

  try {
    // Cari pengguna berdasarkan email
    const [rows] = await db.execute(
      `SELECT id, nama, email, password
       FROM \`user\`
       WHERE email = ?
       LIMIT 1`,
      [email.trim()]
    );

    // Periksa akun
    if (rows.length === 0) {
      return res.status(401).json({
        success: false,
        message: 'Email atau password salah.',
      });
    }

    const user = rows[0];

    // Periksa password
    // Ini mengikuti format password teks biasa pada backend lama.
    if (user.password !== password) {
      return res.status(401).json({
        success: false,
        message: 'Email atau password salah.',
      });
    }

    // Buat JWT
    const token = jwt.sign(
      {
        id: user.id,
        email: user.email,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: '1d',
      }
    );

    // Kirim respons ke Flutter
    return res.status(200).json({
      success: true,
      message: 'Login berhasil!',
      token: token,
      name: user.nama,
    });

  } catch (error) {
    console.error('LOGIN ERROR DETAIL:', error.code);
    console.error('LOGIN ERROR MESSAGE:', error.message);

    return res.status(500).json({
      success: false,
      message: 'Terjadi kesalahan pada server.',
    });
  }
});


/* =====================================
   API CRUD DATA SISWA
===================================== */

// GET: Menampilkan semua siswa
app.get('/api/siswa', async (req, res) => {
  try {
    const [rows] = await db.execute(
      'SELECT * FROM siswa ORDER BY id DESC'
    );

    res.json({
      success: true,
      data: rows,
    });
  } catch (error) {
    console.error('GET SISWA:', error.message);

    res.status(500).json({
      success: false,
      message: 'Gagal mengambil data siswa.',
    });
  }
});

// GET: Menampilkan detail siswa berdasarkan ID
app.get('/api/siswa/:id', async (req, res) => {
  try {
    const id = Number(req.params.id);

    if (!Number.isInteger(id) || id <= 0) {
      return res.status(400).json({
        success: false,
        message: 'ID siswa tidak valid.',
      });
    }

    const [rows] = await db.execute(
      'SELECT * FROM siswa WHERE id = ?',
      [id]
    );

    if (rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Data siswa tidak ditemukan.',
      });
    }

    res.json({
      success: true,
      data: rows[0],
    });
  } catch (error) {
    console.error('DETAIL SISWA:', error.message);

    res.status(500).json({
      success: false,
      message: 'Gagal mengambil detail siswa.',
    });
  }
});

// POST: Menambahkan siswa
app.post('/api/siswa', async (req, res) => {
  const {
    nipd,
    nama_lengkap,
    jenis_kelamin,
    alamat,
    kelas,
    jurusan,
  } = req.body || {};

  if (
    !nipd?.trim() ||
    !nama_lengkap?.trim() ||
    !jenis_kelamin?.trim() ||
    !alamat?.trim() ||
    !kelas?.trim() ||
    !jurusan?.trim()
  ) {
    return res.status(400).json({
      success: false,
      message: 'Semua kolom wajib diisi.',
    });
  }

  try {
    const [result] = await db.execute(
      `INSERT INTO siswa
       (nipd, nama_lengkap, jenis_kelamin, alamat, kelas, jurusan)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [
        nipd.trim(),
        nama_lengkap.trim(),
        jenis_kelamin.trim(),
        alamat.trim(),
        kelas.trim(),
        jurusan.trim(),
      ]
    );

    res.status(201).json({
      success: true,
      message: 'Data siswa berhasil ditambahkan.',
      id: result.insertId,
    });
  } catch (error) {
    console.error('TAMBAH SISWA:', error.message);

    res.status(500).json({
      success: false,
      message: 'Gagal menambahkan data siswa.',
    });
  }
});

// PUT: Mengedit siswa
app.put('/api/siswa/:id', async (req, res) => {
  const id = Number(req.params.id);

  const {
    nipd,
    nama_lengkap,
    jenis_kelamin,
    alamat,
    kelas,
    jurusan,
  } = req.body || {};

  if (!Number.isInteger(id) || id <= 0) {
    return res.status(400).json({
      success: false,
      message: 'ID siswa tidak valid.',
    });
  }

  if (
    !nipd?.trim() ||
    !nama_lengkap?.trim() ||
    !jenis_kelamin?.trim() ||
    !alamat?.trim() ||
    !kelas?.trim() ||
    !jurusan?.trim()
  ) {
    return res.status(400).json({
      success: false,
      message: 'Semua kolom wajib diisi.',
    });
  }

  try {
    const [result] = await db.execute(
      `UPDATE siswa SET
       nipd = ?,
       nama_lengkap = ?,
       jenis_kelamin = ?,
       alamat = ?,
       kelas = ?,
       jurusan = ?
       WHERE id = ?`,
      [
        nipd.trim(),
        nama_lengkap.trim(),
        jenis_kelamin.trim(),
        alamat.trim(),
        kelas.trim(),
        jurusan.trim(),
        id,
      ]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        success: false,
        message: 'Data siswa tidak ditemukan.',
      });
    }

    res.json({
      success: true,
      message: 'Data siswa berhasil diperbarui.',
    });
  } catch (error) {
    console.error('EDIT SISWA:', error.message);

    res.status(500).json({
      success: false,
      message: 'Gagal memperbarui data siswa.',
    });
  }
});

// DELETE: Menghapus siswa
app.delete('/api/siswa/:id', async (req, res) => {
  const id = Number(req.params.id);

  if (!Number.isInteger(id) || id <= 0) {
    return res.status(400).json({
      success: false,
      message: 'ID siswa tidak valid.',
    });
  }

  try {
    const [result] = await db.execute(
      'DELETE FROM siswa WHERE id = ?',
      [id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({
        success: false,
        message: 'Data siswa tidak ditemukan.',
      });
    }

    res.json({
      success: true,
      message: 'Data siswa berhasil dihapus.',
    });
  } catch (error) {
    console.error('HAPUS SISWA:', error.message);

    res.status(500).json({
      success: false,
      message: 'Gagal menghapus data siswa.',
    });
  }
});


// Jalankan server
async function startServer() {
  try {
    await db.query('SELECT 1');

    app.listen(PORT, '0.0.0.0', () => {
      console.log('================================');
      console.log(`Server berjalan di port ${PORT}`);
      console.log('Database login_db berhasil terhubung.');
      console.log('API LOGIN: POST /api/login');
      console.log('================================');
    });

  } catch (error) {
    console.error('Gagal menghubungkan database:', error.message);
    process.exit(1);
  }
}

startServer();


import 'package:flutter/material.dart';
import '../model/Siswa.dart';
import '../services/ApiService.dart';

class PageInput extends StatefulWidget {
  const PageInput({super.key});

  @override
  State<PageInput> createState() => _PageInputState();
}

class _PageInputState extends State<PageInput> {
  final nipdController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final kelasController = TextEditingController();
  final jurusanController = TextEditingController();

  String? jenisKelamin;
  bool sedangMenyimpan = false;

  @override
  void dispose() {
    nipdController.dispose();
    namaController.dispose();
    alamatController.dispose();
    kelasController.dispose();
    jurusanController.dispose();
    super.dispose();
  }

  Future<void> simpanData() async {
    if (nipdController.text.trim().isEmpty ||
        namaController.text.trim().isEmpty ||
        jenisKelamin == null ||
        alamatController.text.trim().isEmpty ||
        kelasController.text.trim().isEmpty ||
        jurusanController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua kolom wajib diisi!'),
        ),
      );
      return;
    }

    setState(() => sedangMenyimpan = true);

    try {
      final siswa = Siswa(
        nipd: nipdController.text.trim(),
        namaLengkap: namaController.text.trim(),
        jenisKelamin: jenisKelamin!,
        alamat: alamatController.text.trim(),
        kelas: kelasController.text.trim(),
        jurusan: jurusanController.text.trim(),
      );

      final berhasil = await ApiService.tambahSiswa(siswa);

      if (!mounted) return;

      if (berhasil) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data siswa berhasil disimpan!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context, true);
      } else {
        throw Exception('Server gagal menyimpan data.');
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => sedangMenyimpan = false);
      }
    }
  }

  Widget inputField(
      String label,
      TextEditingController controller,
      IconData ikon, {
        int maxLines = 1,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(ikon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Siswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            inputField(
              'NIPD',
              nipdController,
              Icons.badge,
            ),
            inputField(
              'Nama Lengkap',
              namaController,
              Icons.person,
            ),

            DropdownButtonFormField<String>(
              value: jenisKelamin,
              decoration: const InputDecoration(
                labelText: 'Jenis Kelamin',
                prefixIcon: Icon(Icons.people),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Laki-laki',
                  child: Text('Laki-laki'),
                ),
                DropdownMenuItem(
                  value: 'Perempuan',
                  child: Text('Perempuan'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  jenisKelamin = value;
                });
              },
            ),

            const SizedBox(height: 16),

            inputField(
              'Alamat',
              alamatController,
              Icons.location_on,
              maxLines: 3,
            ),
            inputField(
              'Kelas',
              kelasController,
              Icons.class_,
            ),
            inputField(
              'Jurusan',
              jurusanController,
              Icons.school,
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: sedangMenyimpan ? null : simpanData,
              icon: sedangMenyimpan
                  ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
                  : const Icon(Icons.save),
              label: Text(
                sedangMenyimpan ? 'Menyimpan...' : 'Simpan Data',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

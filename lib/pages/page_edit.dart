
import 'package:flutter/material.dart';
import '../model/Siswa.dart';
import '../services/ApiService.dart';

class PageEdit extends StatefulWidget {
  const PageEdit({super.key});

  @override
  State<PageEdit> createState() => _PageEditState();
}

class _PageEditState extends State<PageEdit> {
  late Future<List<Siswa>> dataSiswa;

  bool sedangMenyimpan = false;

  @override
  void initState() {
    super.initState();
    muatData();
  }

  void muatData() {
    dataSiswa = ApiService.ambilSiswa();
  }

  void refreshData() {
    setState(() {
      muatData();
    });
  }

  Future<void> editData(Siswa siswa) async {
    final nipdController =
    TextEditingController(text: siswa.nipd);
    final namaController =
    TextEditingController(text: siswa.namaLengkap);
    final alamatController =
    TextEditingController(text: siswa.alamat);
    final kelasController =
    TextEditingController(text: siswa.kelas);
    final jurusanController =
    TextEditingController(text: siswa.jurusan);

    String jenisKelamin = siswa.jenisKelamin;

    await showDialog(
      context: context,
      builder: (dialogContext) {
        bool loading = false;

        return StatefulBuilder(
          builder: (contextDialog, setDialogState) {
            return AlertDialog(
              title: const Text('Edit Data Siswa'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nipdController,
                      decoration: const InputDecoration(
                        labelText: 'NIPD',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      controller: namaController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),

                    DropdownButtonFormField<String>(
                      value: jenisKelamin,
                      decoration: const InputDecoration(
                        labelText: 'Jenis Kelamin',
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
                        if (value != null) {
                          setDialogState(() {
                            jenisKelamin = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      controller: alamatController,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      controller: kelasController,
                      decoration: const InputDecoration(
                        labelText: 'Kelas',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(
                      controller: jurusanController,
                      decoration: const InputDecoration(
                        labelText: 'Jurusan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: loading
                      ? null
                      : () => Navigator.pop(dialogContext),
                  child: const Text('Batal'),
                ),

                ElevatedButton(
                  onPressed: loading
                      ? null
                      : () async {
                    if (nipdController.text.trim().isEmpty ||
                        namaController.text.trim().isEmpty ||
                        alamatController.text.trim().isEmpty ||
                        kelasController.text.trim().isEmpty ||
                        jurusanController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Semua kolom wajib diisi'),
                        ),
                      );
                      return;
                    }

                    setDialogState(() {
                      loading = true;
                    });

                    try {
                      final siswaBaru = Siswa(
                        id: siswa.id,
                        nipd: nipdController.text.trim(),
                        namaLengkap: namaController.text.trim(),
                        jenisKelamin: jenisKelamin,
                        alamat: alamatController.text.trim(),
                        kelas: kelasController.text.trim(),
                        jurusan: jurusanController.text.trim(),
                      );

                      final berhasil =
                      await ApiService.editSiswa(siswaBaru);

                      if (!mounted) return;

                      if (berhasil) {
                        Navigator.pop(dialogContext);

                        refreshData();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Data siswa berhasil diperbarui!',
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        throw Exception('Gagal memperbarui data');
                      }
                    } catch (e) {
                      setDialogState(() {
                        loading = false;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Gagal edit: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: loading
                      ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                      : const Text('Simpan'),
                ),
              ],
            );
          },
        );
      },
    );

    nipdController.dispose();
    namaController.dispose();
    alamatController.dispose();
    kelasController.dispose();
    jurusanController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        title: const Text('Edit Data Siswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: refreshData,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Siswa>>(
        future: dataSiswa,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Gagal mengambil data: ${snapshot.error}'),
            );
          }

          final siswa = snapshot.data ?? [];

          if (siswa.isEmpty) {
            return const Center(
              child: Text('Belum ada data siswa untuk diedit'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: siswa.length,
            itemBuilder: (context, index) {
              final item = siswa[index];

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE3EDFF),
                    child: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                  ),
                  title: Text(
                    item.namaLengkap,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'NIPD: ${item.nipd}\n'
                        'Kelas: ${item.kelas} | ${item.jurusan}',
                  ),
                  isThreeLine: true,
                  trailing: const Icon(
                    Icons.edit,
                    color: Colors.orange,
                  ),
                  onTap: () => editData(item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

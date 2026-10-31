
import 'package:flutter/material.dart';
import '../model/Siswa.dart';
import '../services/ApiService.dart';

class PageHapus extends StatefulWidget {
  const PageHapus({super.key});

  @override
  State<PageHapus> createState() => _PageHapusState();
}

class _PageHapusState extends State<PageHapus> {
  late Future<List<Siswa>> dataSiswa;

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

  Future<void> konfirmasiHapus(Siswa siswa) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Data Siswa'),
          content: Text(
            'Apakah kamu yakin ingin menghapus '
                'data ${siswa.namaLengkap}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (yakin != true) return;

    try {
      final berhasil = await ApiService.hapusSiswa(siswa.id!);

      if (!mounted) return;

      if (berhasil) {
        refreshData();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data siswa berhasil dihapus!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        throw Exception('Data gagal dihapus');
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menghapus: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        title: const Text('Hapus Data Siswa'),
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
              child: Text('Belum ada data siswa untuk dihapus'),
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
                    backgroundColor: Color(0xFFFFE8E8),
                    child: Icon(
                      Icons.person,
                      color: Colors.red,
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
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => konfirmasiHapus(item),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

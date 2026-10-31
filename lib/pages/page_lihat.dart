
import 'package:flutter/material.dart';
import '../model/Siswa.dart';
import '../services/ApiService.dart';

class PageLihat extends StatefulWidget {
  const PageLihat({super.key});

  @override
  State<PageLihat> createState() => _PageLihatState();
}

class _PageLihatState extends State<PageLihat> {
  late Future<List<Siswa>> dataSiswa;

  @override
  void initState() {
    super.initState();
    dataSiswa = ApiService.ambilSiswa();
  }

  void muatUlang() {
    setState(() {
      dataSiswa = ApiService.ambilSiswa();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        title: const Text('Data Siswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: muatUlang,
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
              child: Text('Belum ada data siswa'),
            );
          }

          return Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Data Siswa',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '${siswa.length} Siswa',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: siswa.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final item = siswa[index];

                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(item.namaLengkap),
                        subtitle: Text(
                          'NIPD: ${item.nipd}\n'
                              'Kelas: ${item.kelas}\n'
                              'Jurusan: ${item.jurusan}',
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

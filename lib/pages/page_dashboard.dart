import 'package:flutter/material.dart';
import 'page_input.dart';
import 'page_edit.dart';
import 'page_lihat.dart';
import 'page_hapus.dart';
import 'page_login.dart';
import 'page_view_user.dart';


class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});

  static const Color warnaLatar = Color(0xFFF5F7FC);
  static const Color warnaUtama = Color(0xFF3569D4);
  static const Color warnaTeks = Color(0xFF202B46);

  void bukaHalaman(BuildContext context, Widget halaman) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => halaman),
    );
  }

  Widget kartuMenu({
    required BuildContext context,
    required String judul,
    required String deskripsi,
    required IconData ikon,
    required Color warna,
    required VoidCallback aksi,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: aksi,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE8ECF4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.025),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: warna.withValues(alpha: 0.11),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  ikon,
                  color: warna,
                  size: 25,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                judul,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: warnaTeks,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                deskripsi,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7B8499),
                  height: 1.4,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 19,
                    color: warna,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> konfirmasiKeluar(BuildContext context) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        icon: const Icon(
          Icons.logout_rounded,
          color: Colors.redAccent,
          size: 36,
        ),
        title: const Text('Keluar Aplikasi?'),
        content: const Text(
          'Apakah kamu yakin ingin keluar dan kembali '
              'ke halaman login?',
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );

    if (yakin == true && context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const PageLogin(),
        ),
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final lebar = constraints.maxWidth;
            final jumlahKolom = lebar >= 800
                ? 4
                : lebar >= 520
                ? 3
                : 2;

            final lebarKartu =
                (lebar - 40 - (jumlahKolom - 1) * 14) /
                    jumlahKolom;

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.dashboard_rounded,
                          color: Colors.blue,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Menu utama aplikasi',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        children: [
                        
                          IconButton(
                            tooltip: 'Profil Pengguna',
                            onPressed: () {
                              bukaHalaman(
                                context,
                                const PageViewUser(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                            ),
                            icon: const Icon(Icons.account_circle_rounded),
                          ),

                          const SizedBox(width: 5),

                          // Tombol Keluar
                          IconButton(
                            tooltip: 'Keluar',
                            onPressed: () => konfirmasiKeluar(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.redAccent,
                            ),
                            icon: const Icon(Icons.logout_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF4779E6),
                          Color(0xFF2854B8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -8,
                          top: -12,
                          child: Icon(
                            Icons.auto_awesome_rounded,
                            size: 90,
                            color: Colors.white.withValues(alpha: 0.12),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selamat Datang ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 9),
                            Text(
                              'Kelola data dengan mudah melalui '
                                  'menu yang tersedia.',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.88),
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.16),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    'Siap digunakan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Menu Pengelolaan',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Pilih menu untuk melanjutkan.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 18),


                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    children: [
                      SizedBox(
                        width: lebarKartu,
                        height: 170,
                        child: kartuMenu(
                          context: context,
                          judul: 'Lihat Data',
                          deskripsi: 'Lihat seluruh data yang tersedia.',
                          ikon: Icons.folder_open_rounded,
                          warna: Colors.blue,
                          aksi: () => bukaHalaman(
                            context,
                            const PageLihat(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: lebarKartu,
                        height: 170,
                        child: kartuMenu(
                          context: context,
                          judul: 'Input Data',
                          deskripsi: 'Tambahkan data baru dengan mudah.',
                          ikon: Icons.add,
                          warna: Colors.green,
                          aksi: () => bukaHalaman(
                            context,
                            const PageInput(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: lebarKartu,
                        height: 170,
                        child: kartuMenu(
                          context: context,
                          judul: 'Edit Data',
                          deskripsi: 'Perbarui informasi data.',
                          ikon: Icons.edit_note_rounded,
                          warna: const Color(0xFFE39A27),
                          aksi: () => bukaHalaman(
                            context,
                            const PageEdit(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: lebarKartu,
                        height: 170,
                        child: kartuMenu(
                          context: context,
                          judul: 'Hapus Data',
                          deskripsi: 'Hapus data yang tidak diperlukan.',
                          ikon: Icons.delete_outline_rounded,
                          warna: Colors.red,
                          aksi: () => bukaHalaman(
                            context,
                            const PageHapus(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () => konfirmasiKeluar(context),
                      icon: const Icon(Icons.logout_rounded),
                      label: const Text('Keluar dari Aplikasi'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Center(
                    child: Text(
                      'Aplikasi Pengelolaan Data',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

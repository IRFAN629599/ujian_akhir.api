
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Siswa.dart';

class ApiService {
  // IP laptop dan port Express.js
  static const String baseUrl = 'http://192.168.1.108:3000';

  // GET semua data siswa
  static Future<List<Siswa>> ambilSiswa() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/siswa'),
    ).timeout(const Duration(seconds: 15));

    final hasil = jsonDecode(response.body);

    if (response.statusCode == 200 &&
        hasil['success'] == true) {
      return (hasil['data'] as List)
          .map((item) => Siswa.fromJson(item))
          .toList();
    }

    throw Exception(
      hasil['message'] ?? 'Gagal mengambil data siswa',
    );
  }

  // POST tambah siswa
  static Future<bool> tambahSiswa(Siswa siswa) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/siswa'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(siswa.toJson()),
    ).timeout(const Duration(seconds: 15));

    final hasil = jsonDecode(response.body);

    if (response.statusCode != 201) {
      throw Exception(
        hasil['message'] ?? 'Gagal menyimpan siswa',
      );
    }

    return hasil['success'] == true;
  }

  // PUT edit siswa
  static Future<bool> editSiswa(Siswa siswa) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/siswa/${siswa.id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(siswa.toJson()),
    ).timeout(const Duration(seconds: 15));

    final hasil = jsonDecode(response.body);

    return response.statusCode == 200 &&
        hasil['success'] == true;
  }

  // DELETE hapus siswa
  static Future<bool> hapusSiswa(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/siswa/$id'),
    ).timeout(const Duration(seconds: 15));

    final hasil = jsonDecode(response.body);

    return response.statusCode == 200 &&
        hasil['success'] == true;
  }
}

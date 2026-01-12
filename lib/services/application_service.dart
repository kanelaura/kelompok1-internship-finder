import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/application.dart';
import '../models/internship.dart';

class ApplicationService {
  static const String _applicationsKey = 'applications';

  // Simpan lamaran baru
  Future<bool> applyInternship({
    required String internshipId,
    required String coverLetter,
    required Internship internship,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final applications = await getApplications();

      // Cek apakah sudah pernah apply
      final exists = applications
          .any((app) => app.internshipId.toString() == internshipId);

      if (exists) {
        return false; // Sudah pernah apply
      }

      // Buat aplikasi baru
      final newApplication = InternshipApplication(
        id: DateTime.now().millisecondsSinceEpoch, // ID unik dari timestamp
        userId: 1, // Dummy user ID
        internshipId: int.parse(internshipId),
        coverLetter: coverLetter,
        status: 'pending',
        internship: internship,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      applications.insert(0, newApplication); // Tambah di awal list

      // Simpan ke SharedPreferences
      final jsonList = applications.map((app) => app.toJson()).toList();
      await prefs.setString(_applicationsKey, json.encode(jsonList));

      return true;
    } catch (e) {
      print('Error saving application: $e');
      return false;
    }
  }

  // Ambil semua lamaran
  Future<List<InternshipApplication>> getApplications() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_applicationsKey);

      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }

      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => InternshipApplication.fromJson(json))
          .toList();
    } catch (e) {
      print('Error loading applications: $e');
      return [];
    }
  }

  // Hapus lamaran
  Future<bool> deleteApplication(int applicationId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final applications = await getApplications();

      applications.removeWhere((app) => app.id == applicationId);

      final jsonList = applications.map((app) => app.toJson()).toList();
      await prefs.setString(_applicationsKey, json.encode(jsonList));

      return true;
    } catch (e) {
      print('Error deleting application: $e');
      return false;
    }
  }

  // Clear semua lamaran (untuk testing)
  Future<void> clearAllApplications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_applicationsKey);
  }
}

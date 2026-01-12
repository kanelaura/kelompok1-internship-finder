import 'internship.dart';

class InternshipApplication {
  final int id;
  final int userId;
  final int internshipId;
  final String coverLetter;
  final String? resume;
  final String status; // pending, accepted, rejected
  final Internship? internship;
  final DateTime createdAt;
  final DateTime updatedAt;

  InternshipApplication({
    required this.id,
    required this.userId,
    required this.internshipId,
    required this.coverLetter,
    this.resume,
    required this.status,
    this.internship,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InternshipApplication.fromJson(Map<String, dynamic> json) {
    return InternshipApplication(
      id: json['id'],
      userId: json['user_id'],
      internshipId: json['internship_id'],
      coverLetter: json['cover_letter'],
      resume: json['resume'],
      status: json['status'],
      internship: json['internship'] != null
          ? Internship.fromJson(json['internship'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'internship_id': internshipId,
      'cover_letter': coverLetter,
      'resume': resume,
      'status': status,
      'internship': internship?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  InternshipApplication copyWith({
    int? id,
    int? userId,
    int? internshipId,
    String? coverLetter,
    String? resume,
    String? status,
    Internship? internship,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return InternshipApplication(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      internshipId: internshipId ?? this.internshipId,
      coverLetter: coverLetter ?? this.coverLetter,
      resume: resume ?? this.resume,
      status: status ?? this.status,
      internship: internship ?? this.internship,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String get statusLabel {
    switch (status) {
      case 'pending':
        return 'Menunggu';
      case 'accepted':
        return 'Diterima';
      case 'rejected':
        return 'Ditolak';
      default:
        return status;
    }
  }
}

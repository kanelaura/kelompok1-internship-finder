class Internship {
  final String id;
  final String title;
  final String company;
  final String location;
  final String type;
  final String salary;
  final String? imageUrl;
  final String description;
  final List<String> requirements;
  final List<String> benefits;
  final bool isPromoted;

  bool isSaved; // ⬅️ TAMBAHKAN INI

  Internship({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.salary,
    this.imageUrl,
    required this.description,
    required this.requirements,
    required this.benefits,
    required this.isPromoted,
    this.isSaved = false, // ⬅️ DEFAULT
  });

  /// =========================
  /// FROM JSON (API)
  /// =========================
  factory Internship.fromJson(Map<String, dynamic> json) {
    List<String> parseList(dynamic value) {
      if (value == null) return [];
      if (value is List) return List<String>.from(value);
      if (value is String) return [value]; // 🔥 STRING JADI LIST
      return [];
    }

    return Internship(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      company: json['company'] is Map
          ? json['company']['name'] ?? ''
          : json['company']?.toString() ?? '',
      location: json['location'] is Map
          ? json['location']['name'] ?? ''
          : json['location']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      salary: json['salary']?.toString() ?? '',
      imageUrl: json['image_url'],
      description: json['description']?.toString() ?? '',
      requirements: parseList(json['requirements']),
      benefits: parseList(json['benefits']),
      isPromoted: json['is_promoted'] == true,
      isSaved: json['is_saved'] == true,
    );
  }

  /// =========================
  /// TO JSON (API)
  /// =========================
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'type': type,
      'salary': salary,
      'image_url': imageUrl,
      'description': description,
      'requirements': requirements,
      'benefits': benefits,
      'is_promoted': isPromoted,
      'is_saved': isSaved,
    };
  }
}

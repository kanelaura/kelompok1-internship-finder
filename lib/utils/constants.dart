class Constants {
  // API Base URL
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // Auth Endpoints
  static const String loginEndpoint = '/user/login';
  static const String registerEndpoint = '/user/register';
  static const String logoutEndpoint = '/user/logout';
  static const String profileEndpoint = '/user/profile';

  // Internship Endpoints
  static const String internshipsEndpoint = '/internships';
  static String internshipDetailEndpoint(String id) => '/internships/$id';

  // Application Endpoints
  static const String myApplicationsEndpoint = '/user/applications';
  static const String applyInternshipEndpoint = '/applications';

  // Bookmark Endpoints
  static const String bookmarksEndpoint = '/user/bookmarks';
  static String deleteBookmarkEndpoint(String id) => '/user/bookmarks/$id';

  // Colors
  static const int primaryColor1 = 0xFF1e3c72;
  static const int primaryColor2 = 0xFF2a5298;

  // App Config
  static const String appName = 'Internship Finder';
}

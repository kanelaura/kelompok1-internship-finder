import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/internship.dart';

class BookmarkService {
  static const String _bookmarksKey = 'bookmarks';

  // Toggle bookmark (add/remove)
  Future<bool> toggleBookmark(Internship internship) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final bookmarks = await getBookmarks();

      final exists = bookmarks.any((b) => b.id == internship.id);

      if (exists) {
        // Remove bookmark
        bookmarks.removeWhere((b) => b.id == internship.id);
      } else {
        // Add bookmark
        bookmarks.insert(0, internship);
      }

      // Save to SharedPreferences
      final jsonList = bookmarks.map((b) => b.toJson()).toList();
      await prefs.setString(_bookmarksKey, json.encode(jsonList));

      return !exists; // Return new state (true = bookmarked, false = unbookmarked)
    } catch (e) {
      print('Error toggling bookmark: $e');
      return false;
    }
  }

  // Check if internship is bookmarked
  Future<bool> isBookmarked(String internshipId) async {
    try {
      final bookmarks = await getBookmarks();
      return bookmarks.any((b) => b.id == internshipId);
    } catch (e) {
      print('Error checking bookmark: $e');
      return false;
    }
  }

  // Get all bookmarks
  Future<List<Internship>> getBookmarks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_bookmarksKey);

      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }

      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Internship.fromJson(json)).toList();
    } catch (e) {
      print('Error loading bookmarks: $e');
      return [];
    }
  }

  // Remove specific bookmark
  Future<bool> removeBookmark(String internshipId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final bookmarks = await getBookmarks();

      bookmarks.removeWhere((b) => b.id == internshipId);

      final jsonList = bookmarks.map((b) => b.toJson()).toList();
      await prefs.setString(_bookmarksKey, json.encode(jsonList));

      return true;
    } catch (e) {
      print('Error removing bookmark: $e');
      return false;
    }
  }

  // Clear all bookmarks
  Future<void> clearAllBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_bookmarksKey);
  }
}

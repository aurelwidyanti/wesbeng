import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wesbeng/models/education_content_model.dart';
import 'package:wesbeng/services/api_service.dart';

class EducationContentProvider extends ChangeNotifier {
  ApiService apiService = ApiService();

  List<EducationContent> _educationContent = [];

  List<EducationContent> _searchResult = [];

  List<EducationContent> get educationContent => _educationContent;

  List<EducationContent> get searchResult => _searchResult;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  void searchByTitle(String title) {
    if (title.isEmpty) {
      _searchResult = [];
    } else {
      _searchResult = _educationContent
          .where((element) =>
              element.title!.toLowerCase().contains(title.toLowerCase()))
          .toList();
    }
  }

  void searchByCategory(String category) {
    if (category.isEmpty) {
      _searchResult = [];
    } else {
      _searchResult = _educationContent
          .where((element) =>
              element.category!.toLowerCase().contains(category.toLowerCase()))
          .toList();
    }
  }

  Future<void> fetchEducationContent() async {
    _isFetching = true;
    try {
      final response = await apiService.get('education-contents');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        _educationContent =
            data.map((item) => EducationContent.fromJson(item)).toList();
      }
    } catch (e) {
      print('Failed to fetch education content: $e');
    } finally {
      _isFetching = false;
    }
  }
}

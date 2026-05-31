import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class ApiService {
  Future<List<Book>> fetchBooks() async {
    final response =
    await http.get(Uri.parse('http://localhost:5008/books'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((e) => Book.fromJson(e)).toList();
    }

    throw Exception('Failed to load books');
  }
}
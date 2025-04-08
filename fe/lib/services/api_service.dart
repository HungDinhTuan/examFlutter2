import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fe/models/place.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8080/place";

  static Future<List<Place>> getAllPlaces() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Place.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load places");
    }
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/list_space.dart';

class SpaceProvider extends ChangeNotifier {
  List<Space> _spaces = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<Space> get spaces => _spaces;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  // Fungsi untuk mengambil data dari API
  Future<void> getRecommendedSpace() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      var result = await http.get(
        Uri.parse("https://bwa-cozy-api.vercel.app/recommended-spaces"),
      );

      print('Status Code: ${result.statusCode}'); // Debugging

      if (result.statusCode == 200) {
        List data = jsonDecode(result.body);
        print('Data: $data'); // Debugging
        _spaces = data.map<Space>((item) => Space.fromJson(item)).toList();
      } else {
        print(
            'Failed to load spaces. Error: ${result.reasonPhrase}'); // Debugging
        _hasError = true;
        _spaces = [];
      }
    } catch (e) {
      print("Error fetching spaces: $e"); // Debugging
      _hasError = true;
      _spaces = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}

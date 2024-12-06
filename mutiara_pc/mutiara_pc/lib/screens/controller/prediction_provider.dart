import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PredictionProvider with ChangeNotifier {
  File? imageFile;
  String? predictionMessage;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> predictImage() async {
    if (imageFile == null) return;

    final url = Uri.parse('https://mobileapp.loca.lt/api/predict-image');
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile!.path));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        final data = jsonDecode(responseData);
        if (data['prediction'] != null && data['prediction'].isNotEmpty) {
          String prediction = data['prediction'].toString();
          predictionMessage =
              'Hasil prediksi: ${prediction[0].toUpperCase()}${prediction.substring(1)}';
        } else {
          predictionMessage = 'Prediksi gagal';
        }
      } else {
        predictionMessage = 'Error ${response.statusCode}: $responseData';
      }
      notifyListeners();
    } catch (e) {
      predictionMessage = 'Error: $e';
      notifyListeners();
    }
  }
}
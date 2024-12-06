import 'package:flutter/material.dart';

class FeedbackData {
  final String id;
  final String userId;
  final String message;
  final DateTime timestamp;
  final int rating;
  final String status;
  final String productCategory;
  final String productName;
  final String userImage;
  final String userName;

  FeedbackData({
    required this.id,
    required this.userId,
    required this.message,
    required this.timestamp,
    required this.rating,
    this.status = 'pending',
    this.productCategory = '',
    this.productName = '',
    this.userImage = '',
    this.userName = '',
  });

  // Convert FeedbackData to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'rating': rating,
      'status': status,
      'productCategory': productCategory,
      'productName': productName,
      'userImage': userImage,
      'userName': userName,
    };
  }

  // Create FeedbackData from Map
  factory FeedbackData.fromMap(Map<String, dynamic> map) {
    return FeedbackData(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      message: map['message'] ?? '',
      timestamp:
          DateTime.parse(map['timestamp'] ?? DateTime.now().toIso8601String()),
      rating: map['rating']?.toInt() ?? 0,
      status: map['status'] ?? 'pending',
      productCategory: map['productCategory'] ?? '', // Tambahan
      productName: map['productName'] ?? '', // Tambahan
      userImage: map['userImage'] ?? '', // Tambahan
      userName: map['userName'] ?? '', // Tambahan
    );
  }
}

class FeedbackProvider with ChangeNotifier {
  List<FeedbackData> _feedbacks = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<FeedbackData> get feedbacks => _feedbacks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Set loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Add new feedback
  Future<void> addFeedback(FeedbackData feedback) async {
    try {
      setLoading(true);
      _feedbacks.add(feedback);
      print('Feedback added: ${feedback.message}'); // Debugging
      print('Total feedbacks: ${_feedbacks.length}'); // Debugging
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      print('Error adding feedback: $_error'); // Debugging
    } finally {
      setLoading(false);
    }
  }

  List<FeedbackData> getFeedbacksByProduct(
      String category, String productName) {
    final result = _feedbacks
        .where((feedback) =>
            feedback.productCategory == category &&
            feedback.productName == productName)
        .toList();
    print(
        'Getting feedbacks for $category - $productName: ${result.length}'); // Debugging
    return result;
  }

  Future<void> updateFeedbackStatus(String feedbackId, String newStatus) async {
    try {
      setLoading(true);
      final index = _feedbacks.indexWhere((f) => f.id == feedbackId);
      if (index != -1) {
        final updatedFeedback = FeedbackData(
          id: _feedbacks[index].id,
          userId: _feedbacks[index].userId,
          message: _feedbacks[index].message,
          timestamp: _feedbacks[index].timestamp,
          rating: _feedbacks[index].rating,
          status: newStatus,
          productCategory: _feedbacks[index].productCategory,
          productName: _feedbacks[index].productName,
          userImage: _feedbacks[index].userImage,
          userName: _feedbacks[index].userName,
        );
        _feedbacks[index] = updatedFeedback;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      setLoading(false);
    }
  }

  // Delete feedback
  Future<void> deleteFeedback(String id) async {
    try {
      setLoading(true);
      _feedbacks.removeWhere((f) => f.id == id);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    } finally {
      setLoading(false);
    }
  }

  // Get feedback by ID
  FeedbackData? getFeedbackById(String id) {
    try {
      return _feedbacks.firstWhere((f) => f.id == id);
    } catch (e) {
      return null;
    }
  }

  // Clear all feedbacks
  void clearFeedbacks() {
    _feedbacks = [];
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}

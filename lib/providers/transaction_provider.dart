import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wesbeng/models/transaction_model.dart';
import 'package:wesbeng/services/api_service.dart';

class TransactionProvider extends ChangeNotifier {
  ApiService apiService = ApiService();

  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  Future<void> fetchTransactions() async {
    _isFetching = true;
    try {
      final response = await apiService.get('transaction-history');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        _transactions = data.map((item) => Transaction.fromJson(item)).toList();
      }
    } catch (e) {
      print('Failed to fetch transactions: $e');
    } finally {
      _isFetching = false;
    }
  }
}

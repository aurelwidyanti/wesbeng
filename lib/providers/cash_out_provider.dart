import 'package:flutter/material.dart';
import 'package:wesbeng/models/cash_out_model.dart';
import 'dart:convert';

import 'package:wesbeng/services/api_service.dart';

class CashOutProvider with ChangeNotifier {
  ApiService apiService = ApiService();

  List<CashOut> _cashOuts = [];

  List<CashOut> get cashOuts => _cashOuts;

  bool _isFetching = false;
  bool get isLoading => _isFetching;

  Future<void> fetchCashOuts() async {
    _isFetching = true;
    try {
      final response = await apiService.get('transaction-history');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        _cashOuts = data.map((item) => CashOut.fromJson(item)).toList();
      }
    } catch (e) {
      print('Failed to fetch cash outs: $e');
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  Future<void> createCashOut(String amount, String ewalletName) async {
    try {
      final response = await apiService.post(
        'request-cashout',
        {
          'amount': amount,
          'ewallet_name': ewalletName,
        },
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final newCashOut = CashOut.fromJson(responseData['data']);
        _cashOuts.insert(0, newCashOut);
        notifyListeners();
      } else {
        print('Failed to create cash out: ${response.body}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
}

import 'package:flutter/material.dart';
import '../models/rfp_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProcurementProvider with ChangeNotifier {
  List<RFP> _rfps = [];
  bool _isLoading = false;

  List<RFP> get rfps => _rfps;
  bool get isLoading => _isLoading;

  // Total spend calculation based on RFP budgets
  double get totalSpend => _rfps.fold(0, (sum, item) => sum + item.budget);

  Future<void> fetchRFPs() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Replace with your real API endpoint
      // final response = await http.get(Uri.parse('https://api.powerxchange.ai/rfps'));
      
      // MOCK DATA for testing
      await Future.delayed(const Duration(seconds: 2)); // Simulate network lag
      _rfps = [
        RFP(id: '1', title: 'High-Voltage Transformer', deadline: '2023-12-10', bidCount: 5, status: 'Active', budget: 450000),
        RFP(id: '2', title: 'Smart Grid Sensors', deadline: '2023-12-15', bidCount: 12, status: 'Review', budget: 120000),
        RFP(id: '3', title: 'Solar Inverter Batch A', deadline: '2023-12-20', bidCount: 2, status: 'Open', budget: 850000),
      ];
    } catch (error) {
      print("Error fetching RFPs: $error");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
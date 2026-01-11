import 'package:flutter/material.dart';
import '../models/rfp_model.dart';

class DashboardProvider with ChangeNotifier {
  List<RFP> _rfps = [];
  bool _isLoading = false;

  List<RFP> get rfps => _rfps;
  bool get isLoading => _isLoading;

  double get totalSpend => _rfps.fold(0, (sum, item) => sum + item.budget);

  Future<void> refreshData() async {
    _isLoading = true;
    notifyListeners();

    // Simulated API Latency
    await Future.delayed(const Duration(seconds: 1));

    _rfps = [
      RFP(id: '1', title: 'High-Voltage Transformer', company: 'Metro Grid', deadline: 'Oct 12', bidCount: 8, status: 'Reviewing', budget: 450000),
      RFP(id: '2', title: 'Solar Grid Phase 2', company: 'North Utils', deadline: 'Oct 20', bidCount: 3, status: 'Open', budget: 1200000),
      RFP(id: '3', title: 'Fiber Expansion', company: 'Gov Power', deadline: 'Nov 05', bidCount: 0, status: 'Draft', budget: 85000),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
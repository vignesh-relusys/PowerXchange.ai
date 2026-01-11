import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../theme/app_theme.dart';

class SupplierDashboard extends StatelessWidget {
  const SupplierDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Supplier Portal")),
      body: provider.isLoading 
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: provider.rfps.length,
            itemBuilder: (context, index) {
              final rfp = provider.rfps[index];
              return Card(
                color: AppTheme.cardBg,
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  title: Text(rfp.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("${rfp.company} • Deadline: ${rfp.deadline}"),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16)),
                    child: const Text("Bid Now"),
                  ),
                ),
              );
            },
          ),
    );
  }
}
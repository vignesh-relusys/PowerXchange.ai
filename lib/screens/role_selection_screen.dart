import 'package:flutter/material.dart';
import '../widgets/glass_login_card.dart';
import '../widgets/space_background.dart';
import 'procurement_login.dart';
import 'supplier_login.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SpaceBackground(),
          Center(
            child: GlassLoginCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("PowerXchange.ai", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Select your access portal", style: TextStyle(color: Color(0xFF9CA3AF))),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProcurementLoginScreen())),
                      child: const Text("Procurement Portal"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SupplierLoginScreen())),
                      child: const Text("Supplier Portal"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
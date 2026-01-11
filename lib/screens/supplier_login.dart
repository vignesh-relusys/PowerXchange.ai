import 'package:flutter/material.dart';
import '../widgets/glass_login_card.dart';
import '../widgets/space_background.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import 'supplier_dashboard.dart';

class SupplierLoginScreen extends StatefulWidget {
  const SupplierLoginScreen({super.key});

  @override
  State<SupplierLoginScreen> createState() => _SupplierLoginScreenState();
}

class _SupplierLoginScreenState extends State<SupplierLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) return;
    setState(() => _isLoading = true);
    final success = await AuthService.login(email: _emailController.text.trim(), password: _passwordController.text, role: "supplier");
    setState(() => _isLoading = false);
    if (mounted && success) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SupplierDashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SpaceBackground(),
          Center(
            child: SingleChildScrollView(
              child: GlassLoginCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("PowerXchange.ai", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text("Supplier Portal", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    const Text("AI-enabled access for approved manufacturers and authorized suppliers", 
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.business_outlined), hintText: "Supplier Email Address"),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      width: double.infinity, height: 50,
                      decoration: BoxDecoration(gradient: AppTheme.primaryGradient, borderRadius: BorderRadius.circular(50)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: _isLoading ? null : _handleLogin,
                        child: _isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text("Login to Supplier Portal"),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(child: OutlinedButton(onPressed: () {}, child: const Text("Apply as Supplier"))),
                        const SizedBox(width: 12),
                        Expanded(child: OutlinedButton(onPressed: () {}, child: const Text("Quick Onboarding"))),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("New suppliers require manual verification before full access.", 
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white38)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
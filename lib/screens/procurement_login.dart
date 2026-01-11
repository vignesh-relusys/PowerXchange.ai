import 'package:flutter/material.dart';
import '../widgets/glass_login_card.dart';
import '../widgets/space_background.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import 'procurement_dashboard.dart';

class ProcurementLoginScreen extends StatefulWidget {
  const ProcurementLoginScreen({super.key});

  @override
  State<ProcurementLoginScreen> createState() => _ProcurementLoginScreenState();
}

class _ProcurementLoginScreenState extends State<ProcurementLoginScreen> {
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
    final success = await AuthService.login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      role: "procurement",
    );
    setState(() => _isLoading = false);
    if (mounted && success) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProcurementDashboard()));
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
                    const Text("Procurement Portal", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    const Text("Secure, AI-driven procurement for utilities and energy enterprises", 
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const SizedBox(height: 32),
                    DropdownButtonFormField<String>(
                      value: "Procurement Officer",
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline)),
                      items: const [DropdownMenuItem(value: "Procurement Officer", child: Text("Procurement Officer"))],
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.email_outlined), hintText: "Officer Email Address"),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity, height: 50,
                      decoration: BoxDecoration(gradient: AppTheme.primaryGradient, borderRadius: BorderRadius.circular(50)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                        onPressed: _isLoading ? null : _handleLogin,
                        child: _isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text("Login to Procurement Portal"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                      onPressed: () {},
                      child: const Text("Request Procurement Access"),
                    ),
                    const SizedBox(height: 16),
                    const Text("Procurement onboarding is restricted to authorized personnel.", 
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
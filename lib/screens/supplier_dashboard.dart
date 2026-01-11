import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'role_selection_screen.dart';

class SupplierDashboard extends StatefulWidget {
  const SupplierDashboard({super.key});

  @override
  State<SupplierDashboard> createState() => _SupplierDashboardState();
}

class _SupplierDashboardState extends State<SupplierDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Supplier Portal Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const RoleSelectionScreen()), (_) => false),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome back, TechGrid Solutions", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Your current bid performance and open opportunities", style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 32),
            
            // STATS GRID
            GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 900 ? 4 : 2,
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.5,
              children: const [
                _StatTile(label: "Submitted Bids", value: "12", icon: Icons.send),
                _StatTile(label: "Awarded Contracts", value: "4", icon: Icons.star),
                _StatTile(label: "Pending Delivery", value: "2", icon: Icons.local_shipping),
                _StatTile(label: "Quality Rating", value: "4.9/5", icon: Icons.thumb_up),
              ],
            ),
            
            const SizedBox(height: 40),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LIVE TENDERS LIST
                Expanded(
                  flex: 2,
                  child: _buildOpportunityList(),
                ),
                const SizedBox(width: 24),
                // PERFORMANCE CHART PLACEHOLDER
                Expanded(
                  flex: 1,
                  child: _buildPerformanceCard(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpportunityList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("New Opportunities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryBlue)),
        const SizedBox(height: 16),
        _OpportunityItem(title: "Transformer Refurbishment", company: "Metro Grid Co.", budget: "\$45k", deadline: "3d left"),
        _OpportunityItem(title: "Smart Meter Installation", company: "North Utilities", budget: "\$120k", deadline: "5d left"),
        _OpportunityItem(title: "Emergency Battery Storage", company: "Gov Power", budget: "\$2.1M", deadline: "12d left"),
      ],
    );
  }

  Widget _buildPerformanceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          const Text("Energy Delivery Success", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          SizedBox(
            height: 150,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120, height: 120,
                    child: CircularProgressIndicator(value: 0.85, strokeWidth: 12, backgroundColor: Colors.white10, color: AppTheme.neonCyan),
                  ),
                  const Text("85%", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text("Target: 95%", style: TextStyle(color: Colors.white38, fontSize: 12)),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label, value;
  final IconData icon;
  const _StatTile({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppTheme.cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppTheme.primaryBlue),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 12)),
        ],
      ),
    );
  }
}

class _OpportunityItem extends StatelessWidget {
  final String title, company, budget, deadline;
  const _OpportunityItem({required this.title, required this.company, required this.budget, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.cardBg.withOpacity(0.3),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$company • Budget: $budget"),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: Colors.redAccent.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Text(deadline, style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'role_selection_screen.dart';

class ProcurementDashboard extends StatefulWidget {
  const ProcurementDashboard({super.key});

  @override
  State<ProcurementDashboard> createState() => _ProcurementDashboardState();
}

class _ProcurementDashboardState extends State<ProcurementDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SIDEBAR (Navigation Rail)
          NavigationRail(
            backgroundColor: AppTheme.cardBg,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) => setState(() => _selectedIndex = index),
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: CircleAvatar(backgroundColor: AppTheme.primaryBlue, child: const Icon(Icons.bolt, color: Colors.white)),
            ),
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: Text('Overview')),
              NavigationRailDestination(icon: Icon(Icons.assignment_outlined), selectedIcon: Icon(Icons.assignment), label: Text('RFPs')),
              NavigationRailDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: Text('Suppliers')),
              NavigationRailDestination(icon: Icon(Icons.analytics_outlined), selectedIcon: Icon(Icons.analytics), label: Text('Analytics')),
            ],
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white54),
                  onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const RoleSelectionScreen()), (_) => false),
                ),
              ),
            ),
          ),
          
          // MAIN CONTENT
          Expanded(
            child: Container(
              color: AppTheme.darkBg,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader("Procurement Overview"),
                    const SizedBox(height: 32),
                    
                    // METRICS ROW
                    const Row(
                      children: [
                        Expanded(child: _MetricCard(title: "Active RFPs", value: "24", icon: Icons.description, trend: "+3 this week")),
                        SizedBox(width: 20),
                        Expanded(child: _MetricCard(title: "Total Spend", value: "\$4.2M", icon: Icons.payments, trend: "-12% vs last month")),
                        SizedBox(width: 20),
                        Expanded(child: _MetricCard(title: "Compliance Rate", value: "98.2%", icon: Icons.verified, trend: "Stable")),
                      ],
                    ),
                    
                    const SizedBox(height: 40),
                    _buildSectionHeader("Active Tenders"),
                    const SizedBox(height: 16),
                    
                    // DATA TABLE
                    _buildDataTable(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        Row(
          children: [
            const Icon(Icons.notifications_none, color: Colors.white54),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: AppTheme.cardBg, borderRadius: BorderRadius.circular(20)),
              child: const Row(
                children: [
                  CircleAvatar(radius: 12, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 16)),
                  SizedBox(width: 8),
                  Text("Admin Officer"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppTheme.primaryBlue));
  }

  Widget _buildDataTable() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Table(
        columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1), 3: FlexColumnWidth(1)},
        children: [
          _buildTableRow(["Project Name", "Deadline", "Bids", "Status"], isHeader: true),
          _buildTableRow(["High-Voltage Transformer Supply", "Oct 12, 2023", "8", "Reviewing"]),
          _buildTableRow(["Solar Grid Integration - Phase 2", "Oct 20, 2023", "3", "Open"]),
          _buildTableRow(["Fiber Optic Network Expansion", "Nov 05, 2023", "0", "Draft"]),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(cell, style: TextStyle(
          color: isHeader ? AppTheme.primaryBlue : Colors.white,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        )),
      )).toList(),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title, value, trend;
  final IconData icon;
  const _MetricCard({required this.title, required this.value, required this.icon, required this.trend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.neonCyan.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.neonCyan, size: 28),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 14)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(trend, style: const TextStyle(color: Colors.greenAccent, fontSize: 12)),
        ],
      ),
    );
  }
}
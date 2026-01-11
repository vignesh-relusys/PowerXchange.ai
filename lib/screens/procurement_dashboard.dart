import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../theme/app_theme.dart';
import 'role_selection_screen.dart';

class ProcurementDashboard extends StatefulWidget {
  const ProcurementDashboard({super.key});

  @override
  State<ProcurementDashboard> createState() => _ProcurementDashboardState();
}

class _ProcurementDashboardState extends State<ProcurementDashboard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<DashboardProvider>().refreshData());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: AppTheme.cardBg,
            selectedIndex: 0,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.analytics), label: Text("Overview")),
              NavigationRailDestination(icon: Icon(Icons.gavel), label: Text("Tenders")),
            ],
          ),
          Expanded(
            child: provider.isLoading 
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 32),
                      _buildMetrics(provider),
                      const SizedBox(height: 40),
                      Text("Active RFPs", style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      _buildDataTable(provider),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Procurement Command", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        IconButton(
          icon: const Icon(Icons.logout, color: AppTheme.primaryBlue),
          onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const RoleSelectionScreen())),
        ),
      ],
    );
  }

  Widget _buildMetrics(DashboardProvider provider) {
    return Row(
      children: [
        _MetricCard(label: "Active RFPs", value: provider.rfps.length.toString()),
        const SizedBox(width: 16),
        _MetricCard(label: "Total Budget", value: "\$${(provider.totalSpend / 1000000).toStringAsFixed(1)}M"),
      ],
    );
  }

  Widget _buildDataTable(DashboardProvider provider) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppTheme.cardBg, borderRadius: BorderRadius.circular(12)),
      child: DataTable(
        columns: const [
          DataColumn(label: Text("Project")),
          DataColumn(label: Text("Bids")),
          DataColumn(label: Text("Status")),
        ],
        rows: provider.rfps.map((rfp) => DataRow(cells: [
          DataCell(Text(rfp.title)),
          DataCell(Text(rfp.bidCount.toString())),
          DataCell(Text(rfp.status, style: const TextStyle(color: AppTheme.borderGlow))),
        ])).toList(),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label, value;
  const _MetricCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppTheme.cardBg, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: AppTheme.textGray)),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
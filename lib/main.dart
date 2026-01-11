import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/role_selection_screen.dart';

void main() {
  runApp(const PowerXchangeApp());
}

class PowerXchangeApp extends StatelessWidget {
  const PowerXchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PowerXchange.ai',
      theme: AppTheme.darkTheme,
      home: const RoleSelectionScreen(),
    );
  }
}
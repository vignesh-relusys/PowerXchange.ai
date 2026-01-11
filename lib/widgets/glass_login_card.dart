import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GlassLoginCard extends StatelessWidget {
  final Widget child;
  const GlassLoginCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550, 
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppTheme.neonCyan.withOpacity(0.8),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.neonCyan.withOpacity(0.3),
            blurRadius: 25,
            spreadRadius: -5,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 20,
          ),
        ],
        color: Colors.black.withOpacity(0.4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: child,
        ),
      ),
    );
  }
}
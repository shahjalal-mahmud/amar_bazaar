import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

/// Premium hero section for the product catalog [SliverAppBar].
///
/// Design language: refined dark luxury — deep gradient, a single geometric
/// accent line, and tight two-level typography. Deliberately minimal copy.
class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key, required this.productCount});

  final int productCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.55, 1.0],
          colors: AppColors.heroGradient,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── Geometric accent — diagonal bars ─────────────────────────────
          Positioned(
            right: -40,
            top: 0,
            bottom: 0,
            child: Transform.rotate(
              angle: 0.38, // ~22 degrees
              child: Container(
                width: 3,
                color: AppColors.gold.withValues(alpha: 0.28),
              ),
            ),
          ),
          Positioned(
            right: 28,
            top: 0,
            bottom: 0,
            child: Transform.rotate(
              angle: 0.38,
              child: Container(
                width: 1,
                color: AppColors.gold.withValues(alpha: 0.12),
              ),
            ),
          ),

          // ── Large faint circle — top-right anchor ─────────────────────
          Positioned(
            right: -56,
            top: -56,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.05),
                  width: 1.5,
                ),
              ),
            ),
          ),

          // ── Content ──────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 52),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Status pill
                _StatusPill(count: productCount),
                const SizedBox(height: 12),

                // Primary headline
                const Text(
                  'Premium\nTech Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Status pill ──────────────────────────────────────────────────────────────

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final label = count == 0 ? 'Loading…' : '$count Items';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Gold accent dot
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: AppColors.gold,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 7),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.70),
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.6,
          ),
        ),
      ],
    );
  }
}
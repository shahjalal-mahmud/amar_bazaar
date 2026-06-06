import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

/// Collapsible hero section displayed inside the [SliverAppBar].
///
/// Shows a gradient background with decorative circles, a product-count badge,
/// and a two-line marketing headline.
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
          colors: AppColors.heroGradient,
        ),
      ),
      child: Stack(
        children: [
          // ── Decorative circles ───────────────────────────────────────────
          const _DecorCircle(size: 160, opacity: 0.06, top: -30, right: -30),
          const _DecorCircle(size: 100, opacity: 0.08, bottom: 10, right: 60),
          const _DecorCircle(size: 48, opacity: 0.12, top: 44, right: 110),
          const _DecorCircle(size: 24, opacity: 0.18, top: 80, right: 64),

          // ── Content ──────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 72, 22, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Product count badge
                _CountBadge(count: productCount),
                const SizedBox(height: 10),

                // Headline
                const Text(
                  'Premium\nTech Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Browse the latest devices',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
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

// ─── Badge ────────────────────────────────────────────────────────────────────

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.gold.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.gold.withValues(alpha:0.45)),
      ),
      child: Text(
        count == 0 ? 'Loading products…' : '$count products available',
        style: const TextStyle(
          color: AppColors.gold,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

// ─── Decorative circle ────────────────────────────────────────────────────────

class _DecorCircle extends StatelessWidget {
  const _DecorCircle({
    required this.size,
    required this.opacity,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  final double size;
  final double opacity;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: opacity),
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

/// Central color palette for Amar Bazaar.
/// All colors are sourced from here — never hardcode hex values elsewhere.
abstract final class AppColors {
  // ── Backgrounds ────────────────────────────────────────────────────────────
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color tagBackground = Color(0xFFF0F0F5);

  // ── Brand / Accent ─────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF1A1A2E);
  static const Color secondary = Color(0xFF16213E);
  static const Color deepBlue = Color(0xFF0F3460);
  static const Color gold = Color(0xFFE8B86D);

  // ── Text ───────────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);

  // ── Rating Badge ───────────────────────────────────────────────────────────
  static const Color ratingBackground = Color(0xFFFFF8EE);
  static const Color ratingText = Color(0xFFB45309);

  // ── Favourite Icon ─────────────────────────────────────────────────────────
  static const Color favouriteActive = Color(0xFFEF4444);
  static const Color favouriteInactive = Color(0xFFD1D5DB);

  // ── Shimmer ────────────────────────────────────────────────────────────────
  static const Color shimmerBase = Color(0xFFE5E7EB);
  static const Color shimmerHighlight = Color(0xFFF9FAFB);

  // ── Hero gradient stops ────────────────────────────────────────────────────
  static const List<Color> heroGradient = [primary, secondary, deepBlue];

  // ── Shadow ─────────────────────────────────────────────────────────────────
  static const Color cardShadow = Color(0x0F000000); // ~6 % black
}
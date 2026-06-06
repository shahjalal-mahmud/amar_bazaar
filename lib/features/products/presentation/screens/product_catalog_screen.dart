import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../providers/product_provider.dart';
import '../widgets/hero_header.dart';
import '../widgets/product_grid.dart';

/// The one-and-only screen of Amar Bazaar.
///
/// Architecture note: this screen owns the [CustomScrollView] and orchestrates
/// the [SliverAppBar], section label, [ProductGrid], and footer padding.
/// All state is read from [ProductProvider] via [Consumer] or [context.watch].
class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the initial fetch after the first frame so the widget tree
    // is fully built before notifyListeners() fires.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch product count for the hero badge — rebuilds only that subtree.
    final productCount =
    context.select<ProductProvider, int>((p) => p.products.length);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () => context.read<ProductProvider>().refreshProducts(),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            // ── Collapsible hero AppBar ────────────────────────────────────
            SliverAppBar(
              expandedHeight: 210,
              floating: false,
              pinned: true,
              elevation: 0,
              backgroundColor: AppColors.primary,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: HeroHeader(productCount: productCount),
                titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
                title: const Text(
                  'আমার বাজার',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),

            // ── Section header ─────────────────────────────────────────────
            SliverToBoxAdapter(
              child: _SectionHeader(itemCount: productCount),
            ),

            // ── Product grid (handles all sub-states internally) ───────────
            const ProductGrid(),

            // ── Bottom breathing room ──────────────────────────────────────
            const SliverToBoxAdapter(child: SizedBox(height: 36)),
          ],
        ),
      ),
    );
  }
}

// ─── Section header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
      child: Row(
        children: [
          // Gold accent bar
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              letterSpacing: 0.2,
            ),
          ),
          const Spacer(),
          if (itemCount > 0)
            Text(
              '$itemCount items',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../data/models/product_model.dart';

/// A single product tile displayed in the catalog grid.
///
/// Features:
/// * [CachedNetworkImage] with shimmer placeholder and error fallback
/// * Price formatted via [CurrencyFormatter]
/// * Star-rating badge
/// * Stateful favourite icon (UI only — not persisted)
/// * Ripple ink-well tap effect
class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavourite = false;

  void _toggleFavourite() {
    setState(() => _isFavourite = !_isFavourite);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(18),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {}, // intentional no-op — single-screen assignment
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 18,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Image section ──────────────────────────────────────────
              Expanded(
                flex: 5,
                child: _ProductImage(
                  imageUrl: product.image,
                  isFavourite: _isFavourite,
                  onFavouriteTap: _toggleFavourite,
                ),
              ),

              // ── Info section ───────────────────────────────────────────
              Expanded(
                flex: 3,
                child: _ProductInfo(product: product),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Image section ────────────────────────────────────────────────────────────

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    required this.imageUrl,
    required this.isFavourite,
    required this.onFavouriteTap,
  });

  final String imageUrl;
  final bool isFavourite;
  final VoidCallback onFavouriteTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Product photo
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 350),
            placeholder: (_, __) => Container(
              color: AppColors.shimmerBase,
              child: const Center(
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            errorWidget: (_, __, ___) => Container(
              color: AppColors.tagBackground,
              child: const Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textSecondary,
                  size: 32,
                ),
              ),
            ),
          ),

          // Favourite button
          Positioned(
            top: 8,
            right: 8,
            child: _FavouriteButton(
              isActive: isFavourite,
              onTap: onFavouriteTap,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Favourite button ─────────────────────────────────────────────────────────

class _FavouriteButton extends StatelessWidget {
  const _FavouriteButton({required this.isActive, required this.onTap});

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha:0.92),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.10),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          isActive ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          size: 16,
          color: isActive
              ? AppColors.favouriteActive
              : AppColors.favouriteInactive,
        ),
      ),
    );
  }
}

// ─── Info section ─────────────────────────────────────────────────────────────

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Product name
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: 1.35,
            ),
          ),

          // Price row + rating badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Text(
                CurrencyFormatter.format(product.price),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  letterSpacing: 0.2,
                ),
              ),

              // Rating badge
              _RatingBadge(rating: product.rating),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Rating badge ─────────────────────────────────────────────────────────────

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.ratingBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.gold.withValues(alpha:0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('⭐', style: TextStyle(fontSize: 10)),
          const SizedBox(width: 3),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.ratingText,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
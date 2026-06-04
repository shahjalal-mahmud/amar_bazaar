import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const AmarBazaarApp());
}

// ─── Product Data ────────────────────────────────────────────────────────────

final List<Map<String, dynamic>> products = [
  {
    "name": "iPhone 15 Pro",
    "price": 149999,
    "image":
    "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&q=80",
    "tag": "Apple",
  },
  {
    "name": "Samsung Galaxy S24 Ultra",
    "price": 134999,
    "image":
    "https://images.unsplash.com/photo-1707412911484-7b0440f2830a?w=600&q=80",
    "tag": "Samsung",
  },
  {
    "name": "Google Pixel 9",
    "price": 89999,
    "image":
    "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=600&q=80",
    "tag": "Google",
  },
  {
    "name": "MacBook Air M4",
    "price": 129999,
    "image":
    "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&q=80",
    "tag": "Apple",
  },
  {
    "name": "Sony WH-1000XM5",
    "price": 34999,
    "image":
    "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&q=80",
    "tag": "Sony",
  },
  {
    "name": "iPad Air M2",
    "price": 79999,
    "image":
    "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600&q=80",
    "tag": "Apple",
  },
  {
    "name": "Apple Watch Series 10",
    "price": 49999,
    "image":
    "https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=600&q=80",
    "tag": "Apple",
  },
  {
    "name": "DJI Mini 4 Pro Drone",
    "price": 74999,
    "image":
    "https://images.unsplash.com/photo-1579829366248-204fe8413f31?w=600&q=80",
    "tag": "DJI",
  },
  {
    "name": "Lenovo ThinkPad X1",
    "price": 119999,
    "image":
    "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600&q=80",
    "tag": "Lenovo",
  },
  {
    "name": "Logitech MX Master 3S",
    "price": 9999,
    "image":
    "https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=600&q=80",
    "tag": "Logitech",
  },
  {
    "name": "Asus ROG Phone 8",
    "price": 109999,
    "image":
    "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=600&q=80",
    "tag": "Asus",
  },
  {
    "name": "Nintendo Switch OLED",
    "price": 39999,
    "image":
    "https://images.unsplash.com/photo-1585366119957-e9730b6d0f60?w=600&q=80",
    "tag": "Nintendo",
  },
];

// ─── Colour Palette ───────────────────────────────────────────────────────────

const _kBg = Color(0xFFF7F8FA);
const _kSurface = Color(0xFFFFFFFF);
const _kAccent = Color(0xFF1A1A2E);
const _kAccentLight = Color(0xFF16213E);
const _kGold = Color(0xFFE8B86D);
const _kTextPrimary = Color(0xFF1A1A2E);
const _kTextSecondary = Color(0xFF6B7280);
const _kTagBg = Color(0xFFF0F0F5);

// ─── Root App ────────────────────────────────────────────────────────────────

class AmarBazaarApp extends StatelessWidget {
  const AmarBazaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'আমার বাজার',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _kAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: _kBg,
        fontFamily: 'Roboto',
      ),
      home: const ProductShowcaseScreen(),
    );
  }
}

// ─── Main Screen ─────────────────────────────────────────────────────────────

class ProductShowcaseScreen extends StatelessWidget {
  const ProductShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ── Collapsible Hero AppBar ──────────────────────────────────────
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: _kAccent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _HeroHeader(productCount: products.length),
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

          // ── Section Label ────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 22,
                    decoration: BoxDecoration(
                      color: _kGold,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Featured Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _kTextPrimary,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${products.length} items',
                    style: const TextStyle(
                      fontSize: 13,
                      color: _kTextSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Product Grid ─────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.72, // taller cards = more breathing room
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) => _ProductCard(product: products[index]),
                childCount: products.length,
              ),
            ),
          ),

          // ── Bottom padding ───────────────────────────────────────────────
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

// ─── Hero Header Widget ───────────────────────────────────────────────────────

class _HeroHeader extends StatelessWidget {
  final int productCount;
  const _HeroHeader({required this.productCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_kAccent, _kAccentLight, Color(0xFF0F3460)],
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -30,
            right: -30,
            child: _DecorCircle(size: 160, opacity: 0.06),
          ),
          Positioned(
            bottom: 10,
            right: 60,
            child: _DecorCircle(size: 80, opacity: 0.08),
          ),
          Positioned(
            top: 40,
            right: 110,
            child: _DecorCircle(size: 40, opacity: 0.10),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _kGold.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _kGold.withOpacity(0.4)),
                  ),
                  child: Text(
                    '$productCount products available',
                    style: const TextStyle(
                      color: _kGold,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorCircle extends StatelessWidget {
  final double size;
  final double opacity;
  const _DecorCircle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(opacity), width: 1),
      ),
    );
  }
}

// ─── Product Card ─────────────────────────────────────────────────────────────

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const _ProductCard({required this.product});

  /// Formats integer price as ৳1,49,999 (BD lakhs format)
  String _formatPrice(int price) {
    final s = price.toString();
    if (s.length <= 3) return '৳$s';

    // Last 3 digits, then groups of 2
    final last3 = s.substring(s.length - 3);
    final rest = s.substring(0, s.length - 3);
    final buffer = StringBuffer();
    for (int i = 0; i < rest.length; i++) {
      if (i > 0 && (rest.length - i) % 2 == 0) buffer.write(',');
      buffer.write(rest[i]);
    }
    return '৳$buffer,$last3';
  }

  @override
  Widget build(BuildContext context) {
    final name = product['name'] as String;
    final price = product['price'] as int;
    final imageUrl = product['image'] as String;
    final tag = product['tag'] as String;

    return Material(
      color: _kSurface,
      borderRadius: BorderRadius.circular(18),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {}, // ripple effect
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Product Image ──────────────────────────────────────────
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, progress) {
                          if (progress == null) return child;
                          return Container(
                            color: _kTagBg,
                            child: Center(
                              child: CircularProgressIndicator(
                                value:
                                progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!
                                    : null,
                                strokeWidth: 2,
                                color: _kAccent,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (_, __, ___) => Container(
                          color: _kTagBg,
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: _kTextSecondary,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                      // Brand tag overlay
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.90),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: _kAccent,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Product Info ───────────────────────────────────────────
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _kTextPrimary,
                          height: 1.35,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatPrice(price),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: _kAccent,
                              letterSpacing: 0.2,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: _kAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/products/presentation/screens/product_catalog_screen.dart';
import 'features/products/providers/product_provider.dart';

/// Root widget of Amar Bazaar.
///
/// Injects [ProductProvider] at the top of the widget tree so it is
/// accessible from any descendant without passing it through constructors.
class AmarBazaarApp extends StatelessWidget {
  const AmarBazaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: MaterialApp(
        title: 'আমার বাজার',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF1A1A2E),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF7F8FA),
          // Use the system default font — Roboto on Android, SF on iOS.
          // No custom font is required for this assignment.
        ),
        home: const ProductCatalogScreen(),
      ),
    );
  }
}
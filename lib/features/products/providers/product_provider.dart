import 'package:flutter/foundation.dart';

import '../data/models/product_model.dart';
import '../data/services/product_service.dart';

/// Describes the current loading state of the product list.
enum ProductStatus { initial, loading, success, error }

/// Central state container for the product catalog.
///
/// Consumed by the presentation layer via [Provider] / [Consumer].
class ProductProvider extends ChangeNotifier {
  ProductProvider({ProductService? service})
      : _service = service ?? ProductService();

  final ProductService _service;

  // ── State ──────────────────────────────────────────────────────────────────

  ProductStatus _status = ProductStatus.initial;
  List<ProductModel> _products = [];
  String _errorMessage = '';

  // ── Getters ────────────────────────────────────────────────────────────────

  ProductStatus get status => _status;
  List<ProductModel> get products => List.unmodifiable(_products);
  String get errorMessage => _errorMessage;

  bool get isLoading => _status == ProductStatus.loading;
  bool get hasError => _status == ProductStatus.error;
  bool get isEmpty =>
      _status == ProductStatus.success && _products.isEmpty;

  // ── Actions ────────────────────────────────────────────────────────────────

  /// Initial load — sets status to [ProductStatus.loading] before fetching.
  Future<void> fetchProducts() async {
    _setLoading();
    await _load();
  }

  /// Pull-to-refresh / retry — same as [fetchProducts] but keeps previous
  /// data visible during the reload (status stays as loading overlay).
  Future<void> refreshProducts() async {
    _setLoading();
    await _load();
  }

  // ── Private helpers ────────────────────────────────────────────────────────

  void _setLoading() {
    _status = ProductStatus.loading;
    _errorMessage = '';
    notifyListeners();
  }

  Future<void> _load() async {
    try {
      final results = await _service.fetchProducts();
      _products = results;
      _status = ProductStatus.success;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('ApiException: ', '');
      _status = ProductStatus.error;
    } finally {
      notifyListeners();
    }
  }
}
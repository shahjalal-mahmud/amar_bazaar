import '../../../../core/network/api_client.dart';
import '../models/product_model.dart';

/// Responsible solely for fetching and parsing product data.
/// Contains zero UI code — all presentation concerns live in the provider.
class ProductService {
  ProductService({ApiClient? client})
      : _client = client ?? ApiClient.instance;

  final ApiClient _client;

  static const String _endpoint =
      'https://api.pixora.one/products.php';

  /// Fetches the full product list from the remote API.
  ///
  /// Returns a list of [ProductModel] on success.
  /// Rethrows [ApiException] on any failure so the provider can handle it.
  Future<List<ProductModel>> fetchProducts() async {
    final json = await _client.get(_endpoint);

    // Validate API-level success flag
    final success = json['success'] as bool? ?? false;
    if (!success) {
      final message = json['message'] as String? ?? 'Unknown API error.';
      throw ApiException(message);
    }

    final rawList = json['data'] as List<dynamic>? ?? [];
    return rawList
        .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
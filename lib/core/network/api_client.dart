import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// Thin HTTP wrapper used by all feature services.
/// Handles timeout, status-code checks, and JSON decoding in one place.
class ApiClient {
  ApiClient._();

  static final ApiClient instance = ApiClient._();

  // ── Configuration ──────────────────────────────────────────────────────────
  static const Duration _timeout = Duration(seconds: 15);

  // ── Public helpers ─────────────────────────────────────────────────────────

  /// Performs a GET request and returns the decoded JSON body.
  ///
  /// Throws a [ApiException] on any network or server error.
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded is Map<String, dynamic>) {
          return decoded;
        }
        throw const ApiException('Unexpected response format.');
      } else {
        throw ApiException(
          'Server error ${response.statusCode}: ${response.reasonPhrase}',
        );
      }
    } on SocketException {
      throw const ApiException('No internet connection. Please check your network.');
    } on HttpException {
      throw const ApiException('Could not reach the server. Try again later.');
    } on FormatException {
      throw const ApiException('Received malformed data from the server.');
    }
  }
}

/// Typed exception thrown by [ApiClient].
class ApiException implements Exception {
  const ApiException(this.message);

  final String message;

  @override
  String toString() => 'ApiException: $message';
}
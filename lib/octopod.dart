library octopod;

import 'package:octopod/models/product.dart';
import 'package:octopod/services/http_client_service.dart';

class Octopod {
  Octopod({this.apiKey});

  final String? apiKey;

  final _httpClientService = HttpClientService();

  Future<List<Product>> getProducts() async {
    final productResponse = await _httpClientService.get('/products');
    final results = productResponse['results'] as List;
    final products =
        results.map<Product>((result) => Product.fromJson(result)).toList();

    return products;
  }
}

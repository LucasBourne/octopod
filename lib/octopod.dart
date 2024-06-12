library octopod;

import 'package:octopod/models/account.dart';
import 'package:octopod/models/product.dart';
import 'package:octopod/services/http_client_service.dart';

export 'package:octopod/models/account.dart';
export 'package:octopod/models/address.dart';
export 'package:octopod/models/agreement.dart';
export 'package:octopod/models/electricity_meter_point.dart';
export 'package:octopod/models/gas_meter_point.dart';
export 'package:octopod/models/link.dart';
export 'package:octopod/models/meter.dart';
export 'package:octopod/models/product.dart';
export 'package:octopod/models/property.dart';
export 'package:octopod/models/register.dart';

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

  Future<Account> getAccount(String userId) async {
    final accountResponse = await _httpClientService.get(
      '/accounts/$userId/',
      apiKey,
    );
    final account = Account.fromJson(accountResponse);

    return account;
  }
}

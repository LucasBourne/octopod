import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:octopod/config.dart';
import 'package:octopod/services/http_client_interface.dart';

class HttpClientService implements HttpClientInterface {
  final _dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future get(String path, [String? apiKey]) async {
    final response = await _dio.get(
      path,
      options: apiKey != null
          ? Options(
              headers: {
                'authorization':
                    'Basic ${base64Encode(utf8.encode('$apiKey:'))}',
              },
            )
          : null,
    );
    return response.data;
  }
}

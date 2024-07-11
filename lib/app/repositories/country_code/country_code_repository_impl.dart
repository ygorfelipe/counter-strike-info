import 'package:cs2_info/app/application/config/env/env.dart';
import 'package:cs2_info/app/application/exception/repository_exception.dart';
import 'package:cs2_info/app/application/logger/i_logger.dart';
import 'package:cs2_info/app/application/rest_client/custom_dio.dart';
import 'package:cs2_info/app/models/country_codes/country_model.dart';
import 'package:dio/dio.dart';

import './country_code_repository.dart';

class CountryCodeRepositoryImpl implements CountryCodeRepository {
  final CustomDio _dio;
  final ILogger _logger;

  CountryCodeRepositoryImpl({required CustomDio dio, required ILogger logger})
      : _dio = dio,
        _logger = logger;

  @override
  Future<List<CountryModel>> getAll() async {
    try {
      final result = await _dio.unAuht().get('${Env.i['country_code']}');

      return result.data
          .map<CountryModel>((country) => CountryModel.fromMap(country))
          .toList();
    } on DioException catch (e, s) {
      _logger.error('Erro ao buscar lista de paises', e, s);
      throw RepositoryException(message: 'Erro ao buscar lita de paises');
    }
  }
}

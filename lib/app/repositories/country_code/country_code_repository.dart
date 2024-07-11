import '../../models/country_codes/country_model.dart';

abstract interface class CountryCodeRepository {
  Future<List<CountryModel>> getAll();
}

import 'package:cs2_info/app/application/constants/constants.dart';
import 'package:cs2_info/app/application/rest_client/custom_dio.dart';
import 'package:cs2_info/app/models/agent/agent_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './agent_repository.dart';

class AgentRepositoryImpl implements AgentRepository {
  final CustomDio _dio;

  AgentRepositoryImpl({required CustomDio dio}) : _dio = dio;
  @override
  Future<List<AgentModel>> getAllAgent() async {
    final sp = await SharedPreferences.getInstance();
    final language = sp.getString(Constants.language);
    final result = await _dio.unAuht().get('/$language/agents.json');
    return result.data
        .map<AgentModel>((agent) => AgentModel.fromMap(agent))
        .toList();
  }
}

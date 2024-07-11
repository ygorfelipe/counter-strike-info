import '../../models/agent/agent_model.dart';

abstract interface class AgentRepository {
  Future<List<AgentModel>> getAllAgent();
}

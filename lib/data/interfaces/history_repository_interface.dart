
import '../model/reaction_time_history_model.dart';

abstract class IHistoryRepository {
  Future getAll();
  void insert(ReactionTimeHistoryModel reactionTimeHistory);
}
import 'dart:convert';

import 'package:reaction_time_app/data/util/preferences_keys.dart';

import 'interfaces/history_repository_interface.dart';
import 'interfaces/local_storage_interface.dart';
import 'model/reaction_time_history_model.dart';

class HistoryRepository extends IHistoryRepository {
  final ILocalStorage storage;

  HistoryRepository({
    required this.storage,
  });

  @override
  Future<List<ReactionTimeHistoryModel>> getAll() async {
    try {
      final items = json.decode(await storage.get(PreferencesKeys.historyItems));
      List<ReactionTimeHistoryModel> list = [];
      items.forEach((item) {
        list.add(
          ReactionTimeHistoryModel(
            date: item['date'],
            reactionTime: item['reactionTime']
          )
        );
      });
      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  void insert(ReactionTimeHistoryModel item) async {
    List<ReactionTimeHistoryModel> items = await getAll();
    items.add(item);
    items.sort((a, b) => (a.reactionTime ?? 0).compareTo(b.reactionTime ?? 0));
    storage.put(PreferencesKeys.historyItems, json.encode(items));
  }
}

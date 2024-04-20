import 'package:flutter/material.dart';
import 'package:reaction_time_app/data/history_repository.dart';
import 'package:reaction_time_app/data/shared_preferences_local_storage.dart';

import '../../../data/interfaces/history_repository_interface.dart';
import '../../../data/model/reaction_time_history_model.dart';
import 'history_state.dart';

class HistoryViewModel {

  IHistoryRepository historyRepository = HistoryRepository(storage: SharedPreferencesLocalStorage());

  ValueNotifier<HistoryState> state = ValueNotifier(Loading());

  HistoryViewModel() {
    _loadHistory();
  }

  void _loadHistory() {
    historyRepository.getAll().then((value) {
      if ((value as List<ReactionTimeHistoryModel>).isEmpty) {
        state.value = Empty();
      } else {
        state.value = Show(data: value);
      }
    });
  }
}
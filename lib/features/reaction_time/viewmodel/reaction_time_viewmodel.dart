import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reaction_time_app/features/reaction_time/util/date_formatter.dart';

import '../../../data/interfaces/history_repository_interface.dart';
import '../../../data/model/reaction_time_history_model.dart';
import '../util/time_formatter.dart';
import 'reaction_time_action.dart';
import 'reaction_time_state.dart';

class ReactionTimeViewModel {

  final IHistoryRepository historyRepository;

  ValueNotifier<ReactionTimeState> state = ValueNotifier(Waiting());
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _startTimer;
  late Timer _updateTimer;

  static const MINIMUM_START_TIME = 2;
  static const ADDITIONAL_START_TIME = 6;
  static const UPDATE_INTERVAL_TIME = 30;

  ReactionTimeViewModel({required this.historyRepository});

  void handleAction(ReactionTimeAction action) {
    switch (action) {
      case Start():
        _start();
      case Stop():
        _stop();
    }
  }

  void _start() {
    state.value = Ready();
    int randomStartTime = MINIMUM_START_TIME + Random().nextInt(ADDITIONAL_START_TIME);
    _startTimer = Timer(Duration(seconds: randomStartTime), () {
      _updateTimer = Timer.periodic(const Duration(milliseconds: UPDATE_INTERVAL_TIME), (timer) {
        state.value = Running(currentTime: TimeFormatter.format(_stopwatch.elapsedMilliseconds));
      });
      _stopwatch.start();
    });
  }

  void _stop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _updateTimer.cancel();
      state.value = Finished(totalTime: TimeFormatter.format(_stopwatch.elapsedMilliseconds));
      historyRepository.insert(
        ReactionTimeHistoryModel(
          date: DateFormatter.format(DateTime.now()),
          reactionTime: _stopwatch.elapsedMilliseconds
        )
      );
      _stopwatch.reset();
    } else {
      _startTimer.cancel();
      state.value = FinishedBeforeStart();
    }
  }
}

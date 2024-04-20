import 'package:flutter/material.dart';

sealed class ReactionTimeState {
  Color backgroundColor = Colors.blue;
}

class Waiting extends ReactionTimeState {}

class Ready extends ReactionTimeState {
  @override
  Color backgroundColor = Colors.red;
}

class Running extends ReactionTimeState {
  @override
  Color backgroundColor = Colors.green;

  final String currentTime;
  Running({required this.currentTime});
}

class Finished extends ReactionTimeState {
  final String totalTime;
  Finished({required this.totalTime});
}

class FinishedBeforeStart extends ReactionTimeState {}

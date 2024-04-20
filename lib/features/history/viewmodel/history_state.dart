import '../../../data/model/reaction_time_history_model.dart';

sealed class HistoryState {}
class Loading extends HistoryState {}
class Empty extends HistoryState {}
class Show extends HistoryState {
  final List<ReactionTimeHistoryModel> data;

  Show({required this.data});
}
import 'package:flutter/material.dart';
import 'package:reaction_time_app/features/reaction_time/util/time_formatter.dart';

import '../../../data/model/reaction_time_history_model.dart';

class HistoryItemWidget extends StatelessWidget {
  final int position;
  final ReactionTimeHistoryModel reactionTimeHistory;

  const HistoryItemWidget({
    required this.position,
    required this.reactionTimeHistory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: positionColor,
        foregroundColor: Colors.white,
        child: SizedBox(
          child: Text(
            (position + 1).toString(),
          ),
        ),
      ),
      title: Text(
        TimeFormatter.format(reactionTimeHistory.reactionTime ?? 0),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(reactionTimeHistory.date.toString()),
    );
  }

  Color get positionColor {
    switch (position) {
      case 0:
        return const Color(0xffd4af37);
      case 1:
        return const Color(0xffc0c0c0);
      case 2:
        return const Color(0xffcd7f32);
      default:
        return Colors.blue;
    }
  }
}

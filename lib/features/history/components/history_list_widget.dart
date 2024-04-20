import 'package:flutter/material.dart';

import '../../../data/model/reaction_time_history_model.dart';
import 'history_item_widget.dart';

class HistoryListWidget extends StatelessWidget {
  final List<ReactionTimeHistoryModel> items;

  const HistoryListWidget({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            HistoryItemWidget(
              position: index,
              reactionTimeHistory: items[index],
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

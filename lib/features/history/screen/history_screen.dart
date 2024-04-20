import 'package:flutter/material.dart';
import 'package:reaction_time_app/features/history/components/empty_list_widget.dart';
import 'package:reaction_time_app/features/history/components/history_list_widget.dart';
import 'package:reaction_time_app/features/history/viewmodel/history_viewmodel.dart';

import '../viewmodel/history_state.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final HistoryViewModel historyViewModel = HistoryViewModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: historyViewModel.state,
      builder: (context, state, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Histórico'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          body: Container(
            child: () {
              switch (state) {
                case Loading():
                  return const CircularProgressIndicator.adaptive();
                case Empty():
                  return const EmptyListWidget();
                case Show():
                  return HistoryListWidget(items: state.data);
              }
            }(),
          ),
        );
      },
    );
  }
}

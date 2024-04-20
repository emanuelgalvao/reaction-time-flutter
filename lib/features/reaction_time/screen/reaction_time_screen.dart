import 'package:flutter/material.dart';
import 'package:reaction_time_app/core/routes/app_icons.dart';
import 'package:reaction_time_app/features/reaction_time/components/finished_widget.dart';
import 'package:reaction_time_app/features/reaction_time/components/time_text_widget.dart';

import '../../../core/routes/app_routes.dart';
import '../viewmodel/reaction_time_action.dart';
import '../viewmodel/reaction_time_state.dart';
import '../viewmodel/reaction_time_viewmodel.dart';

class ReactionTimeScreen extends StatelessWidget {
  final ReactionTimeViewModel reactionTimeViewModel;

  const ReactionTimeScreen({required this.reactionTimeViewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: reactionTimeViewModel.state,
        builder: (context, state, _) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.history);
                    },
                    icon: Icon(
                      AppIcons.historyIcon,
                      color: Colors.white,
                    ),
                  ),
                ],
                backgroundColor: Colors.transparent,
              ),
              body: () {
                switch (state) {
                  case Waiting():
                    return TimeTextWidget(
                      message: 'TOQUE PARA COMEÇAR',
                      backgroundColor: state.backgroundColor,
                      onTap: () => reactionTimeViewModel.handleAction(Start()),
                    );
                  case Ready():
                    return TimeTextWidget(
                      message: 'PREPARE-SE',
                      backgroundColor: state.backgroundColor,
                      onTap: () => reactionTimeViewModel.handleAction(Stop()),
                    );
                  case Running():
                    return TimeTextWidget(
                      message: state.currentTime,
                      backgroundColor: state.backgroundColor,
                      onTap: () => reactionTimeViewModel.handleAction(Stop()),
                    );
                  case Finished():
                    return FinishedWidget(
                      message: 'VOCÊ REAGIU EM\n${state.totalTime}\nSEGUNDOS!',
                      onTap: () => reactionTimeViewModel.handleAction(Start()),
                    );
                  case FinishedBeforeStart():
                    return FinishedWidget(
                      message: 'OPS!\nVOCÊ QUEIMOU A LARGADA!',
                      onTap: () => reactionTimeViewModel.handleAction(Start()),
                    );
                }
              }());
        });
  }
}

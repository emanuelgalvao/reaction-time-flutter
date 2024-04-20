import 'package:flutter/material.dart';
import 'package:reaction_time_app/data/history_repository.dart';
import 'package:reaction_time_app/data/shared_preferences_local_storage.dart';

import '../features/history/screen/history_screen.dart';
import '../features/reaction_time/screen/reaction_time_screen.dart';
import '../features/reaction_time/viewmodel/reaction_time_viewmodel.dart';
import 'routes/app_routes.dart';


class MainWidget extends StatelessWidget {
  const MainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.home: (_) => ReactionTimeScreen(reactionTimeViewModel: ReactionTimeViewModel(historyRepository: HistoryRepository(storage: SharedPreferencesLocalStorage()))),
        AppRoutes.history: (_) => HistoryScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
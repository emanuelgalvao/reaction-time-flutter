import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcons {

  static final isIos = Platform.isIOS;

  static final historyIcon = isIos ? CupertinoIcons.list_number : Icons.history;
  
  static final restartIcon = isIos ? CupertinoIcons.arrow_clockwise : Icons.replay;
}
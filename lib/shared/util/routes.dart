import 'package:flutter/material.dart';

import '../../screens/screens.dart';


Map<String, Widget Function(BuildContext)> routes(BuildContext context) {
  return {
    StudentScreen.routeName: (context) => StudentScreen(),
  };
}
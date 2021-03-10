import 'package:flutter/material.dart';

import 'shared_widgets.dart';
import '../../screens/screens.dart';


class NavigationScaffold extends StatelessWidget {
  const NavigationScaffold({
    @required this.customBody,
  }) : super();

  final Widget customBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 120,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 5,
                    color: Colors.deepPurple.shade300,
                  ),
                ],
              ),
              child: Column(
                children: [
                  NavigationItem(
                    routeName: StudentScreen.routeName,
                    name: 'Studends',
                    icon: Icon(Icons.lock),
                  ),

                ],
              ),
            ),
          ),
          Expanded(flex: 880, child: customBody),
        ],
      ),
    );
  }
}

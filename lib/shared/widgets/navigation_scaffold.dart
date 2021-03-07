import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'shared_widgets.dart';
import '../../screens/screens.dart';


class NavigationScaffold extends StatelessWidget {
  const NavigationScaffold({
    Key key,
    @required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 120,
            child: Container(
              color: Colors.deepPurple,
              child: Column(
                children: [
                  NavigationItem(
                    routeName: StudentScreen.routeName,
                    icon: FaIcon(FontAwesomeIcons.child),
                    name: 'Leerlingen',
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 880, child: body),
        ],
      ),
    );
  }
}

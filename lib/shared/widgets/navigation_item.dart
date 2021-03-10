import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    Key key,
    @required this.routeName,
    @required this.icon,
    @required this.name,
  }) : super(key: key);

  final String routeName;
  final Icon icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: icon,
          onPressed: () => Navigator.of(context).pushNamed(routeName),
        ),
        Text('$name'),
      ],
    );
  }
}

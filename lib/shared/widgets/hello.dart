import 'package:flutter/material.dart';
import '../../screens/screens.dart';

class Hello extends StatelessWidget {
  const Hello({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Hello'),
      onPressed: () =>
          Navigator.of(context).pushNamed(StudentScreen.routeName),
    );
  }
}

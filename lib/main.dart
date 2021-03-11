import 'package:flutter/material.dart';
import 'shared/util/util.dart';
import 'shared/widgets/shared_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      builder: (context, child) {
        SizeConfig().init(context);
        return Theme(
          data: themeData,
          child: child,
        );
      },
      title: 'Cijfers Enzo',
      routes: routes(context),
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Hello()
          ],
        ),
        body: Center(
          child: Text('Main screen 5'),
        ),
      ),
    );
  }
}


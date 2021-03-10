import 'package:cijfers_enzo/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'shared/util/util.dart';
import 'state_models/providers/providers.dart';
import 'state_models/notifiers/notifiers.dart';
import 'shared/widgets/shared_widgets.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    final studentNotifier = useProvider(studentNotifierProvider);
    final students = useProvider(studentNotifierProvider.state);

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


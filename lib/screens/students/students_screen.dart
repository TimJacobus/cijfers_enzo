import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../state_models/providers/providers.dart';
import '../../shared/widgets/shared_widgets.dart';

class StudentScreen extends HookWidget {
  static const routeName = '/leerlingen';

  @override
  Widget build(BuildContext context) {
    final studentNotifier = useProvider(studentNotifierProvider);
    final students = useProvider(studentNotifierProvider.state);

    return NavigationScaffold(body: Text('hello world'));
  }
}

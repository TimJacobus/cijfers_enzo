import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'shared/util/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'state_models/providers/providers.dart';
import 'state_models/notifiers/notifiers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final helloWorldProvider = Provider((ref) => 'Hello world!');

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final studentNotifier = watch(studentNotifierProvider);

    return MaterialApp(
      builder: (context, child) {
        SizeConfig().init(context);
        return Theme(
          data: themeData,
          child: child,
        );
      },
      title: 'Cijfers Enzo',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cijfers Enzo'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Add a student'),
                onPressed: () => studentNotifier.add(
                  Student(
                    index: 0,
                    firstName: 'Iloumar',
                    lastName: 'Celesteijn',
                    studentId: UniqueKey(),
                  ),
                ),
              ),
              Students(),
            ],
          ),
        ),
      ),
    );
  }
}

class Students extends HookWidget {
  const Students({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final students = useProvider(studentNotifierProvider.state);

    return Column(
      children: students
          .map((student) => Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20,),
                    child: Text(student.firstName),
                  ),
                  Text(student.lastName)
                ],
              ))
          .toList(),
    );
  }
}

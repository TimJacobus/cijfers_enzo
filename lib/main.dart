import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'shared/util/util.dart';
import 'state_models/providers/providers.dart';
import 'state_models/notifiers/notifiers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/screens.dart';

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
          title: Text('Cijfers Enzo'),
          actions: [
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.child,
              ),
              tooltip: 'Leerlingen',
              onPressed: () =>
                  Navigator.of(context).pushNamed(StudentScreen.routeName),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Add a student'),
                onPressed: () => studentNotifier.add(
                  Student(
                    index: students.length ?? 0,
                    firstName: 'Iloumar',
                    lastName: 'Celesteijn',
                    studentId: UniqueKey(),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Edit a student'),
                onPressed: () => studentNotifier.edit(
                  students[1].studentId,
                  'Mohamed',
                  'Broeder',
                  '',
                ),
              ),
              ElevatedButton(
                child: Text('Remove a student'),
                onPressed: () => studentNotifier.remove(students[1].studentId),
              ),
              Column(
                children: students
                    .map((student) => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                              ),
                              child: Text(student.firstName),
                            ),
                            Text(student.lastName)
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

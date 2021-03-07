import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Student {
  String firstName;
  String lastName;
  String lastNamePrefix;
  final Key studentId;
  int index;

  Student({
    @required this.firstName,
    @required this.lastName,
    @required this.studentId,
    @required this.index,
    this.lastNamePrefix,
  });

  void updateIndex(int newIndex) {
    index = newIndex;
  }

  void updateStudentName(
    String newFirstName,
    String newLastName,
    String newLastNamePrefix,
  ) {
    firstName = newFirstName;
    lastName = newLastName;
    lastNamePrefix = newLastNamePrefix;
  }
}

class StudentsNotifier extends StateNotifier<List<Student>> {
  StudentsNotifier() : super([]);

  void add(Student student) {
    state = [...state, student];
    print('Done');
  }

  void remove(Key studentId) {
    final int removedIndex =
        state.firstWhere((student) => student.studentId == studentId).index;
    state
      ..removeWhere((student) => student.studentId == studentId)
      ..map((student) {
        if (student.index > removedIndex)
          student.updateIndex(student.index - 1);
      }).toList();
  }

  void edit(Key studentId, String firstName, String lastName,
      String lastNamePrefix) {
    state.map((student) {
      if (student.studentId == studentId)
        student.updateStudentName(
          firstName,
          lastName,
          lastNamePrefix,
        );
    }).toList();
  }
}
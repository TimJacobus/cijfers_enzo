import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Student {
  final String firstName;
  final String lastName;
  final String lastNamePrefix;
  final Key studentId;
  final int index;

  Student({
    @required this.firstName,
    @required this.lastName,
    @required this.studentId,
    @required this.index,
    this.lastNamePrefix,
  });
}

class StudentsNotifier extends StateNotifier<List<Student>> {
  StudentsNotifier() : super([]);

  void add(Student student) {
    state = [...state, student];
  }

  void remove(Key studentId) {
    final int removedIndex =
        state.firstWhere((student) => student.studentId == studentId).index;
    state = state
      ..removeWhere((student) => student.studentId == studentId)
      ..map((student) {
        if (student.index > removedIndex)
          Student(
            firstName: student.firstName,
            lastName: student.lastName,
            index: student.index - 1,
            studentId: student.studentId,
            lastNamePrefix: student.lastNamePrefix,
          );
      }).toList();
  }

  void edit(
      Key studentId, String firstName, String lastName, String lastNamePrefix) {
    state = state..map((student) {
      if (student.studentId == studentId)
        Student(
          studentId: student.studentId,
          index: student.index,
          lastName: lastName,
          firstName: firstName,
          lastNamePrefix: lastNamePrefix,
        );
    }).toList();
  }
}
import '../notifiers/notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentProvider = Provider((ref) => StudentsNotifier());
final studentNotifierProvider = StateNotifierProvider((ref) => StudentsNotifier());

Provider numberOfStudents = Provider((ref) {
  return ref.watch(studentNotifierProvider.state).length;
});

Provider sortedList = Provider((ref) {
  final students = ref.watch(studentNotifierProvider.state);
  return students.length > 0 ? students.sort((a, b) => a.index.compareTo(b.index)) : students;
});
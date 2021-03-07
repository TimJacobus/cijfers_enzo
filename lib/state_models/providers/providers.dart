import '../notifiers/notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentProvider = Provider((ref) => StudentsNotifier());
final studentNotifierProvider = StateNotifierProvider((ref) => StudentsNotifier());

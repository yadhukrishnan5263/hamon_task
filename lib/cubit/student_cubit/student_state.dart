part of 'student_cubit.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}
class StudentDataLoaded extends StudentState {
  final List<StudentModel> students;

  StudentDataLoaded(this.students);
}
class StudentDataLoading extends StudentState {}
class StudentDataError extends StudentState {}

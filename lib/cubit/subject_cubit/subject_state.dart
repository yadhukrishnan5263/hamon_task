part of 'subject_cubit.dart';

@immutable
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}
class SubjectLoaded extends SubjectState {
  final List<SubjectModel> subjects;

  SubjectLoaded(this.subjects);
}
class SubjectLoading extends SubjectState {}
class SubjectError extends SubjectState {}

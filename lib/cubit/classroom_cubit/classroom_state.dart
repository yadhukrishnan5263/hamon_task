part of 'classroom_cubit.dart';

@immutable
abstract class ClassroomState {}

class ClassroomInitial extends ClassroomState {}
class ClassroomLoaded extends ClassroomState {
  final List<ClassRoomModel> classroom;

  ClassroomLoaded(this.classroom);
}
class ClassroomLoding extends ClassroomState {}
class ClassroomError extends ClassroomState {}

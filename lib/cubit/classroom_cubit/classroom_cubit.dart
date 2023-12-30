import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/classroom_model.dart';
import 'package:untitled/data/repo/classroom_repo.dart';

import '../../data/utils/loading.dart';
import '../student_cubit/student_cubit.dart';

part 'classroom_state.dart';

class ClassroomCubit extends Cubit<ClassroomState> {
  ClassroomCubit() : super(ClassroomInitial());
  final repo = ClassRoomRepo();
  getClassRooms(BuildContext context) {
    emit(ClassroomLoding());
    showLoading(context);
    try{
      repo.getClassRooms().then((value) {
        List data = value["classrooms"];
        List<ClassRoomModel> classrooms =
        data.map((e) => ClassRoomModel.fromJson(e)).toList();
        hideLoading(context);
        emit(ClassroomLoaded(classrooms));
      });
    }catch(e){
      hideLoading(context);
      emit(ClassroomError());
    }
  }
}

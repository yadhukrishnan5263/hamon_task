import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/classroom_model.dart';
import 'package:untitled/data/repo/classroom_repo.dart';
import 'package:untitled/data/utils/popup.dart';

import '../../data/utils/loading.dart';
import '../student_cubit/student_cubit.dart';

part 'classroom_state.dart';

class ClassroomCubit extends Cubit<ClassroomState> {
  ClassroomCubit() : super(ClassroomInitial());
  final repo = ClassRoomRepo();
  getClassRooms(BuildContext context) async {
    emit(ClassroomLoding());
    showLoading(context);
    try{
      await repo.getClassRooms().then((value) {
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
  assignSubject({required BuildContext context,required int id,required int subject}) async {
    showLoading(context);
try{
  await repo.assignSubject(id: id, subject: subject, context: context).then((value) async {
    hideLoading(context);
    showSuccess(context, "Subject assigned successfully");
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  });
}catch(e){
  hideLoading(context);
  showError(context, "Failed to assign subject");
}
  }
assignSudent({required BuildContext context,required int id,required int student}) async {
    showLoading(context);
    try{
      await repo.getClassroomByid(id: id, context: context).then((value) async {
        if(value["subject"]!=""){
          await repo.assignSutdent(student: student, subject: value["subject"], context: context).then((value) {
            showSuccess(context, "Student assigned successfully");
            hideLoading(context);
          });
        }else if(value["subject"]==""){
          showError(context, "Subject not assigned yet");
          hideLoading(context);
        }
      });
    }catch(e){
      hideLoading(context);
      showError(context, "Failed to assign student");
    }

}
}

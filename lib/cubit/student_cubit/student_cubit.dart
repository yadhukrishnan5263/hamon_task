import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/student_model.dart';
import 'package:untitled/data/utils/loading.dart';

import '../../data/repo/student_repo.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  final repo = StudentRepo();
  getStudents(BuildContext context) {
    emit(StudentDataLoading());
    showLoading(context);
    try{
      repo.getStudents().then((value) {
        List data = value["students"];
        List<StudentModel> students =
            data.map((e) => StudentModel.fromJson(e)).toList();
        hideLoading(context);
        emit(StudentDataLoaded(students));
      });
    }catch(e){
      hideLoading(context);
      emit(StudentDataError());
    }
  }
}

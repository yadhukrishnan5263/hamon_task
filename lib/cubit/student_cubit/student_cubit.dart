import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/student_model.dart';
import 'package:untitled/data/utils/loading.dart';
import 'package:untitled/data/utils/popup.dart';

import '../../data/repo/student_repo.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  final repo = StudentRepo();
  getStudents(BuildContext context) async {
    emit(StudentDataLoading());
    showLoading(context);
    try {
      await repo.getStudents(context: context).then((value) async {
        List data = value["students"];
        List<StudentModel> students =
            data.map((e) => StudentModel.fromJson(e)).toList();
        repo.checkAssigned(context: context).then((value) {
          if (value["registrations"] != []) {
            print("hhhh");
            List as_data = value["registrations"];
            print(as_data);
            for (int j = 0; j < as_data.length; j++) {
              for (int i = 0; i < students.length; i++) {
                if (students[i].id == as_data[j]["student"]) {
                  students[i].assigned = true;
                  students[i].reg_id=as_data[j]["id"];

                }
              }
            }
          }
        });
        hideLoading(context);
        emit(StudentDataLoaded(students));
      });
    } catch (e) {
      hideLoading(context);
      print(e);
      emit(StudentDataError());
    }
  }

  removeStudent({required BuildContext context, required int id}) async {
    showLoading(context);
    try {
      await repo.removeStudent(context: context, id: id).then((value) {
        showSuccess(context, "Student removed successfully");
        hideLoading(context);
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      hideLoading(context);
      showError(context, "somthing went rong");
    }
  }
}

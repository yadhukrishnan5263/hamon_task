import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/student_model.dart';
import 'package:untitled/data/repo/subject_repo.dart';

import '../../data/models/subject_model.dart';
import '../../data/utils/loading.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());
  final repo = SubjectRepo();
  getSubjects(BuildContext context) {
    emit(SubjectLoading());
    showLoading(context);
    try{
      repo.getSubject().then((value) {
        List data = value["subjects"];
        List<SubjectModel> subject =
        data.map((e) => SubjectModel.fromJson(e)).toList();
        hideLoading(context);
        emit(SubjectLoaded(subject));
      });
    }catch(e){
      hideLoading(context);
      emit(SubjectError());
    }
  }
}

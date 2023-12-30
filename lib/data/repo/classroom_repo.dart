import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/data/api/api.dart';

import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../utils/popup.dart';

class ClassRoomRepo {
  final api = API();
  Future getClassRooms() async {
    try {
      Response response = await api.sendRequest
          .get(
        ApiEndPoints.classrooms+"/?api_key=AAd5b",
        options: Options(

            contentType: 'multipart/form_data',
            headers: {"Connection": "keep-alive"}),
      )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (ex) {
      final errorMessage = ApiException.fromDioError(ex).toString();
      // showError(context, errorMessage);
      return Future.error(errorMessage);
    } catch (exception) {
      // showError(context, exception.toString());

      return Future.error(exception.toString());
    }
  }
  Future assignSubject({required int id,required int subject,required BuildContext context}) async {
    final FormData body = FormData.fromMap({
      "subject":subject,
    });
    try {
      Response response = await api.sendRequest.patch(ApiEndPoints.classrooms+"/$id?api_key=AAd5b",
          options: Options(contentType: 'multipart/form_data'), data: body);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (ex) {
      final errorMessage = ApiException.fromDioError(ex).toString();
      showError(context, errorMessage);
      return Future.error(errorMessage);
    } catch (exception) {
      showError(context, exception.toString());

      return Future.error(exception.toString());
    }
  }
  Future assignSutdent({required int student,required int subject,required BuildContext context}) async {
    final FormData body = FormData.fromMap({
      "student":student,
      "subject":subject,
    });
    try {
      Response response = await api.sendRequest.post(ApiEndPoints.registration+"/?api_key=AAd5b",
          options: Options(contentType: 'multipart/form_data'), data: body);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (ex) {
      final errorMessage = ApiException.fromDioError(ex).toString();
      showError(context, errorMessage);
      return Future.error(errorMessage);
    } catch (exception) {
      showError(context, exception.toString());

      return Future.error(exception.toString());
    }
  }
  Future getClassroomByid({required int id,required BuildContext context}) async {
    try {
      Response response = await api.sendRequest
          .get(
        ApiEndPoints.classrooms+"/$id?api_key=AAd5b",
        options: Options(

            contentType: 'multipart/form_data',
            headers: {"Connection": "keep-alive"}),
      )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (ex) {
      final errorMessage = ApiException.fromDioError(ex).toString();
      // showError(context, errorMessage);
      return Future.error(errorMessage);
    } catch (exception) {
      // showError(context, exception.toString());

      return Future.error(exception.toString());
    }
  }
}

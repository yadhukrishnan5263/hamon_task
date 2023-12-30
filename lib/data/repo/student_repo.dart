import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/data/api/api.dart';

import '../api/api_endpoints.dart';
import '../api/api_exceptions.dart';
import '../utils/popup.dart';

class StudentRepo {
  final api = API();
  Future getStudents({required BuildContext context}) async {
    try {
      Response response = await api.sendRequest
          .get(
            ApiEndPoints.students+"/?api_key=AAd5b",
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
  Future checkAssigned({required BuildContext context}) async {
    try {
      Response response = await api.sendRequest
          .get(
        ApiEndPoints.registration+"/?api_key=AAd5b",
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
       showError(context, errorMessage);
      return Future.error(errorMessage);
    } catch (exception) {
      showError(context, exception.toString());

      return Future.error(exception.toString());
    }
  }
  Future removeStudent({required int id,required BuildContext context}) async {
    try {
    Response response = await api.sendRequest
        .delete(
      ApiEndPoints.registration+"/$id?api_key=AAd5b",
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
    showError(context, errorMessage);
    return Future.error(errorMessage);
  } catch (exception) {
    showError(context, exception.toString());

    return Future.error(exception.toString());
  }
  }
}

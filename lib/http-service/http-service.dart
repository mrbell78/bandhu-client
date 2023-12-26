import 'dart:convert';
import 'dart:io';




import 'package:bondu/signup/model/user_login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../signup/model/signinup_response.dart';
import 'api_response.dart';



class HttpService {
  //late Dio _dio;
  var _dio;

  UserLoginModel? custommerLogin;
  getToken()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsinfo =await prefs.getString('logininfo');
    if(jsinfo!=null){
      Map<String,dynamic> data =  jsonDecode(jsinfo);
      custommerLogin = UserLoginModel.fromJson(data);
      print("customer login token ${custommerLogin?.data?.token}");
    }

  }
  Dio _getDio() {
    getToken();
    if (_dio == null) {
      _dio = new Dio();
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler,) async {

            options.headers = {

              "Accept": "application/json",
              "Authorization": "Bearer ${custommerLogin?.data?.token}",
            };

            followRedirects:false;
            return handler.next(options); //continue
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) async {
            return handler.next(response); // continue
          },
          onError: (DioError e, ErrorInterceptorHandler handler) async {
            return handler.next(e); //continue
          },
        ),
      );
      _dio.interceptors.add(LogInterceptor(responseBody: true));
    }

    return _dio;
  }

  Future<ApiResponse<Response>> getRequest(String route, {Map<String, String>? qp, String? token}) async {

    try {
      Response response = await _getDio().get(
        route,
        queryParameters: qp,
      );
      print("$route | $qp : $response");
      if (response.statusCode == 200) {
        return ApiResponse(httpCode: int.parse(response.statusCode.toString()), data: response, message: '');
      } else {
        return ApiResponse(
            httpCode: int.parse(response.statusCode.toString()), message: "Connection error. ${response.statusCode}", data:response.data);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response!.data);
        print(e.response!.statusCode);
        return ApiResponse(httpCode: int.parse(e.response!.statusCode.toString()), message: "${e.response!.statusMessage}", data: e.response!.data);
      } else {
        print(e.message);
        return ApiResponse(httpCode: -1, message: "Connection error. ${e.message}", data:e.response!.data);
      }
    }
  }



  Future<ApiResponse<Response>> postRequest(String route, {Map<String, dynamic>? data, String? jsonData, bool isFormData = false, Function(int sent, int total)? onProgress,String ?token}) async {
     // _getDio().options.headers= {"Content-Type":"multipart/form-data","accept":"*/*",};


    try {

//
      //String jsondata = jsonEncode(data);
     // print("the body data is ------------${jsondata}");
      print("request: $data");

      Response response = await _getDio().post(
        route,
        data: isFormData ? FormData.fromMap(data!) : (jsonData ?? jsonEncode(data)),
        onSendProgress: (int sent, int total) {
          print("onSendProgress $total $sent");
          if (onProgress != null) onProgress(sent, total);
        },
      );
      print("$route : $response");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(httpCode: int.parse(response.statusCode.toString()), data: response, message: '');
      } else {
        return ApiResponse(
            httpCode:int.parse( response.statusCode.toString()), message: "Connection error. ${response.statusCode}", data: response.data);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response!.data);
        print(e.response!.statusCode);
        return ApiResponse(httpCode: int.parse(e.response!.statusCode.toString()), message: "${e.response!.statusMessage}", data: e.response!.data);
      } else {
        print(e.message);
        return ApiResponse(httpCode: -1, message: "Connection error. ${e.message}", data: e.response!.data);
      }
    }
  }

  Future<ApiResponse<Response>> postRequesturlencoded(String route, {FormData? data, String? jsonData, bool isurlEncoded = false, Function(int sent, int total)? onProgress,String ? token}) async {
    try {

      print("my request body is ..${data}");

      _getDio().options.contentType=Headers.formUrlEncodedContentType;


      /* _getDio().options.headers= {"Content-Type":"application/json","Authorization":"Token ${ApiConst.WORKSPACETOKEN_LIVE}"};*/

      Response response = await _getDio().post(
        route,
        data: data,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        onSendProgress: (int sent, int total) {
          print("onSendProgress $total $sent");
          if (onProgress != null) onProgress(sent, total);
        },
      );
      print("$route : $response");

      if (response.statusCode == 200) {
        return ApiResponse(httpCode: int.parse(response.statusCode.toString()), data: response, message: '');
      } else {
        return ApiResponse(
            httpCode:int.parse( response.statusCode.toString()), message: "Connection error. ${response.statusCode}", data: response);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response!.data);
        print(e.response!.statusCode);
        return ApiResponse(httpCode: int.parse(e.response!.statusCode.toString()), message: "${e.response!.statusMessage}", data: e.response!.data);
      } else {
        print(e.message);
        return ApiResponse(httpCode: -1, message: "Connection error. ${e.message}", data: e.response!.data);
      }
    }
  }
  Future<ApiResponse<Response>> puttRequest(String route, {required Map<String, dynamic> data,String ? token}) async {

    _getDio().interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {

          options.headers = {
            "Accept": "application/json",
            "Authorization": "Bearer  $token",
          };

          return handler.next(options); //continue
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) async {
          return handler.next(response); // continue
        },
        onError: (DioError e, ErrorInterceptorHandler handler) async {
          return handler.next(e); //continue
        },
      ),
    );
    try {
      Response response = await _getDio().put(
        route,
        data: jsonEncode(data),
      );
      print("$route : $response");

      if (response.statusCode == 200) {
        return ApiResponse(httpCode: int.parse(response.statusCode.toString()), data: response, message: '');
      } else {
        return ApiResponse(
            httpCode: int.parse(response.statusCode.toString()), message: "Connection error. ${response.statusCode}", data: response.data);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response!.data);
        print(e.response!.statusCode);
        return ApiResponse(httpCode: int.parse(e.response!.statusCode.toString()), message: "${e.response!.statusMessage}", data: e.response!.data);
      } else {
        print(e.message);
        return ApiResponse(httpCode: -1, message: "Connection error. ${e.message}", data: e.response!.data);
      }
    }
  }

  Future<ApiResponse<Response>> deleteRequest(String route, {required Map<String, dynamic> data}) async {
    try {
      Response response = await _getDio().delete(
        route,
        queryParameters: data
      );
      print("$route : $response");

      if (response.statusCode == 200) {
        return ApiResponse(httpCode: int.parse(response.statusCode.toString()), data: response, message: '');
      } else {
        return ApiResponse(
            httpCode: int.parse(response.statusCode.toString()), message: "Connection error. ${response.statusCode}", data: response.data);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response!.data);
        print(e.response!.statusCode);
        return ApiResponse(httpCode: int.parse(e.response!.statusCode.toString()), message: "${e.response!.statusMessage}", data: e.response!.data);
      } else {
        print(e.message);
        return ApiResponse(httpCode: -1, message: "Connection error. ${e.message}", data: e.response!.data);
      }
    }
  }

  Future<ApiResponse<Response>> uploadImage(String route, FormData formData,{String ? token}) async {
    /*  _getDio().options.headers= {"Content-Type":"application/json","Authorization":"Token ${ApiConst.WORKSPACETOKEN_LIVE}"};*/


    try {
      Response response = await _getDio().post(
        route,
        data: formData,
      );
      print("$route : $response");

      if (response.statusCode == 200) {
        return ApiResponse(httpCode: int.parse(response.statusCode.toString()), data: response, message: '');
      } else {
        return ApiResponse(
            httpCode:int.parse( response.statusCode.toString()), message: "Connection error. ${response.statusCode}", data: response.data);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        print(e.response!.data);
        print(e.response!.statusCode);
        return ApiResponse(httpCode: int.parse(e.response!.statusCode.toString()), message: "${e.response!.statusMessage}", data: e.response!.data);
      } else {
        print(e.message);
        return ApiResponse(httpCode: -1, message: "Connection error. ${e.message}", data: e.response!.data);
      }
    }
  }

}
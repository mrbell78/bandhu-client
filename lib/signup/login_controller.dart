import 'dart:io';

import 'package:bondu/main_service/response_model/service_details_view_model.dart';
import 'package:bondu/main_service/response_model/service_details_view_model.dart' as sufixdetaisl;
import 'package:bondu/signup/model/user_login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../home/response_model/update_profile_model.dart';
import '../locator/locator.dart';
import '../login/model/registration_model.dart';
import '../main_service/response_model/service_list_model.dart';
import '../main_service/response_model/service_list_model.dart' as srlist;
import 'login_repository.dart';
import 'model/signinup_response.dart';

class CustommerLoginController extends ChangeNotifier{

  var _login_repo = locator<LoginRepository>();

  UserLoginModel ?custommerLogin;

  ServiceList? serviceList;
  List<srlist.Data>? svList =[];
  List<sufixdetaisl.Data>? serviceDetailsList =[];

  ServiceDetailsViewModel ? serviceDetailsViewModel;
  UpdateProfileModel? updateProfileModel;

  RegistrationModel? registrationModel;

  //RegistrationResponseData? registrationResponseData;

  Future<bool>  postLogin(String email,password)async{
    var apiresponse = await _login_repo.userLogin(email,password);
    if(apiresponse.httpCode==200){
      custommerLogin=apiresponse.data;

      return true;
    }else return false;
  }

  Future<bool>  postRegistration(String name,String email,password)async{
    var apiresponse = await _login_repo.userRegistration(name,email,password);
    if(apiresponse.httpCode==200){
      registrationModel=apiresponse.data;

      return true;
    }else return false;
  }
  // Future<bool>  logOut(String token)async{
  //   var apiresponse = await _login_repo.userLogout();
  //   print("api response is ........${apiresponse}");
  //   if(apiresponse){
  //     return true;
  //   }else return false;
  // }

  // Future<bool>  postRegistration(data)async{
  //   var apiresponse = await _login_repo.postRegistration(data);
  //   if(apiresponse.httpCode==200){
  //     // registrationResponseData=apiresponse.data;
  //     return true;
  //   }else return false;
  // }
  //
  // Future<bool> getUserData()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String loginData = (prefs.getString('logininfo') ?? "") ;
  //
  //   if(loginData!=null && loginData.isNotEmpty){
  //
  //     print("the data is ${loginData}");
  //
  //     Map<String,dynamic> mapdata= jsonDecode(loginData);
  //     custommerLogin  =CustommerLogin.fromJson(mapdata);
  //     notifyListeners();
  //     return true;
  //
  //   }else return false;
  //
  // }

  getServiceList()async{
    var apiresponse = await _login_repo.getServiceList();
    if(apiresponse.httpCode==200){
      serviceList = apiresponse.data;
      svList = serviceList?.data;

    }
    notifyListeners();
  }
  getServiceDetails(id)async{
    var apiresponse = await _login_repo.getServiceDetails(id);
    if(apiresponse.httpCode==200){
      serviceDetailsViewModel = apiresponse.data;
      serviceDetailsList = serviceDetailsViewModel?.data;
    }
    notifyListeners();
  }

  updateProfile( data,id) async {
    var apiresPonse = await _login_repo.updateProfile(data,id);
    if(apiresPonse.httpCode==200){
      return true;
    }else return false;
  }

  Future<bool> uploadImage( File? image,id) async {

    if(image!=null && image!.path.isNotEmpty){
      FormData formData = FormData.fromMap({
        "image_url": await MultipartFile.fromFile(
          image!.path,
          filename: "image.jpg",
        ),
      });

      var apiresPonse = await _login_repo.uploadImage(formData,id);

      if(apiresPonse.httpCode==200){
        updateProfileModel = apiresPonse.data;
        return true;
      }else return false;

    }else {
      EasyLoading.dismiss();
      return false;}

  }

  Future<bool>  logOut()async{
    var apiresponse = await _login_repo.userLogout();
    print("api response is ........${apiresponse}");
    if(apiresponse){
      return true;
    }else return false;
  }

}
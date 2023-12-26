import 'dart:convert';

import 'package:bondu/home/response_model/profile_model.dart';
import 'package:bondu/home/response_model/update_profile_model.dart';
import 'package:bondu/signup/model/user_login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator/locator.dart';
import '../signup/login_repository.dart';
import '../signup/model/signinup_response.dart';

class ProfileController extends ChangeNotifier{


  var _login_repo = locator<LoginRepository>();

  ProfileInfoModel? profileInfoModel;
  UserLoginModel? custommerLogin;
  UpdateProfileModel ? updateProfileModel;
  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data  = await prefs.getString('logininfo',);

    Map<String,dynamic> lgdata =jsonDecode(data!);
    custommerLogin = UserLoginModel.fromJson(lgdata);

    return custommerLogin?.data?.user?.id;

  }


   getProfileInfo(id)async{
    var apiresponse = await _login_repo.getProfileInfo(id.toString());

    if(apiresponse.httpCode==200){
      profileInfoModel = apiresponse.data;
      print("profile function called called ${profileInfoModel?.data?.id}");

    }
    notifyListeners();
  }

  Future<bool> updateProfile(data,id)async{
    var apiresponse = await _login_repo.updateProfile(data,id.toString());
    if(apiresponse.httpCode==200){
      updateProfileModel = apiresponse.data;
      return true;

    }else return false;

  }




   logOut()async{
     await _login_repo.userLogout();


  }


}
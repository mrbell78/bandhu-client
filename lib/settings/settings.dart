import 'dart:convert';

import 'package:bondu/home/profile.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../login/login.dart';
import '../signup/login_controller.dart';
import '../signup/model/signinup_response.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  Future<String> logout(String? id) async {
    var url = Uri.parse("http://web-bondhu.ekopii.com/api/logout");
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer ' + id!,
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
    });
    var data = jsonDecode(response.body);
    print("message: "+data["message"]);
    return data['message'];
  }

  CustommerLogin? custommerLogin;
  Future<bool> getUserData()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginData = (prefs.getString('logininfo') ?? "") ;

    if(loginData!=null && loginData.isNotEmpty){

      print("the data is ${loginData}");

      Map<String,dynamic> mapdata= jsonDecode(loginData);
      custommerLogin  =CustommerLogin.fromJson(mapdata);
      return true;

    }else return false;

  }

  showAlertDialog(BuildContext context,provider) {

    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Yes",style: TextStyle(color: Colors.red),),
      onPressed:  () async{

        provider.logOut().then((value) async {

          Fluttertoast.showToast(
              msg: "You are logged out",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              backgroundColor: Colors.red,
              fontSize: 16.0
          );
          Navigator.pop(context);
          NavUtils.pushReplacement(context, LoginWithyoutReg());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // Remove data for the 'counter' key.
          await prefs.remove('logininfo');

        });

      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("Logout"),
      content: Text("Would you like to Signout from the apps?"),
      actions: [
        remindButton,
        cancelButton,

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustommerLoginController>(builder: (_,provider,__){
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/icons/water_mark.png")),
                right: -110,
                top: -10,

              ),

              Positioned(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/icons/water_mark.png")),
                left: -110,
                top: -10,

              ),

              Positioned(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/icons/water_mark.png")),
                right: -110,
                top: MediaQuery.of(context).size.height/2-100,

              ),

              Positioned(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/icons/water_mark.png")),
                left: -110,
                top: MediaQuery.of(context).size.height/2-100,

              ),


              Positioned(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/icons/water_mark.png")),
                left: -110,
                top: MediaQuery.of(context).size.height/2+100,

              ),


              Positioned(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/icons/water_mark.png")),
                right: -110,
                top: MediaQuery.of(context).size.height/2+100,

              ),



              Positioned.fill(
                top: 110,
                child: Align(

                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      SizedBox(height: 20,),
                      Center(child: Image.asset("assets/icons/welcome_logo.png",height: 110,)),
                      SizedBox(height: 20,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Settings",style: TextStyle(color: AppColors.banOrange,fontSize: 16,fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),

                      SizedBox(height: 15,),

                      GestureDetector(
                        onTap: (){
                          NavUtils.push(context, ProfilePage());
                        },
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/2+90,
                            height: 35,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.banaProfileColor.withOpacity(0.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),

                            child:Center(
                              child: Text("Profile",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),

                              ),
                            ),
                          ),),
                      ),
                      SizedBox(height: 15,),


                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2+90,
                          height: 35,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.banSettingsBackgrund1,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],

                          ),

                          child:Center(
                            child: Text("Notification",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),

                            ),
                          ),
                        ),),
                      SizedBox(height: 15,),

                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2+90,
                          height: 35,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.banSettingsBackgrund2,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],

                          ),

                          child:Center(
                            child: Text("FAQ",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),

                            ),
                          ),
                        ),),
                      SizedBox(height: 15,),

                      Center(
                        child: GestureDetector(
                          onTap: ()async{
                          //  await provider.logOut();
                           // NavUtils.pushReplacement(context, screen)

                            setState(() {
                              showAlertDialog(context,provider);
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/2+90,
                            height: 35,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.banSettingsBackgrund3,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),

                            child:Center(
                              child: Text("Logout",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),

                              ),
                            ),
                          ),
                        ),),
                      SizedBox(height: 15,),



                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
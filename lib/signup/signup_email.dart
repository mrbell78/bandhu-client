import 'package:bondu/utils/app-colors.dart';
import 'package:flutter/material.dart';

class SignupWithEmail extends StatefulWidget {
  const SignupWithEmail({Key? key}) : super(key: key);

  @override
  _SignupWithEmailState createState() => _SignupWithEmailState();
}

class _SignupWithEmailState extends State<SignupWithEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                width: 150,
                height: 70,

                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Positioned(

                      child: Image.asset("assets/icons/water_mark.png"),
                      left: 0,
                      bottom: 0,
                      top: -10,

                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 150,
                height:70,

                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Positioned(

                      child: Image.asset("assets/icons/water_mark.png"),
                      right: 0,
                      bottom: 0,
                      top: -10,

                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height/2 + 250,
            child: ListView(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 20,),
                Center(child: Image.asset("assets/icons/welcome_logo.png",height: 110,)),



                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login With Email",style: TextStyle(color: AppColors.banOrange,fontSize: 16,fontWeight: FontWeight.w600),),

                  ],
                ),
                SizedBox(height: 10,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2+150,
                      height: 35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.bandarkGrey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),

                      child:  TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            hintText: 'Name',
                            contentPadding: EdgeInsets.only(bottom: 9,left: 10)
                        ),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2+150,
                      height: 35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.bandarkGrey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),

                      child:  TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.only(bottom: 9,left: 10)
                        ),
                      ),

                    ),
                  ],
                ),


                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2+150,
                      height: 35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.bandarkGrey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),

                      child:  TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            hintText: 'Gender',
                            contentPadding: EdgeInsets.only(bottom: 9,left: 10)
                        ),
                      ),

                    ),
                  ],
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2+150,
                      height: 35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.bandarkGrey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),

                      child:  TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            hintText: 'Email',
                            contentPadding: EdgeInsets.only(bottom: 9,left: 10)
                        ),
                      ),

                    ),
                  ],
                ),


                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2+150,
                      height: 35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.bandarkGrey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child:  TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: Image.asset("assets/icons/password.png"),
                            contentPadding: EdgeInsets.only(bottom: 9,left: 10)
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2+150,
                      height: 35,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColors.bandarkGrey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child:  TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            suffixIcon: Image.asset("assets/icons/password.png"),
                            contentPadding: EdgeInsets.only(bottom: 9,left: 10)
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),

                Container(
                  width: MediaQuery.of(context).size.width/2+150,
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                                height: 35,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: AppColors.banDarkOrange,),

                                child:Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),))

                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: AppColors.banDarkGreen,),
                              child:Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),))

                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("---------------",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w600),),
                    SizedBox(width: 15,),
                    Text("OR",style: TextStyle(color: AppColors.banblack,fontSize: 16,fontWeight: FontWeight.w600),),
                    SizedBox(width: 15,),
                    Text("---------------",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w600),),

                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign in With",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/ic-facebook.png"),
                    SizedBox(width: 15,),
                    Image.asset("assets/icons/ic-gp.png"),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              Container(
                width: 150,
                height: 70,

                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Positioned(

                      child: Image.asset("assets/icons/water_mark.png"),
                      left: 0,
                      bottom: -10,
                      top: 0,

                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 150,
                height: 70,

                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Positioned(

                      child: Image.asset("assets/icons/water_mark.png"),
                      right: 0,
                      bottom: -10,
                      top: 0,

                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';

import '../login/registration.dart';

class SigninWelcome extends StatefulWidget {
  const SigninWelcome({Key? key}) : super(key: key);

  @override
  _SigninWelcomeState createState() => _SigninWelcomeState();
}

class _SigninWelcomeState extends State<SigninWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(height: 20,),
          Center(child: Image.asset("assets/icons/welcome_logo.png",height: 110,)),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/ic-male.png"),
              SizedBox(width: 8,),
              Image.asset("assets/icons/ic-female.png"),
              SizedBox(width: 8,),
              Image.asset("assets/icons/ic-commongender.png"),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome To Bandhu",style: TextStyle(color: AppColors.banOrange,fontSize: 28,fontWeight: FontWeight.w600),),

            ],
          ),

          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("For Login",style: TextStyle(color: AppColors.banOrange,fontSize: 14,fontWeight: FontWeight.w500),),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  NavUtils.push(context, Registration());
                },
                child: Container(
                 width: MediaQuery.of(context).size.width/2+100,
                  height: 30,

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

                  child: Center(child: Text("Email",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),

                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2+100,
                height: 30,

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

                child: Center(child: Text("Phone Number",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),

              ),
            ],
          ),

          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2+100,
                height: 30,

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

                child: Center(child: Text("As Guest",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),

              ),
            ],
          ),

          SizedBox(height: 30,),


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

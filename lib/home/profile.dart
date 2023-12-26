
import 'package:bondu/home/profile_controller.dart';
import 'package:bondu/home/upload_profile_image.dart';
import 'package:bondu/signup/login_controller.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:provider/provider.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool isNameEdite =false;
  TextEditingController nameController = TextEditingController();

  bool isEmailEdite =false;
  TextEditingController emailController = TextEditingController();


  bool isPhoneEdite =false;
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    Provider.of<ProfileController>(context,listen: false).getUserId().then((value){
      print("the uessr id is ${value}");
      Provider.of<ProfileController>(context,listen: false).getProfileInfo(value);
    } );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (BuildContext context, provider,__) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Stack(
              children: [

                // Row(
                //   children: [
                //     Container(
                //       width: 150,
                //       height: 70,
                //
                //       child: Stack(
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         children: [
                //           Positioned(
                //
                //             child: Image.asset("assets/icons/water_mark.png"),
                //             left: 0,
                //             bottom: 0,
                //             top: -10,
                //
                //           ),
                //         ],
                //       ),
                //     ),
                //     Spacer(),
                //     Container(
                //       width: 150,
                //       height:70,
                //
                //       child: Stack(
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         children: [
                //           Positioned(
                //
                //             child: Image.asset("assets/icons/water_mark.png"),
                //             right: 0,
                //             bottom: 0,
                //             top: -10,
                //
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),

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
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius:BorderRadius.all(Radius.circular(100)),
                                      color: Colors.red
                                  ),

                                  child: Center(

                                      child: provider.profileInfoModel?.data?.imageUrl!=null &&
                                          provider.profileInfoModel?.data?.imageUrl!=""?ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(50)),
                                          child: Image.network(provider.profileInfoModel?.data?.imageUrl!,fit: BoxFit.cover,)):Image.asset("assets/icons/ic-default-profilepic.png",fit: BoxFit.cover,)),
                                ),
                                Positioned(
                                  right: -13,
                                  top: 70,
                                  child: GestureDetector(
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return  ProfileImageUpload(profileInfoModel: provider.profileInfoModel!,);
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.all(Radius.circular(100)),
                                          color: AppColors.banmidGray
                                      ),
                                      child: Center(child: Image.asset("assets/icons/ic-edit.png")),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 20,),


                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/2+90,
                            height: 35,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.banLightYellow,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),

                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: AppColors.bandarkGrey,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.3),
                                      //     spreadRadius: 2,
                                      //     blurRadius: 2,
                                      //     offset: Offset(0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                    ),
                                    child: Center(child: Text("Name",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
                                  ),
                                ),
                                // Expanded(
                                //   flex: 5,
                                //   child: Container(
                                //     height: 35,
                                //     child: TextField(
                                //       textAlignVertical: TextAlignVertical.center,
                                //       style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                                //       decoration: InputDecoration(
                                //           hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                                //           border: InputBorder.none,
                                //           suffixIcon: Image.asset("assets/icons/ic-edit-withcontainer.png"),
                                //           contentPadding: EdgeInsets.only(bottom: 10,left: 10)
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                isNameEdite==false?  Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Container(
                                        child: Text("${provider.profileInfoModel?.data?.name!=null?provider.profileInfoModel?.data?.name:''}", style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                                      ),

                                      Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isNameEdite=true;
                                              nameController.text=provider.profileInfoModel?.data?.name??"";
                                            });
                                          },
                                          child: Image.asset("assets/icons/ic-edit-withcontainer.png",height: 30,width: 30,fit: BoxFit.cover,)),
                                      SizedBox(width: 8,),
                                    ],
                                  ),
                                ):
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Container(
                                        width: MediaQuery.of(context).size.width/2-100,
                                        child: TextField(
                                          controller: nameController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(bottom: 8)
                                          ),
                                        ),
                                      ),

                                      Spacer(),
                                      GestureDetector(
                                          onTap: () async {
                                            EasyLoading.show(status: "updating..");
                                            setState(()  {
                                              isNameEdite  = false;


                                            });
                                            var data = {
                                              "name":nameController.text.trim(),
                                              "phone":provider.profileInfoModel?.data?.phone,
                                              "gender":provider.profileInfoModel?.data?.gender,
                                              "email":provider.profileInfoModel?.data?.email,
                                              "role":provider.profileInfoModel?.data?.role,
                                              "image_url":provider.profileInfoModel?.data?.imageUrl,
                                            };

                                            await  Provider.of<ProfileController>(context,listen: false).getUserId().then((value) async {
                                              print("the uessr id is ${value}");
                                              await provider.updateProfile(data, value).then((v) {
                                                if(value==true){
                                                  provider.getProfileInfo(value);
                                                  EasyLoading.dismiss();
                                                }
                                                EasyLoading.dismiss();
                                              });
                                            } );

                                          },
                                          child: Image.asset("assets/images/refresh.png",height: 30,width: 30,fit: BoxFit.cover,)),
                                      SizedBox(width: 8,),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                        SizedBox(height: 15,),


                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/2+90,
                            height:35,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.banLightYellow,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),

                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: AppColors.bandarkGrey,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.3),
                                      //     spreadRadius: 2,
                                      //     blurRadius: 2,
                                      //     offset: Offset(0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                    ),
                                    child: Center(child: Text("Gender",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child:  DropdownButtonFormField(
                                    value: provider.profileInfoModel?.data?.gender,
                                    decoration: InputDecoration.collapsed(hintText: ''),
                                    padding: EdgeInsets.only(left: 10),

                                    hint:  Text('Select Gender',style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                                    items:  [
                                      DropdownMenuItem(
                                        child: Text('Male',style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                                        value: 'male',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Female',style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                                        value: 'female',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Other',style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                                        value: 'other',
                                      ),
                                    ],
                                    onChanged: (value) {
                                      EasyLoading.show(status: "updating..");
                                      setState(() async {
                                        var data = {
                                          "name":provider.profileInfoModel?.data?.name,
                                          "phone":provider.profileInfoModel?.data?.phone,
                                          "gender":value.toString(),
                                          "email":provider.profileInfoModel?.data?.email,
                                          "role":provider.profileInfoModel?.data?.role,
                                          "image_url":provider.profileInfoModel?.data?.imageUrl,
                                        };



                                        // await provider.updateProfile(data, provider.profileInfoModel?.id).then((value) {
                                        //   if(value==true){
                                        //     provider.getProfileInfo(provider.profileInfoModel?.id);
                                        //     EasyLoading.dismiss();
                                        //   }
                                        // });


                                        await  Provider.of<ProfileController>(context,listen: false).getUserId().then((value) async {
                                          print("the uessr id is ${value}");
                                          await provider.updateProfile(data, value).then((v) {
                                            if(value==true){
                                              provider.getProfileInfo(value);
                                              EasyLoading.dismiss();
                                            }
                                            EasyLoading.dismiss();
                                          });
                                        } );
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                        // SizedBox(height: 15,),
                        //
                        // Center(
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width/2+90,
                        //     height: 35,
                        //     margin: EdgeInsets.only(left: 20,right: 20),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(15)),
                        //       color: AppColors.banLightYellow,
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.grey.withOpacity(0.3),
                        //           spreadRadius: 2,
                        //           blurRadius: 2,
                        //           offset: Offset(0, 3), // changes position of shadow
                        //         ),
                        //       ],
                        //
                        //     ),
                        //
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           flex: 2,
                        //           child: Container(
                        //             height: 35,
                        //             padding: EdgeInsets.all(5),
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.all(Radius.circular(15)),
                        //               color: AppColors.bandarkGrey,
                        //               // boxShadow: [
                        //               //   BoxShadow(
                        //               //     color: Colors.grey.withOpacity(0.3),
                        //               //     spreadRadius: 2,
                        //               //     blurRadius: 2,
                        //               //     offset: Offset(0, 3), // changes position of shadow
                        //               //   ),
                        //               // ],
                        //             ),
                        //             child: Center(child: Text("Password",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
                        //           ),
                        //         ),
                        //         Expanded(
                        //           flex: 5,
                        //           child: Row(
                        //             children: [
                        //               SizedBox(width: 8,),
                        //               Container(
                        //                 child: Text("${provider.profileInfoModel?.!=null?provider.profileInfoModel?.password:""}", style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                        //               ),
                        //
                        //               Spacer(),
                        //               Image.asset("assets/icons/ic-edit-withcontainer.png",height: 30,width: 30,fit: BoxFit.cover,),
                        //               SizedBox(width: 8,),
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //
                        //   ),
                        // ),
                        SizedBox(height: 15,),


                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/2+90,
                            height: 35,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.banLightYellow,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),

                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: AppColors.bandarkGrey,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.3),
                                      //     spreadRadius: 2,
                                      //     blurRadius: 2,
                                      //     offset: Offset(0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                    ),
                                    child: Center(child: Text("Email",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
                                  ),
                                ),
                                isEmailEdite==false?  Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Container(
                                        child: Text("${provider.profileInfoModel?.data?.email!=null?provider.profileInfoModel?.data?.email:""}", style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),overflow: TextOverflow.clip,),
                                      ),

                                      Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isEmailEdite=true;
                                              emailController.text=(provider.profileInfoModel!.data?.email!=null?provider.profileInfoModel!.data?.email:"")!;
                                            });
                                          },
                                          child: Image.asset("assets/icons/ic-edit-withcontainer.png",height: 30,width: 30,fit: BoxFit.cover,)),
                                      SizedBox(width: 8,),
                                    ],
                                  ),
                                ):
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Container(
                                        width: MediaQuery.of(context).size.width/2-100,
                                        child: TextField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(bottom: 8)
                                          ),
                                        ),
                                      ),

                                      Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            EasyLoading.show(status: "updating..");
                                            setState(() async {

                                              var data = {
                                                "name":provider.profileInfoModel?.data?.name,
                                                "phone":provider.profileInfoModel?.data?.phone,
                                                "gender":provider.profileInfoModel?.data?.gender,
                                                "email":emailController.text.trim(),
                                                "role":provider.profileInfoModel?.data?.role,
                                                "image_url":provider.profileInfoModel?.data?.imageUrl,
                                              };

                                              await  Provider.of<ProfileController>(context,listen: false).getUserId().then((value) async {
                                                print("the uessr id is ${value}");
                                                await provider.updateProfile(data, value).then((v) {
                                                  setState(() {
                                                    isEmailEdite=false;
                                                  });
                                                  if(value==true){
                                                    provider.getProfileInfo(value);
                                                    EasyLoading.dismiss();
                                                  }
                                                  EasyLoading.dismiss();
                                                });
                                              } );
                                            });
                                          },
                                          child: Image.asset("assets/images/refresh.png",height: 30,width: 30,fit: BoxFit.cover,)),
                                      SizedBox(width: 8,),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                        SizedBox(height: 15,),


                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/2+90,
                            height: 35,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.banLightYellow,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),

                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 35,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: AppColors.bandarkGrey,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.3),
                                      //     spreadRadius: 2,
                                      //     blurRadius: 2,
                                      //     offset: Offset(0, 3), // changes position of shadow
                                      //   ),
                                      // ],
                                    ),
                                    child: Center(child: Text("Phone",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
                                  ),
                                ),
                                // Expanded(
                                //   flex: 5,
                                //   child: Container(
                                //     height: 35,
                                //     child: TextField(
                                //       textAlignVertical: TextAlignVertical.center,
                                //       style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                                //       decoration: InputDecoration(
                                //           hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                                //           border: InputBorder.none,
                                //           suffixIcon: Image.asset("assets/icons/ic-edit-withcontainer.png"),
                                //           contentPadding: EdgeInsets.only(bottom: 10,left: 10)
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                isPhoneEdite==false? Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Container(
                                        child: Text("${provider.profileInfoModel?.data?.phone!=null?provider.profileInfoModel?.data?.phone:""}", style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                                      ),

                                      Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isPhoneEdite=true;
                                              phoneController.text=provider.profileInfoModel!.data!.phone!=null?provider.profileInfoModel!.data!.phone!:"";
                                            });
                                          },
                                          child: Image.asset("assets/icons/ic-edit-withcontainer.png",height: 30,width: 30,fit: BoxFit.cover,)),
                                      SizedBox(width: 8,),
                                    ],
                                  ),
                                ):
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8,),
                                      Container(
                                        width: MediaQuery.of(context).size.width/2-100,
                                        child: TextField(
                                          controller: phoneController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(bottom: 8)
                                          ),
                                        ),
                                      ),

                                      Spacer(),
                                      GestureDetector(
                                          onTap: (){
                                            EasyLoading.show(status: "updating..");
                                            setState(() async {

                                              var data = {
                                                "name":provider.profileInfoModel?.data?.name,
                                                "phone":phoneController.text,
                                                "gender":provider.profileInfoModel?.data?.gender,
                                                "email":provider.profileInfoModel?.data?.email,
                                                "role":provider.profileInfoModel?.data?.role,
                                                "image_url":provider.profileInfoModel?.data?.imageUrl,
                                              };

                                              await  Provider.of<ProfileController>(context,listen: false).getUserId().then((value) async {
                                                print("the uessr id is ${value}");
                                                await provider.updateProfile(data, value).then((v) {
                                                  setState(() {
                                                    isPhoneEdite=false;
                                                  });
                                                  if(value==true){


                                                    provider.getProfileInfo(value);


                                                    EasyLoading.dismiss();
                                                  }
                                                  EasyLoading.dismiss();
                                                });
                                              } );
                                            });
                                          },
                                          child: Image.asset("assets/images/refresh.png",height: 30,width: 30,fit: BoxFit.cover,)),
                                      SizedBox(width: 8,),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                        SizedBox(height: 15,),


                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
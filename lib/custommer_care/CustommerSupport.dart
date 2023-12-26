import 'package:bondu/utils/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustommerSupport extends StatefulWidget {
  const CustommerSupport({Key? key}) : super(key: key);

  @override
  _CustommerSupportState createState() => _CustommerSupportState();
}

class _CustommerSupportState extends State<CustommerSupport> {

  showAlertDialog(BuildContext context,String number)  {

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
        launch("tel://$number");

      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("User Confirmation"),
      content: Text("Would you like to call this $number number?"),
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
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                       child: Text("emergency helpline numbers",style: TextStyle(color: AppColors.banOrange,fontSize: 16,fontWeight: FontWeight.w600),),
                     )
                   ],
                 ),

                    SizedBox(height: 15,),


                    GestureDetector(
                      onTap: (){

                        showAlertDialog(context,"01719530135");
                      },
                      child: Center(
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
                              Container(
                                height: 35,
                                width: 140,
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical:7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: AppColors.banSettingsBackgrund2.withOpacity(0.5),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.3),
                                  //     spreadRadius: 2,
                                  //     blurRadius: 2,
                                  //     offset: Offset(0, 3), // changes position of shadow
                                  //   ),
                                  // ],
                                ),
                                child: Center(child: Text("Doctors (NCD)",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
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

                              Spacer(),
                              Container(
                                child: Text("01719 530135", style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                              ),
                              SizedBox(width: 15,)
                            ],
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 15,),


                    Center(
                      child: GestureDetector(
                        onTap: (){
                         // launch("tel://01714048418");
                          showAlertDialog(context,"01771444666");
                        },
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
                              Container(
                                height: 35,
                                width: 140,
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical:7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: AppColors.banLightCyne.withOpacity(0.5),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.3),
                                  //     spreadRadius: 2,
                                  //     blurRadius: 2,
                                  //     offset: Offset(0, 3), // changes position of shadow
                                  //   ),
                                  // ],
                                ),
                                child: Center(child: Text("Ain-Alap (Legal Support)",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
                              ),
                              Spacer(),
                              Container(
                                child: Text("01771444666", style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                              ),
                              SizedBox(width: 15,)
                            ],
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    Center(
                      child: GestureDetector(
                        onTap: (){
                        //  launch("tel://01771444666");
                          showAlertDialog(context,"01714 048418");
                        },
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
                              Container(
                                height: 35,
                                width: 140,
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical:7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: AppColors.banSettingsBackgrund1.withOpacity(0.5),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.3),
                                  //     spreadRadius: 2,
                                  //     blurRadius: 2,
                                  //     offset: Offset(0, 3), // changes position of shadow
                                  //   ),
                                  // ],
                                ),
                                child: Center(child: Text("Porichoy (Mental Health)",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),)),
                              ),
                              Spacer(),
                              Container(
                                child: Text("01714 048418", style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),),
                              ),
                              SizedBox(width: 15,)
                            ],
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(height: 15,),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


}
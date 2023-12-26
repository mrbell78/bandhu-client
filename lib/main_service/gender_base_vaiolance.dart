import 'package:bondu/signup/login_controller.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../chat/chat_with_bandhu.dart';
import '../custommer_care/CustommerSupport.dart';

class GenderBaseVaiolance extends StatefulWidget {
  final id;
  final serviceName;

  const GenderBaseVaiolance({Key? key, this.id,this.serviceName}) : super(key: key);

  @override
  _GenderBaseVaiolanceState createState() => _GenderBaseVaiolanceState();
}

class _GenderBaseVaiolanceState extends State<GenderBaseVaiolance> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("sms"),
      onPressed: () {
        NavUtils.push(context, ChatWithBandhu());
      },
    );
    Widget call = TextButton(
      child: Text(
        "Call",
        style: TextStyle(),
      ),
      onPressed: () async {
        NavUtils.push(context, CustommerSupport());
      },
    );

    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () async {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Service Provider"),
      content: Text(
          "If you want to know more, Please keep in touch through message or call"),
      actions: [cancelButton, remindButton, call],
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
  void initState() {
    // TODO: implement initState
    Provider.of<CustommerLoginController>(context, listen: false)
        .getServiceDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustommerLoginController>(
      builder: (BuildContext context, provider, __) {
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
                  top: MediaQuery.of(context).size.height / 2 - 100,
                ),
                Positioned(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/icons/water_mark.png")),
                  left: -110,
                  top: MediaQuery.of(context).size.height / 2 - 100,
                ),
                Positioned(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/icons/water_mark.png")),
                  left: -110,
                  top: MediaQuery.of(context).size.height / 2 + 100,
                ),
                Positioned(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/icons/water_mark.png")),
                  right: -110,
                  top: MediaQuery.of(context).size.height / 2 + 100,
                ),
                Positioned.fill(
                  top: 110,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Image.asset(
                          "assets/icons/welcome_logo.png",
                          height: 110,
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "${widget.serviceName}",
                                style: TextStyle(
                                    color: AppColors.pureBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: provider.serviceDetailsList!.length>0?ListView.builder(
                            itemCount: provider.serviceDetailsList!.length > 0
                                ? provider.serviceDetailsList?.length
                                : 0,
                            itemBuilder: (context, index) {
                              String? x =
                                  provider.serviceDetailsList?[index].colorCode;

                              print(
                                  "the color code is ------${x?.replaceAll('"', '')}");

                              return Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        showAlertDialog(context);
                                      },
                                      child: ConstrainedBox(
                                        constraints: new BoxConstraints(
                                          minHeight: 150.0,
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          width:
                                              MediaQuery.of(context).size.width,

                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18)),
                                              color: index % 2 == 0
                                                  ? AppColors.banLightCyne
                                                  : AppColors
                                                      .banSettingsBackgrund2 // getColor(provider.serviceDetailsList![index].colorCode!),
                                              ),

                                          child: Center(child: Text("${provider.serviceDetailsList?[index].description}")),
                                        ),
                                      )),
                                  SizedBox(height: 15,),
                                ],
                              );
                            },
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            // children: [
                            //   GestureDetector(
                            //       onTap:(){
                            //         showAlertDialog(context);
                            //       },
                            //       child: Container(
                            //           margin: EdgeInsets.only(left: 10,right: 10),
                            //           child: Image.asset("assets/images/ic-w-img1.png",fit: BoxFit.cover,))),
                            //   GestureDetector(
                            //       onTap:(){
                            //         showAlertDialog(context);
                            //       },
                            //       child: Container(
                            //           margin: EdgeInsets.only(left: 10,right: 10),
                            //           child: Image.asset("assets/images/ic-w-img2.png",fit: BoxFit.cover,))),
                            //   GestureDetector(
                            //       onTap:(){
                            //         showAlertDialog(context);
                            //       },
                            //       child: Container(
                            //           margin: EdgeInsets.only(left: 10,right: 10),
                            //           child: Image.asset("assets/images/ic-w-img3.png",fit: BoxFit.cover,))),
                            //   GestureDetector(
                            //       onTap:(){
                            //         showAlertDialog(context);
                            //       },
                            //       child: Container(
                            //           margin: EdgeInsets.only(left: 10,right: 10),
                            //           child: Image.asset("assets/images/ic-w-img4.png",fit: BoxFit.cover,))),
                            //   SizedBox(height: 50,)
                            // ],
                          ):Center(child: Text("No service avialable now ")),
                        ),
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

  getColor(String colorCode) {
    if (colorCode != null) {
      var cl = colorCode.replaceAll('"', '');
      print("the color value " + cl);

      return cl;
    } else {
      return AppColors.banDarkOrange;
    }
  }
}

import 'package:bondu/home/profile.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:flutter/material.dart';

import '../chat/chat_with_bandhu.dart';
import '../custommer_care/CustommerSupport.dart';
import '../main_service/Service.dart';
import '../settings/settings.dart';

class NavigationRoot extends StatefulWidget {
  const NavigationRoot({Key? key}) : super(key: key);

  @override
  _NavigationRootState createState() => _NavigationRootState();
}

class _NavigationRootState extends State<NavigationRoot> {
  int pageIndex = 0;

  final pages = [
   const Center(child:  Services()),
   const Center(child:  CustommerSupport()),
   const Center(child:  ChatWithBandhu()),
   const Center(child:  Settings()),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
         // color: AppColors.banmidGray,
          boxShadow: [
            BoxShadow(
             color: Colors.grey.withOpacity(0.4), // Shadow position
             // color:AppColors.banmidGray,
            ),
             BoxShadow(
              color:AppColors.banmidGray,
              // color: Colors.grey,
              spreadRadius: -0.90,
              blurRadius: 2.0,

            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                print("button is clicked");
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? Image.asset("assets/icons/ic-home-active.png",)
                  : Image.asset("assets/icons/ic-home.png",)
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ?  Image.asset("assets/icons/ic-selected-call.png",height: 40,width: 40,fit: BoxFit.fill,)
                  : Image.asset("assets/icons/ic-call.png",height: 40,width: 40,fit: BoxFit.fill,)
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? Image.asset("assets/icons/ic-selected-message.png",)
                  :  Image.asset("assets/icons/ic-message.png",),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? Image.asset("assets/icons/ic-selected-settings.png",)
                  : Image.asset("assets/icons/ic-settings.png",),
            ),
          ],
        ),
      ),

      body: pages[pageIndex],
    );
  }
}


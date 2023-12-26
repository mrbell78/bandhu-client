// import 'dart:convert';
//
// import 'package:bondu/utils/app-colors.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// import '../signup/model/signinup_response.dart';
// import 'chat_controller.dart';
// import 'model/message_model.dart';
// class SampleChat extends StatefulWidget {
//   final id;
//   final fromUserDetals;
//   const SampleChat({Key? key,this.id,this.fromUserDetals}) : super(key: key);
//
//   @override
//   _SampleChatState createState() => _SampleChatState();
// }
//
// class _SampleChatState extends State<SampleChat> {
//
//   late IO.Socket _socket;
//   TextEditingController messageController = TextEditingController();
//   String userName ='';
//
//   // final IO.Socket socket = IO.io('http://192.168.8.26:3000',IO.OptionBuilder().setTransports(['websocket']).setQuery({"username":"rubel"}).build());
//
//
//   // for the mass user side
//
//   // _sendMessage() {
//   //   _socket.emit('single_chat_message', {
//   //     'message': messageController.text.trim(),
//   //     'sender': userName
//   //   });
//   //   messageController.clear();
//   // }
//
//   _sendMessage() {
//     _socket.emit('connection', {
//       'message': messageController.text.trim(),
//       'sender': userName
//     });
//     messageController.clear();
//   }
//
//   // _connectSocket() {
//   //   _socket.onConnect((data) => print('Connection established'));
//   //   _socket.onConnectError((data) => print('Connect Error: $data'));
//   //   _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
//   //   _socket.on(
//   //     'message_from_server',
//   //         (data) => Provider.of<ChatController>(context, listen: false).addNewMessage(
//   //       Message.fromJson(data),
//   //     ),
//   //   );
//   // }
//
//
//   // for Bhanddu admin side
//   _connectSocketReceiveEnd() {
//     // _socket.onConnect((data) => print('Connection established'));
//     // _socket.onConnectError((data) => print('Connect Error: $data'));
//     // _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
//     _socket.on(
//       'connection',
//           (data) => Provider.of<ChatController>(context, listen: false).addNewMessage(
//         Message.fromJson(data),
//       ),
//     );
//   }
//
//   _connectSocket() {
//     _socket.onConnect((data) => print('Connection established'));
//     _socket.onConnectError((data) => print('Connect Error: $data'));
//     _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
//     _socket.on(
//       'connection',
//           (data) => Provider.of<ChatController>(context, listen: false).addNewMessage(
//         Message.fromJson(data),
//       ),
//     );
//   }
//
//   // CustommerLogin? custommerLogin;
//   // Future<bool> getUserData()async{
//   //
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String loginData = (prefs.getString('logininfo') ?? "") ;
//   //
//   //   if(loginData!=null && loginData.isNotEmpty){
//   //
//   //     print("the data is ${loginData}");
//   //
//   //     Map<String,dynamic> mapdata= jsonDecode(loginData);
//   //     custommerLogin  =CustommerLogin.fromJson(mapdata);
//   //     return true;
//   //
//   //   }else return false;
//   //
//   // }
//
//
//   @override
//   void dispose() {
//     _socket.dispose();
//     messageController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   void initState() {
//     _socket = IO.io(
//       'http://192.168.0.103:4000',
//       IO.OptionBuilder().setTransports(['websockets']).disableAutoConnect().setExtraHeaders({'Connection': 'upgrade', 'Upgrade': 'websocket'}) .setQuery(
//           {'username': "testUsr"}).build(), );
//
//
//     _connectSocket();
//
//     //socket.on('message_from_server',(data)=>print(data));
//     // setState(() {
//     //   messageController.clear();
//     // });
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatController>(
//       builder: (BuildContext context, provider,__) {
//         return Scaffold(
//           resizeToAvoidBottomInset: true,
//           body: Container(
//             child: Stack(
//               children: [
//                 Positioned(
//                   child: Container(
//                       width: 200,
//                       height: 200,
//                       child: Image.asset("assets/icons/water_mark.png")),
//                   right: -110,
//                   top: -10,
//
//                 ),
//
//                 Positioned(
//                   child: Container(
//                       width: 200,
//                       height: 200,
//                       child: Image.asset("assets/icons/water_mark.png")),
//                   left: -110,
//                   top: -10,
//
//                 ),
//
//                 Positioned(
//                   child: Container(
//                       width: 200,
//                       height: 200,
//                       child: Image.asset("assets/icons/water_mark.png")),
//                   right: -110,
//                   top: MediaQuery.of(context).size.height/2-100,
//
//                 ),
//
//                 Positioned(
//                   child: Container(
//                       width: 200,
//                       height: 200,
//                       child: Image.asset("assets/icons/water_mark.png")),
//                   left: -110,
//                   top: MediaQuery.of(context).size.height/2-100,
//
//                 ),
//
//                 Positioned(
//                   child: Container(
//                       width: 200,
//                       height: 200,
//                       child: Image.asset("assets/icons/water_mark.png")),
//                   left: -110,
//                   top: MediaQuery.of(context).size.height/2+100,
//
//                 ),
//                 Positioned(
//                   child: Container(
//                       width: 200,
//                       height: 200,
//                       child: Image.asset("assets/icons/water_mark.png")),
//                   right: -110,
//                   top: MediaQuery.of(context).size.height/2+100,
//
//                 ),
//                 Positioned.fill(
//                   top: 110,
//
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20,),
//                         Center(child: Image.asset("assets/icons/welcome_logo.png",height: 110,)),
//                         SizedBox(height: 20,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               child: Text("Chat With Bandhu",style: TextStyle(color: AppColors.banOrange,fontSize: 16,fontWeight: FontWeight.w600),),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 20,),
//                         Expanded(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
//                                 color:AppColors.banchatBackground.withOpacity(0.5)
//                             ),
//                             child: Column(
//                               children: [
//                                 // Expanded(
//                                 //   child: Consumer<ChatController>(
//                                 //     builder: (_,provider,__){
//                                 //       return ListView.separated(
//                                 //         reverse: true,
//                                 //         itemBuilder: (context,index){
//                                 //           final message = provider.incommingMessage[index];
//                                 //           print("send user is ........${message.message}");
//                                 //           return Column(
//                                 //             crossAxisAlignment: message.id == custommerLogin!.data!.id?
//                                 //             CrossAxisAlignment.end:
//                                 //             CrossAxisAlignment.start,
//                                 //             children: [
//                                 //               Wrap(
//                                 //                 alignment: message.toUserDetails?.id == custommerLogin!.data!.id
//                                 //                     ? WrapAlignment.end
//                                 //                     : WrapAlignment.start,
//                                 //                 children: [
//                                 //                   Container(
//                                 //                     decoration: BoxDecoration(
//                                 //                         color: message.toUserDetails?.id == custommerLogin!.data!.id
//                                 //                             ? Theme.of(context).primaryColorLight
//                                 //                             : Colors.white,
//                                 //                         borderRadius: BorderRadius.all(Radius.circular(10))
//                                 //                     ),
//                                 //                     margin: message.toUserDetails?.id == custommerLogin!.data!.id?
//                                 //                     EdgeInsets.only(right:5):
//                                 //                     EdgeInsets.only(left:5),
//                                 //                     padding:EdgeInsets.all(5),
//                                 //                     child: Column(
//                                 //                       mainAxisSize: MainAxisSize.min,
//                                 //                       crossAxisAlignment:
//                                 //                       message.toUserDetails?.id == custommerLogin!.data!.id
//                                 //                           ? CrossAxisAlignment.end
//                                 //                           : CrossAxisAlignment.start,
//                                 //                       children: [
//                                 //                         Text("${message.toUserDetails!.name}"),
//                                 //                         // Text(
//                                 //                         //   DateFormat('hh:mm a').format(message.sentAt),
//                                 //                         //   style: Theme.of(context).textTheme.caption,
//                                 //                         // ),
//                                 //                       ],
//                                 //                     ),
//                                 //
//                                 //                   ),
//                                 //                 ],
//                                 //               ),
//                                 //               SizedBox(height: 20,),
//                                 //             ],
//                                 //           );
//                                 //         },
//                                 //         separatorBuilder: (_, index) => const SizedBox(
//                                 //           height:10,
//                                 //         ),
//                                 //         itemCount: provider.messages.length,);
//                                 //     },
//                                 //   ),
//                                 // ),
//
//                                 Container(
//                                   margin: EdgeInsets.only(left: 10,right: 10),
//                                   width: MediaQuery.of(context).size.width,
//                                   height: 45,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                                     color: Colors.white,
//
//                                   ),
//                                   child: TextField(
//                                     controller: messageController,
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: "Type message",
//                                         hintStyle: TextStyle(color: AppColors.banblack.withOpacity(0.5),fontSize: 12,),
//                                         prefixIcon: Image.asset("assets/icons/ic-emuj.png"),
//                                         suffixIcon: IconButton(onPressed: () async {
//
//                                           //  print("the text is ${controller.text}");
//                                           //   socket.emit('single_chat_message',{
//                                           //     'message':messageController.text.trim(),
//                                           //     "sender":"rubel"
//                                           //   });
//
//                                           // _sendMessage();
//                                           // if(messageController.text.isNotEmpty){
//                                           //   var data = {
//                                           //     "to_user":"54",
//                                           //     "message":messageController.text.trim(),
//                                           //   };
//                                           //  await provider.sentMessage(data).then((value) {
//                                           //    messageController.clear();
//                                           //  });
//                                           // }
//
//                                           _sendMessage();
//                                         }, icon: Image.asset("assets/icons/ic-message-sent.png"),),
//
//                                         contentPadding: EdgeInsets.only(bottom: 1,top: 8)
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: 10,),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//
//
//
//
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<String?>getStringValuesSF() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? stringValue = prefs.getString('nameKey');
//     return stringValue;
//   }
// }
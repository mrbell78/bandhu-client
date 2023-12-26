
import 'package:bondu/chat/chat_repository.dart';
import 'package:bondu/chat/model_restcall/create_inbox.dart';
import 'package:bondu/chat/model_restcall/message_byinbox.dart';
import 'package:bondu/chat/model_restcall/message_byinbox.dart' as msg;
import 'package:bondu/chat/model_restcall/message_inboxlist_model.dart';
import 'package:bondu/chat/model_restcall/send_message_model.dart';
import 'package:flutter/foundation.dart';

import '../../locator/locator.dart';
import '../../signup/login_repository.dart';
import 'model/incomming_message_model.dart';
import 'model/message_model.dart';
import 'model/message_sent_model.dart';


class ChatController extends ChangeNotifier {

  var _chat_repo = locator<ChatRepository>();
  MessageInboxListModel? messageInboxListModel;

  CreateInbox? createInboxResponse;

  MessageByInboxModel? messageByInboxModel;
  List<msg.Data>? messageList =[];
  SendMessageModel? sendMessageModel;

  getServiceList(userId)async{
    var apiresponse = await _chat_repo.getInboxList(userId);
    if(apiresponse.httpCode==200){
      messageInboxListModel = apiresponse.data;
    }
    notifyListeners();
  }


 Future<bool> createInbox(senderId)async{
    var apiresponse = await _chat_repo.createInbox(senderId);
    if(apiresponse.httpCode==200){
      createInboxResponse = apiresponse.data;
      return true;
    }else return false;

  }

  getMessage(inboxId)async{
    var apiresponse = await _chat_repo.getMessagebyInboxId(inboxId);
    if(apiresponse.httpCode==200){
      messageByInboxModel = apiresponse.data;

      messageList= messageByInboxModel?.data;
      messageList?.reversed.toList();

    }
    notifyListeners();
  }


  Future<bool> sendMessage(senderId,inboxId,message)async{
    var apiresponse = await _chat_repo.sendMessage(senderId,inboxId,message);
    if(apiresponse.httpCode==200){
      sendMessageModel = apiresponse.data;
      return true;
    }else return false;

  }


}
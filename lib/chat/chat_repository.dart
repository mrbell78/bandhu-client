import 'package:bondu/chat/model_restcall/create_inbox.dart';
import 'package:bondu/chat/model_restcall/message_byinbox.dart';
import 'package:bondu/chat/model_restcall/message_inboxlist_model.dart';
import 'package:bondu/chat/model_restcall/send_message_model.dart';

import '../http-service/api_response.dart';
import '../http-service/http-service.dart';
import '../locator/locator.dart';
import '../utils/api-cosntant.dart';

class ChatRepository{

  var _httpService = locator<HttpService>();


  Future<ApiResponse<CreateInbox?>> createInbox(senderId) async {

    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.CREATECHAT,
    data: {
      "sender_id":senderId,
      "receiver_id":54
    }
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:CreateInbox.fromJson(apiResponse.data.data)
    );

  }


  Future<ApiResponse<SendMessageModel>> sendMessage(senderId,inboxId,message) async {

    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.SENDMESSAGE,
        data: {
          "sender_id":senderId,
          "inbox_id":inboxId,
          "message":message,
        }
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:SendMessageModel.fromJson(apiResponse.data.data)
    );

  }






  Future<ApiResponse<MessageInboxListModel?>> getInboxList(String userId) async {

    var apiResponse = await _httpService.getRequest(APICONSTANT.SERVER+APICONSTANT.INBOXLIST+"/${userId}",);

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:MessageInboxListModel.fromJson(apiResponse.data.data)
    );

  }

  Future<ApiResponse<MessageByInboxModel>> getMessagebyInboxId( inboxId) async {

    var apiResponse = await _httpService.getRequest(APICONSTANT.SERVER+APICONSTANT.MESSAGEBYINBOXID+"/${inboxId}",);

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:MessageByInboxModel.fromJson(apiResponse.data.data)
    );

  }
}
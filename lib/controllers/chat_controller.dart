import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netwalking_global/controllers/data_controller.dart';
import 'package:netwalking_global/models/all_inbox_model.dart';
import 'package:netwalking_global/models/all_message_model.dart';
import 'package:netwalking_global/services/api_client.dart';
import 'package:netwalking_global/services/api_constant.dart';
import 'package:netwalking_global/views/base/custom_snackbar.dart';
import 'package:netwalking_global/views/screen/Chat/chat_screen.dart';

import '../services/socket_manager.dart';

class ChatController extends GetxController{

  final isFirstChatLoading = false.obs;
  RxList<AllMessageModel> allChatMessage = <AllMessageModel>[].obs;
  final isFirstLoading = false.obs;
  final _dataController = Get.put(DataController());

  final allInboxLoading = false.obs;

  final allInboxMessage = <InboxMessageModel>[].obs;

  final messageController = TextEditingController();

  ScrollController scrollController = ScrollController();
  var roomId = 0.obs;

  @override
  void onClose() {
    SocketApi.disconnect();
    super.onClose();
  }

  bool _socketInitialized = false;

  /// initialize socket
  Future<void> initialize({required int userId, required int id}) async {
    if (_socketInitialized) return;
    _socketInitialized = true;

    SocketApi.init(id);

    SocketApi.messageStream.listen((data) {
      try {
        final Map<String, dynamic> map = jsonDecode(data) as Map<String, dynamic>;
        final content = (map['content'] ?? map['message'] ?? '').toString();
        final images = map['images'] != null ? List<String>.from(map['images']) : null;


        if (content.trim().isEmpty && (images == null || images.isEmpty)) {
          return;
        }

        final msg = AllMessageModel.fromJson(map);


        allChatMessage.add(msg);


        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!scrollController.hasClients) return;


          final isReversed = true;
          final target = isReversed
              ? scrollController.position.minScrollExtent
              : scrollController.position.maxScrollExtent;

          scrollController.animateTo(
            target,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      } catch (e, st) {
        print('Socket parse error: $e\n$st');
      }
    });
  }

/// all message fetch
  Future<void> fetchAllMessage({required int id})async{
    isFirstLoading(true);
    final response = await ApiClient.getData(ApiConstant.allMessageEndPoint(id: id));
    if(response.statusCode == 200 || response.statusCode == 201){
      final List<dynamic> data = response.body;
      final List<AllMessageModel> message = data.map((e) => AllMessageModel.fromJson(e)).toList();
      allChatMessage.addAll(message);
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isFirstLoading(false);

  }

  /// send message
  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;


    final msg = AllMessageModel(
      id: DateTime.now().millisecondsSinceEpoch,
      room: roomId.value,
      sender: _dataController.id.value,
      content: text,
      images: null,
      isSeen: true,
      timestamp: DateTime.now(),
    );

    allChatMessage.add(msg);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) return;
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });


    final payload = {
      'sender': _dataController.id.value,
      'message': text,
      'room': roomId.value,
    };


    SocketApi.emit(payload);


    messageController.clear();
  }

/// create chat room
  Future<void> createChat({required int id, required String name, required String image})async{

    isFirstChatLoading(true);
    final body = {
      "user2": id
    };

    final response = await ApiClient.postData(ApiConstant.createChatRoomEndPoint, json.encode(body));

    if(response.statusCode == 200 || response.statusCode == 201){
      roomId.value = response.body["room_id"];
      Get.to(() => ChatScreen(id: roomId.value, name: name, image: image));
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isFirstChatLoading(false);

  }

  Future<void> fetchAllInbox()async{

    allInboxLoading(true);

    final response = await ApiClient.getData(ApiConstant.allRoomEndPoint);
    if(response.statusCode == 200 || response.statusCode == 201){
      final List<dynamic> data = response.body;
      final List<InboxMessageModel> message = data.map((e) => InboxMessageModel.fromJson(e)).toList();
      allInboxMessage.addAll(message);
    }else{
      showCustomSnackBar("Something went wrong", isError: true);

    }
    allInboxLoading(false);

  }

}
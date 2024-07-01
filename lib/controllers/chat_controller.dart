import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  SettingServices servicesController = Get.find();

  late String? userId = servicesController.prefs.getString("id");

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final msgController = TextEditingController();
  ScrollController scrollcontroller = ScrollController();
  //List messages = [];
  bool loading = false;

  CollectionReference msgs = FirebaseFirestore.instance.collection("chat");
  late Stream<QuerySnapshot> chatStream = FirebaseFirestore.instance
      .collection("chat")
      .where("userId", isEqualTo: userId)
      .orderBy('createdAt')
      .snapshots();

  /*getData() async {
    loading = true;
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection("chat")
        .orderBy('createdAt')
        .get();
    messages.addAll(data.docs);
    loading = false;
  }*/

  sendMsg() {
    if (msgController.text.isNotEmpty) {
      msgs.add(
        {
          "userId": userId,
          "sender": "user",
          "message": msgController.text,
          "createdAt": FieldValue.serverTimestamp(),
        },
      ).then(
        (value) {
          msgController.clear();
          scrollcontroller.animateTo(
            scrollcontroller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 10),
            curve: Curves.easeOut,
          );
        },
      );
      scrollcontroller.animateTo(
        scrollcontroller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeOut,
      );
    }
  }

  bool isMine(msg) {
    if (msg["sender"] == "user") {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onReady() {
    if (servicesController.prefs.getInt("supportDialog") == null) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 25),
        contentPadding: const EdgeInsets.all(20),
        title: "Info",
        middleText:
            "Contactez notre équipe de support directement via ce chat si vous avez des problèmes ou des questions !",
        cancel: ElevatedButton(
          onPressed: () {
            servicesController.prefs.setInt("supportDialog", 1);
            Get.back();
          },
          child: const Text("OK"),
        ),
      );
    }

    super.onReady();
  }
}

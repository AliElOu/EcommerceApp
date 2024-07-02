import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  SettingServices servicesController = Get.find();

  late String? username = servicesController.prefs.getString("username");

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final msgController = TextEditingController();
  ScrollController scrollcontroller = ScrollController();

  CollectionReference chats = FirebaseFirestore.instance.collection("chats");
  late DocumentReference chatDoc = chats.doc(username);
  late CollectionReference msgs = chatDoc.collection("messages");

  late Stream<QuerySnapshot> chatStream = FirebaseFirestore.instance
      .collection("chats")
      .doc(username)
      .collection("messages")
      .orderBy('createdAt')
      .snapshots();

  sendMsg() async {
    if (msgController.text.isNotEmpty) {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot chatSnapshot = await transaction.get(chatDoc);

        if (!chatSnapshot.exists) {
          transaction.set(chatDoc, {
            'createdAt': FieldValue.serverTimestamp(),
          });
        }

        transaction.set(msgs.doc(), {
          "sender": "user",
          "message": msgController.text,
          "createdAt": FieldValue.serverTimestamp(),
        });
        msgController.clear();
      });
    }
  }

  scrollToEnd() async {
    scrollcontroller.animateTo(
      scrollcontroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeOut,
    );
    await Future.delayed(const Duration(milliseconds: 100));
    scrollcontroller.animateTo(
      scrollcontroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 10),
      curve: Curves.easeOut,
    );
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

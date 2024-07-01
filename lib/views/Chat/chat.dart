import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/Views/widgets/header.dart';
import 'package:flutter_bootcamp/controllers/chat_controller.dart';
import 'package:flutter_bootcamp/core/constants/colors.dart';
import 'package:get/get.dart';

class Chat extends GetView<ChatController> {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Header(title: "Support Chat"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formState,
            child: StreamBuilder(
              stream: controller.chatStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.39),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return const Text("HasError");
                }
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: Get.height * 0.7,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.scrollcontroller,
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        children: [
                          if (snapshot.data!.docs.isEmpty)
                            Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: (Get.height * 0.35)),
                                child: const Text(
                                  "No messages",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          for (int i = 0; i < snapshot.data!.docs.length; i++)
                            !(controller.isMine(snapshot.data!.docs[i]))
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, bottom: 10, right: 35),
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50)),
                                        color: AppColors.PrimaryColor,
                                      ),
                                      child: Text(
                                        snapshot.data!.docs[i]["message"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "os",
                                            fontSize: 15),
                                      ),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10, left: 35),
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                            bottomLeft: Radius.circular(50)),
                                        color: Colors.grey,
                                      ),
                                      child: Text(
                                        snapshot.data!.docs[i]["message"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "os",
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                        ],
                      ),
                    ),
                    Container(
                      height: Get.height * 0.08,
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.81,
                            child: TextFormField(
                              controller: controller.msgController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 15),
                                hintText: "Entrez votre message",
                                hintStyle: const TextStyle(fontSize: 14),
                                labelStyle: const TextStyle(
                                  fontFamily: 'os',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              controller.sendMsg();
                            },
                            icon: const Icon(Icons.send),
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

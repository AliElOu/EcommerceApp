import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_page_controller.dart';
import '../../../core/functions/textformfields_validators.dart';
import '../../../main.dart';

var infoskey = GlobalKey<FormState>();
TextEditingController phonecntrl =
        TextEditingController(text: prefs.getString("phone")!);
    TextEditingController adressecntrl =
        TextEditingController(text: prefs.getString("adresse")!);
class YourAdressetWidget extends StatelessWidget {
  const YourAdressetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProductPageController productpagecontroller =
        Get.find<ProductPageController>();
        productpagecontroller.isEditable = true;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Vos informations",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  fontFamily: "os",
                ),
              ),
              GestureDetector(
                onTap: () {
                  productpagecontroller.toggleEditing();
                },
                child: const Text(
                  "Changer l'information",
                  style: TextStyle(
                    color: Color.fromARGB(146, 158, 158, 158),
                    fontSize: 16,
                    fontFamily: "Kanit",
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 7),
          GetBuilder<ProductPageController>(
              id: "infos",
              builder: (controller) {
                return Form(
                  key: infoskey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: phonevalidator ,
                        autofocus: !controller.isEditable,
                        readOnly: controller.isEditable,
                        controller: phonecntrl,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: "Kanit",
                        ),
                        
                      ),
                      TextFormField(
                        validator: adressevalidator ,
                        autofocus: !controller.isEditable,
                        readOnly: controller.isEditable,
                        controller: adressecntrl,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: "Kanit",
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}

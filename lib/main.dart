import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/controllers/choose_language_controller.dart';
import 'package:flutter_bootcamp/core/local/local.dart';
import 'package:flutter_bootcamp/routes.dart';
import 'package:flutter_bootcamp/core/services/setting_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

Future initialServices() async {
  await Get.putAsync(() => SettingServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ChooseLanguageController controller = Get.put(ChooseLanguageController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: "/languages",
          locale: controller.intialLang,
          translations: MyLocal(),
          getPages: routes,
        );
      },
    );
  }
}

import 'package:flutter_bootcamp/core/classes/crud.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:flutter_bootcamp/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/functions/handling_data.dart';

class HomeController extends GetxController{

  Crud crud = Crud() ;
  late HomeData homeData = HomeData(crud) ;

  List data = [];

  late StatusRequest statusRequest;

  GetData() async{
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData() ;
    statusRequest = HandlingData(response);
                print("$statusRequest ==================================================");

    if(statusRequest == StatusRequest.succes) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    GetData();
    super.onInit();
  }
}
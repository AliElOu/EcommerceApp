import 'package:flutter_bootcamp/enums/status_request.dart';

HandlingData(response) {
  if(response is StatusRequest) {
    return response;
  } else if(response['status'] == "failure"){
    return StatusRequest.failure ;
  }
   else {
    return StatusRequest.succes ;
  }
}
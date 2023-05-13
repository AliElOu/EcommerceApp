import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:lottie/lottie.dart';

import '../../screens/widgets/trouble_widget.dart';


class HandlignDataView extends StatelessWidget {
  final StatusRequest statusrequest;
  final Widget widget;
  const HandlignDataView({
    super.key,
    required this.statusrequest,
    required this.widget,
  });
  @override
  Widget build(BuildContext context) {
    print("i'am here");
    double height = MediaQuery.of(context).size.height;
    return statusrequest == StatusRequest.loading
        ? SizedBox(
            height: height - 30,
            child: Center(
              child: Lottie.asset("assets/lottie/loading.json",
                  width: 150, height: 150),
            ))
        : statusrequest == StatusRequest.failure
            ? const TroubleWidget(text: "There is no menu that is looking for",image: "assets/images/no_data_ilustration.png",description: "It looks like there is no data available at the moment. Please try again later",)
            : statusrequest == StatusRequest.offlineFailure
                ? const TroubleWidget(text: "Oops, there is no internet!",image: "assets/images/no_connection.png",description: "Please check your internet connection and refresh the page",)
                : statusrequest == StatusRequest.serverFailure
                    ? const Center(child: TroubleWidget(text: "Oops, there is no internet!",image: "assets/images/no_connection.png",description: "Please check your internet connection and refresh the page",))
                    : widget;
  }
}



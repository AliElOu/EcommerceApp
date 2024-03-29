import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:lottie/lottie.dart';

import '../../screens/widgets/trouble_widget.dart';


class HandlignDataView extends StatelessWidget {
  final StatusRequest? statusrequest;
  final Widget widget;
  const HandlignDataView({
    super.key,
    required this.statusrequest,
    required this.widget,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return statusrequest == StatusRequest.loading
        ? SizedBox(
            height: height - 30,
            child: Center(
              child: Lottie.asset("assets/lottie/loading.json",
                  width: 150, height: 150),
            ))
        : statusrequest == StatusRequest.failure
            ? const TroubleWidget(text: "Il n'y a pas de menu que vous recherchez",image: "assets/images/no_data_ilustration.png",description: "Il semble qu'il n'y ait pas de données disponibles pour le moment. Veuillez réessayer plus tard",)
            : statusrequest == StatusRequest.offlineFailure
                ? const TroubleWidget(text: "Oups, il n'y a pas d'internet!",image: "assets/images/no_connection.png",description: "Veuillez vérifier votre connexion Internet et actualiser la page",)
                : statusrequest == StatusRequest.serverFailure
                    ? const Center(child: TroubleWidget(text: "Oups, il n'y a pas d'internet!",image: "assets/images/no_connection.png",description: "Veuillez vérifier votre connexion Internet et actualiser la page",))
                    : widget;
  }
}



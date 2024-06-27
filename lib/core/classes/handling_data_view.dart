import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';
import 'package:lottie/lottie.dart';

import '../../views/widgets/trouble_widget.dart';

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
    return statusrequest == StatusRequest.loading
        ? SizedBox(
            child: Center(
            child: Lottie.asset("assets/lottie/loading.json",
                width: 140, height: 140),
          ))
        : statusrequest == StatusRequest.failure
            ? const TroubleWidget(
                text: "Il n'y a pas de menu que vous recherchez",
                image: "no_data_ilustration.png",
                description:
                    "Il semble qu'il n'y ait pas de données disponibles pour le moment. Veuillez réessayer plus tard",
              )
            : statusrequest == StatusRequest.offlineFailure
                ? const TroubleWidget(
                    text: "Oups, il n'y a pas d'internet!",
                    image: "no_connection.png",
                    description:
                        "Veuillez vérifier votre connexion Internet et actualiser la page",
                  )
                : statusrequest == StatusRequest.serverFailure
                    ? const Center(
                        child: TroubleWidget(
                        text: "Oups, il n'y a pas d'internet!",
                        image: "no_connection.png",
                        description:
                            "Veuillez vérifier votre connexion Internet et actualiser la page",
                      ))
                    : widget;
  }
}

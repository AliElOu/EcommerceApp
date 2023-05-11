import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bootcamp/enums/status_request.dart';

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
    return statusrequest == StatusRequest.loading
        ? const Center(child: Text("Loading ..."))
        : statusrequest == StatusRequest.failure
            ? const Center(child: Text("No data"))
            : statusrequest == StatusRequest.offlineFailure
                ? const Center(child: Text("No Connection"))
                : statusrequest == StatusRequest.serverFailure
                    ? const Center(child: Text("Server failure"))
                    : widget;
  }
}

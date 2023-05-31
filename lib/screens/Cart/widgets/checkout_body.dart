import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/screens/Cart/widgets/payment_methods_widget.dart';
import 'package:flutter_bootcamp/screens/Cart/widgets/your_adresse_widget.dart';
import 'package:flutter_bootcamp/screens/Cart/widgets/your_chart_widget.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({super.key});

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(height: 20),
      YourChartWidget(),
      SizedBox(height: 20),
      YourAdressetWidget(),
      SizedBox(height: 10),
      PaymentMehodsWidget(),
    ]);
  }
}

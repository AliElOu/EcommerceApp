import 'package:flutter/material.dart';
import '../../../models/special_for_you_model.dart';
import 'list_header.dart';
import 'special_for_you_list.dart';

class SpecialForYou extends StatelessWidget {
  const SpecialForYou({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listHeader(title: "Special for you"),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: specialList.length,
              itemBuilder: (context, index) {
                return SpecialForYouList(offer: specialList[index]);
              }),
        )
      ],
    );
  }
}

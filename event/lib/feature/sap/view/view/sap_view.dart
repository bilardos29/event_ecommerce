import 'package:event/feature/profile/view/widgets/tag_view.dart';
import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

class SAPView extends StatelessWidget {
  const SAPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.4),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TagView(),
              Padding(
                padding: EdgeInsets.only(top: 2, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category :',
                      style: TextStyle(
                          color: ColorsUtil.bgColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text('Insurance',
                        style: TextStyle(
                            color: ColorsUtil.bgColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Charles Monat Associates Pte Ltd',
                    style: TextStyle(
                        color: ColorsUtil.bgColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const Text('Location : Singapore',
                    style: TextStyle(
                        color: ColorsUtil.bgColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Image.asset('images/assets/profile.png',
                          height: 80, width: 80),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shriram Hedge',
                            style: TextStyle(
                                color: ColorsUtil.bgColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text('Executive Director, International',
                            style: TextStyle(
                                color: ColorsUtil.bgColor,
                                fontSize: 14)),
                        Text('Email : shiram.hedge@monat.com',
                            style: TextStyle(
                                color: ColorsUtil.bgColor,
                                fontSize: 14)),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

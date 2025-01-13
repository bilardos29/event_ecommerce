import 'package:event/feature/profile/view/widgets/tag_view.dart';
import 'package:event/feature/sap/model/sap_model.dart';
import 'package:event/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SAPView extends StatelessWidget {
  SAPView({required this.item, Key? key}) : super(key: key);

  SAPModel item;

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TagView(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Category :',
                        style: TextStyle(
                            color: ColorsUtil.bgColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text('${item.category}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              color: ColorsUtil.bgColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.company}',
                    style: const TextStyle(
                        color: ColorsUtil.bgColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text('Location : ${item.location}',
                    style: const TextStyle(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item.picName}',
                            style: const TextStyle(
                                color: ColorsUtil.bgColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text('${item.picPosition}',
                            style: const TextStyle(
                                color: ColorsUtil.bgColor, fontSize: 14)),
                        Text('Email : ${item.email}',
                            style: const TextStyle(
                                color: ColorsUtil.bgColor, fontSize: 14)),
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

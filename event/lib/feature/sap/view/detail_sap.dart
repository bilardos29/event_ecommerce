import 'package:event/feature/profile/view/widgets/tag_view.dart';
import 'package:event/feature/sap/model/sap_model.dart';
import 'package:event/utils/colors.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class DetailSAP extends StatefulWidget {
  DetailSAP({required this.item, Key? key}) : super(key: key);

  SAPModel item;

  @override
  State<DetailSAP> createState() => _DetailSAPState();
}

class _DetailSAPState extends State<DetailSAP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barDetailSAP,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      body: SingleChildScrollView(
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
                      Text('${widget.item.category}',
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: const TextStyle(
                              color: ColorsUtil.bgColor,
                              fontSize: 16,
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
                const SizedBox(height: 12),
                Text('${widget.item.company}',
                    style: const TextStyle(
                        color: ColorsUtil.bgColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Location : ${widget.item.location}',
                    style: const TextStyle(
                        color: ColorsUtil.bgColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 28),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[400]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset('images/assets/profile.png',
                          height: 100, width: 100),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.item.picName}',
                            style: const TextStyle(
                                color: ColorsUtil.bgColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text('${widget.item.picPosition}',
                            style: const TextStyle(
                                color: ColorsUtil.bgColor, fontSize: 13)),
                        Text('Email : ${widget.item.email}',
                            style: const TextStyle(
                                color: ColorsUtil.bgColor, fontSize: 13)),
                        Text('Phone : ${widget.item.phone}',
                            style: const TextStyle(
                                color: ColorsUtil.bgColor, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Text('Services',
                    style: TextStyle(
                        color: ColorsUtil.bgColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text('${widget.item.services}',
                    style: const TextStyle(color: ColorsUtil.bgColor, fontSize: 14)),
                // const Text('2. Estate Planning',
                //     style: TextStyle(color: ColorsUtil.bgColor, fontSize: 14)),
                // const Text('3. Multi Generation wealth transfer',
                //     style: TextStyle(color: ColorsUtil.bgColor, fontSize: 14)),
                // const Text('4. Family and Business protection solution',
                //     style: TextStyle(color: ColorsUtil.bgColor, fontSize: 14)),
                // const Text('5. Liquidity Planning and Asset Protection',
                //     style: TextStyle(color: ColorsUtil.bgColor, fontSize: 14)),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget rowItem(IconData icon, String detail) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.withOpacity(0.7), size: 18),
        const SizedBox(width: 8),
        Text(
          detail,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}

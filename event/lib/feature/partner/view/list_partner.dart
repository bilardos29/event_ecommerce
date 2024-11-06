import 'package:event/feature/partner/view/detail_partner.dart';
import 'package:event/feature/partner/view/widgets/partner_card.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ListPartner extends StatefulWidget {
  const ListPartner({Key? key}) : super(key: key);

  @override
  State<ListPartner> createState() => _ListPartnerState();
}

class _ListPartnerState extends State<ListPartner> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight = 210;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barPartner,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (ctx, idx) {
                    return PartnerCard(
                      onClick: () {
                        BaseWidget.push(ctx, const DetailPartner());
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

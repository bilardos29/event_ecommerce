import 'package:event/feature/member_benefit/model/member_benefit_model.dart';
import 'package:event/feature/member_benefit/view/detail_member_benefit.dart';
import 'package:event/feature/member_benefit/view/widgets/filter_partner.dart';
import 'package:event/feature/member_benefit/view/widgets/member_benefit_card.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/icons_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class ListMemberBenefit extends StatefulWidget {
  const ListMemberBenefit({Key? key}) : super(key: key);

  @override
  State<ListMemberBenefit> createState() => _ListMemberBenefitState();
}

class _ListMemberBenefitState extends State<ListMemberBenefit> {
  TextEditingController partnerName = TextEditingController();
  TextEditingController location = TextEditingController();

  String dropdownItem = 'All';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight = 210;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barMemberBenefit,
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
              Container(
                child: Row(
                  children: [
                    RoundedTextField(
                      width: MediaQuery.of(context).size.width - 80,
                      prefix: Icons.search,
                      hintText: 'Member Benefit Name',
                      textController: partnerName,
                    ),
                    const SizedBox(width: 8),
                    IconsButton(
                      icon: 'ic_filter.png',
                      onClick: show,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listMemberBenefit.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (ctx, idx) {
                    return MemberBenefitCard(
                      item: listMemberBenefit[idx],
                      onClick: () {
                        BaseWidget.push(ctx,
                            DetailMemberBenefit(item: listMemberBenefit[idx]));
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void show() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterPartner(
          location: location,
          dropdownItem: dropdownItem,
          listDropdown: const [
            'All',
            'Cafe & Bar',
            'Health',
            'Golf',
            'Hotel'
          ],
        );
      },
    );
  }
}

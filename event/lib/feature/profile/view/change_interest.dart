import 'package:event/feature/event/model/myeo_subgroup_model.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/bottom_button.dart';
import 'package:event/widgets/checkbox_widget.dart';
import 'package:flutter/material.dart';

class ChangeInterest extends StatefulWidget {
  const ChangeInterest({Key? key}) : super(key: key);

  @override
  State<ChangeInterest> createState() => _ChangeInterestState();
}

class _ChangeInterestState extends State<ChangeInterest> {

  bool golf = false;
  bool basket = false;
  bool soccer = false;
  bool tennis = false;
  bool badminton = false;
  bool volley = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    double itemHeight = 32;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barChangeInterest,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      bottomSheet: BottomButton(
          text: Strings.save,
          onClick: () {
            Navigator.of(context).pop();
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sport/Interest',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (ctx, idx) {
                      return CheckBoxWidget(
                          text: listMyEOSubGroup[idx].name!,
                          val: listMyEOSubGroup[idx].checked!,
                          onChange: (val) {
                            setState(() {
                              listMyEOSubGroup[idx].checked = !listMyEOSubGroup[idx].checked!;
                            });
                          });
                    }),
                const SizedBox(height: 12),
                const Text('Social/Community',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (ctx, idx) {
                      int index = idx + 7;
                      return CheckBoxWidget(
                          text: listMyEOSubGroup[index].name!,
                          val: listMyEOSubGroup[index].checked!,
                          onChange: (val) {
                            setState(() {
                              listMyEOSubGroup[index].checked = !listMyEOSubGroup[index].checked!;
                            });
                          });
                    }),
                const SizedBox(height: 12),
                const Text('Industry/Current Issues',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                    ),
                    itemBuilder: (ctx, idx) {
                      int index = idx + 13;
                      return CheckBoxWidget(
                          text: listMyEOSubGroup[index].name!,
                          val: listMyEOSubGroup[index].checked!,
                          onChange: (val) {
                            setState(() {
                              listMyEOSubGroup[index].checked = !listMyEOSubGroup[index].checked!;
                            });
                          });
                    }),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

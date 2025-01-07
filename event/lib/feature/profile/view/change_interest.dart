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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Interest',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckBoxWidget(
                              text: 'Golf',
                              val: golf,
                              onChange: (val) {
                                setState(() {
                                  golf = !golf;
                                });
                              }),
                          CheckBoxWidget(
                              text: 'Basket',
                              val: basket,
                              onChange: (val) {
                                setState(() {
                                  basket = !basket;
                                });
                              }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckBoxWidget(
                              text: 'Soccer',
                              val: soccer,
                              onChange: (val) {
                                setState(() {
                                  soccer = !soccer;
                                });
                              }),
                          CheckBoxWidget(
                              text: 'Tennis',
                              val: tennis,
                              onChange: (val) {
                                setState(() {
                                  tennis = !tennis;
                                });
                              }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckBoxWidget(
                              text: 'Badminton',
                              val: badminton,
                              onChange: (val) {
                                setState(() {
                                  badminton = !badminton;
                                });
                              }),
                          CheckBoxWidget(
                              text: 'Volley',
                              val: volley,
                              onChange: (val) {
                                setState(() {
                                  volley = !volley;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

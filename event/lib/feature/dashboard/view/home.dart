import 'package:carousel_slider/carousel_slider.dart';
import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/feature/dashboard/view/widgets/header_view.dart';
import 'package:event/feature/dashboard/view/widgets/menu_button.dart';
import 'package:event/feature/event/view/list_event.dart';
import 'package:event/feature/mycard/view/mycard.dart';
import 'package:event/feature/partner/view/list_partner.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DashboardController controller = context.read<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderView(name: 'Bilardo Situmorang'),
            const SizedBox(height: 20),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'images/banner/img_banner_1.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Strings.pickYourAction,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MenuButton(
                            title: Strings.barEvent,
                            image: 'ic_event.png',
                            onClick: () {
                              BaseWidget.push(context, const ListEvent());
                            }),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: MenuButton(
                            title: Strings.barPartner,
                            image: 'ic_partner.png',
                            onClick: () {
                              BaseWidget.push(context, const ListPartner());
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MenuButton(
                            title: Strings.barMyCard,
                            image: 'ic_card.png',
                            onClick: () {
                              BaseWidget.push(context, const MyVirtualCard());
                            }),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: MenuButton(
                            title: Strings.barReferral,
                            image: 'ic_referral.png',
                            onClick: () {
                              // BaseWidget.push(context, const ());
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 270,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Strings.pastVideoheader,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  CarouselSlider.builder(
                      itemCount: controller.listBanner.length,
                      itemBuilder: (context, idx, pgIdx) {
                        return Image.asset(
                          'images/banner/${controller.listBanner[idx].link}',
                          height: 170,
                          fit: BoxFit.fitHeight,
                        );
                      },
                      options: CarouselOptions(
                        height: 170,
                        viewportFraction: 0.9,
                        enlargeCenterPage: false,
                        autoPlay: true,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

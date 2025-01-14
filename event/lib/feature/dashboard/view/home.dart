import 'package:carousel_slider/carousel_slider.dart';
import 'package:event/feature/announcement/view/list_announcement.dart';
import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/feature/dashboard/view/widgets/home_menu.dart';
import 'package:event/feature/dashboard/view/widgets/virtual_card.dart';
import 'package:event/feature/event/view/list_event.dart';
import 'package:event/feature/event/view/list_calendar_event.dart';
import 'package:event/feature/member_benefit/view/list_member_benefit.dart';
import 'package:event/feature/mycard/view/mycard.dart';
import 'package:event/feature/referral/view/referral.dart';
import 'package:event/feature/sap/view/list_sap.dart';
import 'package:event/feature/video_player/view/video_player_view.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';
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
    // print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 72),
            controller.user!.email == null ? SizedBox() : VirtualCard(
                user: controller.user!,
                onClick: () {
                  BaseWidget.push(context, const MyVirtualCard());
                }),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeMenu(
                        img: 'ic_event.png',
                        menu: 'Events',
                        onClick: () {
                          BaseWidget.push(context, const ListEvent());
                        },
                      ),
                      HomeMenu(
                        img: 'ic_calendar.png',
                        menu: 'Calendar',
                        onClick: () {
                          BaseWidget.push(context, const ListCalendarEvent());
                        },
                      ),
                      HomeMenu(
                        img: 'ic_referral.png',
                        menu: 'Referrals',
                        onClick: () {
                          BaseWidget.push(context, const ReferralPage());
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeMenu(
                        img: 'ic_partnership.png',
                        menu: 'SAP',
                        onClick: () {
                          BaseWidget.push(context, const ListSAP());
                        },
                      ),
                      HomeMenu(
                        img: 'ic_benefit.png',
                        menu: 'Member Benefits',
                        onClick: () {
                          BaseWidget.push(context, const ListMemberBenefit());
                        },
                      ),
                      HomeMenu(
                        img: 'ic_announce.png',
                        menu: 'Announcements',
                        onClick: () {
                          BaseWidget.push(context, const ListAnnouncement());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      Strings.pastVideoheader,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    CarouselSlider.builder(
                        itemCount: controller.listBanner.length,
                        itemBuilder: (context, idx, pgIdx) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: InkWell(
                              onTap: () {
                                BaseWidget.push(
                                    context, const VideoPlayerView());
                              },
                              child: Container(
                                height: 170,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black.withOpacity(0.7),
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        opacity: 0.7,
                                        image: AssetImage(
                                            'images/sample/${controller.listBanner[idx].link}'))),
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 56,
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
            ),
          ],
        ),
      ],
    ));
  }
}

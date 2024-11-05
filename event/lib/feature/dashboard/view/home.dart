import 'package:carousel_slider/carousel_slider.dart';
import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/feature/dashboard/view/widgets/header_view.dart';
import 'package:event/feature/dashboard/view/widgets/menu_button.dart';
import 'package:event/utils/strings.dart';
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
    return Scaffold(
      body: Column(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuButton(
                    title: 'Events', image: 'ic_televisi.png', onClick: () {}),
                MenuButton(
                    title: 'Partners', image: 'ic_makanan.png', onClick: () {}),
                MenuButton(
                    title: 'My Card', image: 'ic_pulsa.png', onClick: () {}),
                MenuButton(
                    title: 'Referral', image: 'ic_data.png', onClick: () {}),
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container(height: 160, color: Colors.red.withOpacity(0.4)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
              )
            ],
          )),
        ],
      ),
    );
  }
}

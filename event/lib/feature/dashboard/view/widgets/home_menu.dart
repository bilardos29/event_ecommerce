import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    required this.img,
    required this.menu,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final String img;
  final String menu;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        width: 100,
        height: 108,
        child: Column(
          children: [
            Container(
              height: 64,
              width: 64,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorsUtil.mainButton,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset('images/assets/$img', color: Colors.white),
            ),
            const SizedBox(height: 6),
            Text(
              menu,
              style: const TextStyle(fontSize: 12, color: Colors.black),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

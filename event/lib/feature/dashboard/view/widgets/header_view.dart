import 'package:event/utils/colors.dart';
import 'package:event/widgets/user_profile_small.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  HeaderView({
    this.img,
    required this.name,
    Key? key,
  }) : super(key: key);

  String? img;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: ColorsUtil.primaryBg,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          const SizedBox(height: 56),
          Row(
            children: [
              UserProfileSmall(img: '', name: name),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Good Morning,', style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

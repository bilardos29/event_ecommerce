import 'package:flutter/material.dart';

class UserProfileBig extends StatelessWidget {
  const UserProfileBig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[200]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(120),
          ),
          child:
              Image.asset('images/assets/profile.png', height: 100, width: 100),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[350]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}

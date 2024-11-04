import 'package:flutter/material.dart';

class UserProfileSmall extends StatelessWidget {
  const UserProfileSmall({this.img, Key? key}) : super(key: key);

  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: img == null || img!.isEmpty
          ? Image.asset('images/assets/profile.png')
          : Image.network(img!),
    );
  }
}

import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

class UserProfileSmall extends StatelessWidget {
  const UserProfileSmall({this.img, this.name, Key? key}) : super(key: key);

  final String? img;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.5),
        borderRadius: BorderRadius.circular(40),
        color: img == null || img!.isEmpty
            ? ColorsUtil.primaryBg.withOpacity(0.6)
            : Colors.transparent,
      ),
      child: img == null || img!.isEmpty ? TextImg(name!) : Image.network(img!),
    );
  }

  Widget TextImg(String name) {
    return Text(
      name.substring(0, 1).toUpperCase(),
      style: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    );
  }
}

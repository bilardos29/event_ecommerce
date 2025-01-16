import 'package:event/feature/announcement/model/announce_model.dart';
import 'package:flutter/material.dart';

class AnnounceView extends StatelessWidget {
  AnnounceView({required this.item, Key? key}) : super(key: key);

  AnnounceModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.2),
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('images/sample/${item.image}'),
              opacity: 0.86,
              fit: BoxFit.cover)),
      // child: Image.asset('images/sample/img_announcement.jpeg', fit: BoxFit.cover,),
    );
  }
}

import 'package:event/feature/announcement/model/announce_model.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class DetailAnnouncement extends StatefulWidget {
  DetailAnnouncement({required this.item, Key? key}) : super(key: key);

  AnnounceModel item;

  @override
  State<DetailAnnouncement> createState() => _DetailAnnouncementState();
}

class _DetailAnnouncementState extends State<DetailAnnouncement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barDetailAnnounce,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      body: Container(
        color: Colors.grey.withOpacity(0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '${widget.item.title}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.item.date}',
                  style: const TextStyle(
                    fontSize: 15
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 12),
            Image.asset('images/sample/${widget.item.image}'),
          ],
        ),
      ),
    );
  }
}

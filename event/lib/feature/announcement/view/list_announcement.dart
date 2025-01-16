import 'package:event/feature/announcement/model/announce_model.dart';
import 'package:event/feature/announcement/view/detail_announcement.dart';
import 'package:event/feature/announcement/view/widget/announce_view.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ListAnnouncement extends StatefulWidget {
  const ListAnnouncement({Key? key}) : super(key: key);

  @override
  State<ListAnnouncement> createState() => _ListAnnouncementState();
}

class _ListAnnouncementState extends State<ListAnnouncement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barAnnounce,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listAnnounce.length,
                  itemBuilder: (context, idx) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: InkWell(
                          onTap: () {
                            BaseWidget.push(context,
                                DetailAnnouncement(item: listAnnounce[idx]));
                          },
                          child: AnnounceView(item: listAnnounce[idx])),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

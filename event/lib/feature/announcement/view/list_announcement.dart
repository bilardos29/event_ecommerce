import 'package:event/feature/announcement/view/detail_announcement.dart';
import 'package:event/feature/announcement/view/widget/announce_view.dart';
import 'package:event/feature/announcement/view/widget/filter_view.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/icons_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class ListAnnouncement extends StatefulWidget {
  const ListAnnouncement({Key? key}) : super(key: key);

  @override
  State<ListAnnouncement> createState() => _ListAnnouncementState();
}

class _ListAnnouncementState extends State<ListAnnouncement> {

  TextEditingController announce = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

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
              Container(
                child: Row(
                  children: [
                    RoundedTextField(
                      width: MediaQuery.of(context).size.width - 80,
                      prefix: Icons.search,
                      hintText: 'Announement',
                      textController: announce,
                    ),
                    const SizedBox(width: 8),
                    IconsButton(
                      icon: 'ic_filter.png',
                      onClick: show,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, idx) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: InkWell(
                          onTap: () {
                            BaseWidget.push(context, const DetailAnnouncement());
                          },
                          child: const AnnounceView()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void show() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterAnnouncement(
          startDate: startDate,
          endDate: endDate,
        );
      },
    );
  }
}

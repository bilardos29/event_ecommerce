import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/icons_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class ListSAP extends StatefulWidget {
  const ListSAP({Key? key}) : super(key: key);

  @override
  State<ListSAP> createState() => _ListSAPState();
}

class _ListSAPState extends State<ListSAP> {

  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barSAP,
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
                      hintText: 'Location',
                      textController: location,
                    ),
                    const SizedBox(width: 8),
                    IconsButton(
                      icon: 'ic_filter.png',
                      onClick: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

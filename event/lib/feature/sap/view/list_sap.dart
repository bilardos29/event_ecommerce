import 'package:event/feature/sap/view/detail_sap.dart';
import 'package:event/feature/sap/view/view/filter_sap.dart';
import 'package:event/feature/sap/view/view/sap_view.dart';
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
  TextEditingController sapName = TextEditingController();
  TextEditingController location = TextEditingController();

  String dropdownItem = 'All';

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
                      hintText: 'SAP Name',
                      textController: sapName,
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
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: InkWell(
                          onTap: () {
                            BaseWidget.push(context, const DetailSAP());
                          },
                          child: const SAPView()),
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
        return FilterSAP(
          location: location,
          dropdownItem: dropdownItem,
          listDropdown: const [
            'All',
            'Insurance',
            'Environmental Health',
            'Product Photography & Videography',
            'People & Organization Transformation'
          ],
        );
      },
    );
  }
}

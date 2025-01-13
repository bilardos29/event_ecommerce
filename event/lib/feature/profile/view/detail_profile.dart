import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/bottom_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  late DashboardController homeController = context.read<DashboardController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    firstName.text = homeController.user!.firstname!;
    lastName.text = homeController.user!.lastname!;
    phone.text = homeController.user!.phone!;
    address.text = homeController.user!.address!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barDetailProfile,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      bottomSheet: BottomButton(
          text: Strings.save,
          onClick: () {
            Navigator.of(context).pop();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('First Name'),
              const SizedBox(height: 10),
              RoundedTextField(
                textController: firstName,
                prefix: Icons.person,
                disabled: true, //controller.mainText != Strings.simpan,
              ),
              const SizedBox(height: 20),
              const Text('Last Name'),
              const SizedBox(height: 10),
              RoundedTextField(
                textController: lastName,
                prefix: Icons.person,
                disabled: true, //controller.mainText != Strings.simpan,
              ),
              const SizedBox(height: 20),
              const Text('Phone Number'),
              const SizedBox(height: 10),
              RoundedTextField(
                textController: phone,
                prefix: Icons.phone,
                disabled: true, //controller.mainText != Strings.simpan,
              ),
              const SizedBox(height: 20),
              const Text('Address'),
              const SizedBox(height: 10),
              RoundedTextField(
                textController: address,
                prefix: Icons.add_road,
                disabled: true, //controller.mainText != Strings.simpan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

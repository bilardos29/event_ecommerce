import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class DetailMemberBenefit extends StatefulWidget {
  const DetailMemberBenefit({Key? key}) : super(key: key);

  @override
  State<DetailMemberBenefit> createState() => _DetailMemberBenefitState();
}

class _DetailMemberBenefitState extends State<DetailMemberBenefit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barDetailMemberBenefit,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/sample/sample_2.jpg'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Konser Dokter Tompi Musik Jazz',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and '
                        'typesetting industry. Lorem Ipsum has been the industry\'s standard '
                        'dummy text ever since the 1500s, when an unknown printer took a '
                        'galley of type and scrambled it to make a type specimen book. It has'
                        ' survived not only five centuries, but also the leap into electronic'
                        ' typesetting, remaining essentially unchanged. It was popularised '
                        'in the 1960s with the release of Letraset sheets containing Lorem '
                        'Ipsum passages, and more recently with desktop publishing software '
                        'like Aldus PageMaker including versions of Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Location Map',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('images/sample/sample_3.png'),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget rowItem(IconData icon, String detail) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.withOpacity(0.7), size: 18),
        const SizedBox(width: 8),
        Text(
          detail,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}

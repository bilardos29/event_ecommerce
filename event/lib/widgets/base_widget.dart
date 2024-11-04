import 'package:event/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseWidget {
  static void push(BuildContext ctx, Widget widget) {
    Navigator.push(ctx, MaterialPageRoute(builder: (context) => widget));
  }

  static void pushToTop(BuildContext ctx, Widget widget) {
    Navigator.of(ctx)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
    // pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => widget), ModalRoute.withName('/'));
  }

  static void showSnackBar(BuildContext ctx, String message) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
  }

  static AppBar appbar({String title = '', VoidCallback? onBack}) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      leadingWidth: 100,
      leading: InkWell(
        onTap: onBack,
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.grey[700]!,
              ),
              const SizedBox(width: 8),
              Text(
                Strings.kembali,
                style: TextStyle(color: Colors.grey[700]!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String currency(int nominal) {
    final format =
        NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    String curr = format.format(nominal).toString();
    return curr;
  }

  static void showDialogs(BuildContext context, Widget widget) {
    Dialog dialog = Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)), //this right here
        child: widget);

    showDialog(context: context, builder: (ctx) => dialog);
  }

  static String dt(String datetime) {
    String dateStringWithTimeZone = datetime;
    DateTime dateTimeWithTimeZone = DateTime.parse(dateStringWithTimeZone);
    print(dateTimeWithTimeZone);

    String formattedDate = DateFormat('dd MMMM yyyy kk:mm ').format(dateTimeWithTimeZone);
    print(formattedDate);
    return formattedDate;
  }
}

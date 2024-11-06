import 'package:event/utils/colors.dart';
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

  static AppBar appbar(
      {String title = '', VoidCallback? onBack, bool withBackAction = false}) {
    return AppBar(
      backgroundColor: ColorsUtil.primaryBg,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      leading: withBackAction
          ? InkWell(
              onTap: onBack,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )
          : null,
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

    String formattedDate =
        DateFormat('dd MMMM yyyy kk:mm ').format(dateTimeWithTimeZone);
    print(formattedDate);
    return formattedDate;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:veegil/api/services/resources/managers/session_manager.dart';

// TODO: Delete this file
class Services {
  // scaffold messenger
  scaffold({message, context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          }),
    ));
  }

  alertDialog({context, title, content}) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  // date format
  String formatDate(date) {
    final formattedDate = DateFormat('dd / MM / yyyy hh:mm aa');
    final outputDate = formattedDate.format(date);
    return outputDate;
  }

  String formatPrice({context, amount}) {
    final f = NumberFormat('#,##,##,###,##0');
    // var f = NumberFormat("#,##0");
    // var format =
    //     NumberFormat.simpleCurrency(locale: Platform.localeName, name: '₦');
    final String formattedAmount = f.format(amount);
    final String newAmount = 'NGN $formattedAmount';
    // String newAmount = '${format.currencySymbol}$formatedAmount';

    return newAmount;
  }

  //appwide sizedbox
  Widget sizedBox({double? h, double? w}) {
    return SizedBox(
      height: h ?? 0,
      width: w ?? 0,
    );
  }

  // logo
  Widget logo(double? size, Color? color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'V',
          style: TextStyle(
            fontFamily: 'OpenSans-Bold',
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.deepOrangeAccent,
          ),
        ),
        Text(
          'EE ',
          style: TextStyle(
            fontFamily: 'Signatra',
            fontSize: size! - 20.0,
            color: color ?? Colors.deepOrangeAccent,
          ),
        ),
        Text(
          'Bank',
          style: TextStyle(
            fontFamily: 'OpenSans-Regular',
            fontSize: size - 10.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // plain app bar
  PreferredSizeWidget? simpleAppBar({
    String? title,
    context,
  }) {
    return AppBar(
      leading: CircleAvatar(
        radius: 8,
        backgroundColor: Colors.grey.shade100,
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.grey),
      title: Text(title!, style: const TextStyle(color: Colors.black)),
    );
  }

  // app bar
  PreferredSizeWidget? appBar({String? title, IconData? logout, context}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.grey),
      centerTitle: true,
      title: Text(title!, style: const TextStyle(color: Colors.black)),
      actions: [
        IconButton(
            onPressed: () {
              SessionManager.logout();
            },
            icon: Stack(
              children: [
                CircleAvatar(radius: 18, child: Icon(logout, color: Colors.white)),
              ],
            )),
      ],
    );
  }

  getFormattedDateFromFormattedString(
      {required value, required String currentFormat, required String desiredFormat, isUtc = false}) {
    DateTime? dateTime = DateTime.now();
    if (value != null || value.isNotEmpty) {
      try {
        dateTime = DateFormat.yMMMd(desiredFormat).parse(value, isUtc);
      } catch (e) {
        if (kDebugMode) {
          print('$e');
        }
      }
    }
    return dateTime;
  }
}

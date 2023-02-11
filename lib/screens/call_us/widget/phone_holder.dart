import 'package:basic_project/helper/helper_export.dart';
import 'package:basic_project/widgets/widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneHolder extends StatelessWidget {
  final String phone;
  const PhoneHolder({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: phone));
                myCustomShowSnackBarText(context, "تم نسخ الرقم");
              },
              icon: const Icon(
                Icons.copy,
                color: Colors.white,
              )),
          Text(
            formatPhone(phone),
            style: const TextStyle(color: Colors.white, fontSize: 22),
            textDirection: TextDirection.ltr,
          ),
          IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse("tel://$phone"));
              },
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              )),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse("whatsapp://send?phone=$phone"));
            },
            child: Image.asset(
              AppAssets.whatsApp,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}

String formatPhone(String phone) {
  String formatted = "";
  for (int i = 0; i < phone.length; i++) {
    if (i == 4) {
      formatted += "  ";
    }
    if (i == 7) {
      formatted += '-';
    }
    formatted += phone[i];
  }
  return formatted;
}

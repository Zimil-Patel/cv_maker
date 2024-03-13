import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/resulabe_ui/text_styles.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        contactList(contact: '+91 7041859422', img: 'call'),
        contactList(contact: 'patelzimil2310@gmail.com', img: 'mail'),
      ],
    );
  }

  contactList({required String img, required String contact}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: resumeColor,
              child: SizedBox(
                height: 10,
                width: 10,
                child: Image.asset('asset/images/resume/$img.png'),
              ),
            ),
          ),
          Expanded(
            child: Text(
              contact,
              style: resumeBody(bold: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}

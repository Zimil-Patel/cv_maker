import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/resulabe_ui/text_styles.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            'Contact',
            style: miniText(
              color: resumeColor,
            ),
          ),
          Divider(
            color: resumeColor,
            indent: 60,
            endIndent: 60,
          ),
          contactList(contact: '+91 7041859422', img: 'call'),
          contactList(contact: 'patelzimil2310@gmail.com', img: 'mail'),
          contactList(
              contact:
                  '303-B, sundaram siddhi vinayak, sachin char rasta, surat, gujarat, 394230',
              img: 'home'),
          contactList(contact: 'https://github.com/Zimil-Patel', img: 'github'),
        ],
      ),
    );
  }

  contactList({required String img, required String contact}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                contact,
                style: resumeBody(bold: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

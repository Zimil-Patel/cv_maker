import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          color: resumeColor,
          child: FittedBox(
            child: Text(
              'Education',
              style: ultraMiniText(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addEducation(
                university: 'Borcelle University',
                course: 'Bachelor of Business Management',
                duration: '2014-2023',
              ),
              addEducation(
                university: 'Borcelle University',
                course: 'Master of Business Management',
                duration: '2014-2018',
              ),
            ],
          ),
        ),
      ],
    );
  }

  addEducation({
    required String university,
    required String course,
    required String duration,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          university,
          style: resumeBody(
            fontSize: 9.5,
            bold: FontWeight.w700,
          ),
        ),
        Text(
          course,
          style: resumeBody(
            fontSize: 9.5,
          ),
        ),
        Text(
          '$duration\n',
          style: resumeBody(
            fontSize: 9.5,
          ),
        ),
      ],
    );
  }
}

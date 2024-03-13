import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/resulabe_ui/text_styles.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About Me',
          style: miniText(
            color: resumeColor,
          ),
        ),
        Divider(
          color: resumeColor,
          indent: 50,
          endIndent: 50,
        ),
        Text(
          textAlign: TextAlign.center,
          softWrap: true,
          'Aspiring UI designer with a strong foundation in user interface design principles and a passion for creating seamless digital experiences. Eager to leverage creativity, problem-solving skills and a user-centered design approach to contribute to the world of UI design.',
          style: resumeBody(
            bold: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

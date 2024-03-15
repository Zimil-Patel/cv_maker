import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/resulabe_ui/text_styles.dart';
import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({
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
              'Skills Summary'.toUpperCase(),
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
              addSkills(
                skillName: 'Design Process',
                percentage: 78,
              ),
              addSkills(
                skillName: 'Project Management',
                percentage: 81,
              ),
            ],
          ),
        ),
      ],
    );
  }

  addSkills({
    required String skillName,
    required double percentage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 14,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$skillName  ',
                style: resumeBody(),
              ),
              SizedBox(
                width: 60,
                height: 4,
                child: LinearProgressIndicator(
                  color: resumeColor,
                  backgroundColor: resumeColor.withOpacity(0.1),
                  value: percentage / 100,
                ),
              ),
              Text(
                '  ${percentage.toStringAsFixed(0)} %',
                style: resumeBody(
                  fontSize: 11,
                  bold: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({
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
              'EXPERIENCE',
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
              addExperience(
                  company: 'Studio Showde',
                  location: 'Canberra - Australia',
                  duration: '2020-2022',
                  aboutExp:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet quam rhoncus, egestas dui eget, malesuada justo. Ut aliquam augue.'),
              addExperience(
                  company: 'Elsetown Cor.',
                  location: 'Kota Baru - Singapore',
                  duration: '2016-2020',
                  aboutExp:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet quam rhoncus, egestas dui eget, malesuada justo. Ut aliquam augue.'),
              addExperience(
                  company: 'Studio Showde',
                  location: 'sydney - Australia',
                  duration: '2010 - 2015',
                  aboutExp:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet quam rhoncus, egestas dui eget, malesuada justo. Ut aliquam augue.'),
            ],
          ),
        ),
      ],
    );
  }

  addExperience(
      {required String company,
      required String location,
      required String duration,
      required String aboutExp}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company,
          style: resumeBody(
            fontSize: 9.5,
            bold: FontWeight.w700,
          ),
        ),
        Text(
          location,
          style: resumeBody(
            fontSize: 9.5,
            bold: FontWeight.w700,
          ),
        ),
        Text(
          duration,
          style: resumeBody(
            fontSize: 9.5,
            bold: FontWeight.w700,
          ),
        ),
        Text(
          '$aboutExp \n',
          style: resumeBody(),
        ),
      ],
    );
  }
}

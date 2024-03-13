import 'package:cv_maker/screens/components/resume_components/about_me.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/resulabe_ui/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileNameBanner extends StatelessWidget {
  const ProfileNameBanner({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: height / 5.8,
              width: width / 2.8,
              child: Stack(
                children: [
                  Container(
                    height: (height / 5.8) / 1.5,
                    width: (width / 2.8) / 1.5,
                    decoration: BoxDecoration(
                      color: resumeColor,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: (height / 5.8) / 1.3,
                      width: (width / 2.8) / 1.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 6),
                      ),
                      child: CircleAvatar(
                        backgroundColor: resumeColor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'asset/images/resume/profile.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RICHARD\n   SANCHEZ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: resumeColor,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Product Designer',
                      style: ultraMiniText(
                        color: resumeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              height: height / 10,
              width: 50,
              decoration: BoxDecoration(
                color: componentColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  topLeft: Radius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

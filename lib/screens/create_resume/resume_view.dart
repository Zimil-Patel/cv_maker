import 'package:cv_maker/screens/components/resume_components/about_me.dart';
import 'package:cv_maker/screens/components/resume_components/contact_info.dart';
import 'package:cv_maker/screens/components/resume_components/expertise_box.dart';
import 'package:cv_maker/screens/components/resume_components/language_box.dart';
import 'package:cv_maker/screens/components/resume_components/profile_name_banner.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:flutter/material.dart';

class ResumeView extends StatefulWidget {
  const ResumeView({super.key});

  @override
  State<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends State<ResumeView> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              //TOP BANNE INCLUDIND USER PROFILE NAME AND ROLE
              ProfileNameBanner(height: height, width: width),

              Expanded(
                child: Stack(
                  children: [
                    Container(
                      color: greyBox,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    //About us Box
                                    const AboutMe(),

                                    //CONTACT BOX
                                    const ContactInfo(),

                                    //LANGUAGE BOX
                                    LanguagesKnow(width: width),

                                    //EXPERTISE BOX
                                    ExpertiseIn(width: width),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        height: height / 10,
                        width: 50,
                        decoration: BoxDecoration(
                          color: componentColor,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}


// Container(
//                                   margin: const EdgeInsets.only(bottom: 60),
//                                   height: height / 10,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: componentColor,
//                                     borderRadius: const BorderRadius.only(
//                                       bottomRight: Radius.circular(100),
//                                       topRight: Radius.circular(100),
//                                     ),
//                                   ),
//                                 ),
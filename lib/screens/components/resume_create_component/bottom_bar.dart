import 'dart:async';

import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/screens/create_resume_ui/create_resume.dart';
import 'package:cv_maker/util/classes.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.width,
    required this.currentIndex,
    required this.update,
  });

  final int currentIndex;
  final double width;
  final ValueChanged<int> update;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

bool isAdded = false;
bool isSaved = false;

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    isSaved = false;
    return Container(
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        color: primaryBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 50,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CupertinoButton(
            onPressed: () {
              saveData();
            },
            padding: EdgeInsets.zero,
            child: Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: boxColor,
                ),
                child: Text(
                  'Save All',
                  style: normalText(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          CupertinoButton(
            onPressed: () {
              if (widget.currentIndex < 6) {
                int index = widget.currentIndex + 1;

                widget.update(index);
              } else {
                saveData();
                if (isAdded == false && isSaved == true) {
                  //copying object
                  ResumeData obj = ResumeData();
                  obj.firstName = resumeData.firstName;
                  obj.lastName = resumeData.lastName;
                  obj.profession = resumeData.profession;
                  obj.gender = resumeData.gender;
                  obj.objective = resumeData.objective;
                  obj.img = resumeData.img;
                  obj.contact.addAll(resumeData.contact);
                  obj.languages.addAll(resumeData.languages);
                  obj.expertise.addAll(resumeData.expertise);
                  obj.experience.addAll(resumeData.experience);
                  obj.education.addAll(resumeData.education);
                  obj.skills.addAll(resumeData.skills);
                  obj.showGithub = resumeData.showGithub;
                  obj.resumetitle = resumeData.resumetitle;
                  users[currentUser]['data'].add(obj);
                  isAdded = true;
                }

                if (isSaved && isAdded) {
                  currentObj = users[currentUser]['data'].length - 1;
                  Navigator.pushNamed(context, '/resume');
                }
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: primaryDark,
              ),
              child: Row(
                children: [
                  Text(
                    widget.currentIndex == 6 ? 'Preview' : 'Next Step',
                    style: normalText(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_circle_right,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  saveData() {
    if (resumeData.txtFirstName.text.isEmpty ||
        resumeData.txtLastName.text.isEmpty ||
        resumeData.txtObjective.text.isEmpty ||
        resumeData.txtProfession.text.isEmpty ||
        resumeData.txtMobile.text.isEmpty ||
        resumeData.txtEmail.text.isEmpty ||
        resumeData.txtAddress.text.isEmpty ||
        imgPath == null ||
        (resumeData.showGithub == true && resumeData.txtGithub.text.isEmpty)) {
      Fluttertoast.showToast(
          msg: "Please fill all details!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(0.6),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      resumeData.resumetitle = resumeData.txtTitle.text == ''
          ? 'Untitled'
          : resumeData.txtTitle.text;

      resumeData.firstName = resumeData.txtFirstName.text;
      resumeData.lastName = resumeData.txtLastName.text;
      resumeData.profession = resumeData.txtProfession.text;
      resumeData.objective = resumeData.txtObjective.text;
      resumeData.gender = genderValue == 0 ? 'Male' : 'Female';

      resumeData.languages.clear();
      resumeData.languages =
          resumeData.languageControllerList.map((e) => e.text).toList();

      resumeData.languages.clear();
      resumeData.languages =
          resumeData.languageControllerList.map((e) => e.text).toList();

      resumeData.expertise.clear();
      resumeData.expertise =
          resumeData.expertiseControllerList.map((e) => e.text).toList();

      resumeData.contact.clear();
      resumeData.contact.add(resumeData.txtMobile.text);
      resumeData.contact.add(resumeData.txtEmail.text);
      resumeData.contact.add(resumeData.txtAddress.text);
      resumeData.contact.add(resumeData.txtGithub.text);

      resumeData.experience.clear();
      for (int i = 0; i < resumeData.experienceControllerList.length; i++) {
        Map map = {
          'company': resumeData.experienceControllerList[i]['company'].text,
          'location': resumeData.experienceControllerList[i]['location'].text,
          'year': resumeData.experienceControllerList[i]['year'].text,
          'about': resumeData.experienceControllerList[i]['about'].text,
        };

        resumeData.experience.add(map);
      }

      resumeData.education.clear();
      for (int i = 0; i < resumeData.educationControllerList.length; i++) {
        Map map = {
          'university':
              resumeData.educationControllerList[i]['university'].text,
          'degree': resumeData.educationControllerList[i]['degree'].text,
          'year': resumeData.educationControllerList[i]['year'].text,
        };

        resumeData.education.add(map);
      }

      resumeData.skills.clear();
      for (int i = 0; i < resumeData.skillControllerList.length; i++) {
        Map map = {
          'skill': resumeData.skillControllerList[i]['skill'].text,
          'percentage':
              int.parse(resumeData.skillControllerList[i]['percentage'].text),
        };

        resumeData.skills.add(map);

        resumeData.img = imgPath;
      }

      Fluttertoast.showToast(
          msg: "Saved!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: primaryDark.withOpacity(0.6),
          textColor: Colors.white,
          fontSize: 16.0);

      isSaved = true;
    }
  }
}

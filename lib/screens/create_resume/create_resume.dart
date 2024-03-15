import 'package:cv_maker/screens/components/resume_create_component/app_bar.dart';
import 'package:cv_maker/screens/components/resume_create_component/tab_list.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateResume extends StatefulWidget {
  const CreateResume({super.key});

  @override
  State<CreateResume> createState() => _CreateResumeState();
}

int selIndex = 0;

class _CreateResumeState extends State<CreateResume> {
  late double height, width;
  void _update(int newValue) {
    setState(() => selIndex = newValue);
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: SafeArea(
        child: Column(
          children: [
            //CUSTOM APP BAR
            const TopBar(),

            const SizedBox(
              height: 10,
            ),

            //ALL FIELD/TAB LIST
            TabList(
              currentIndex: selIndex,
              update: _update,
            ),
          ],
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}

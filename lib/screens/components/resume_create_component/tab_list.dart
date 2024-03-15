import 'package:cv_maker/screens/create_resume/create_resume.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/ui_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabList extends StatelessWidget {
  const TabList({
    super.key,
    required this.currentIndex,
    required this.update,
  });

  final int currentIndex;
  final ValueChanged<int> update;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            List.generate(tabList.length, (index) => addList(index: index)),
      ),
    );
  }

  Row addList({required int index}) {
    return Row(
      children: [
        index != 0
            ? Container(
                height: 1,
                width: 10,
                color: Colors.grey,
              )
            : const SizedBox(
                width: 10,
              ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => update(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: selIndex == index ? primaryLight : Colors.grey.shade400,
                width: 1.5,
              ),
            ),
            child: Text(
              tabList[index],
              style: TextStyle(
                fontSize: 14,
                color: selIndex == index ? primaryLight : Colors.grey.shade400,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        index == tabList.length - 1
            ? const SizedBox(
                width: 10,
              )
            : const SizedBox()
      ],
    );
  }
}
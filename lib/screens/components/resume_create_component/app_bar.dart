import 'package:cv_maker/screens/components/common_component/text_styles.dart';
import 'package:cv_maker/util/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 14,
        ),
        Text(
          'Details',
          style: textStyle(),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: CircleAvatar(
            backgroundColor: primaryLight,
            radius: 8,
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 14,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          width: 130,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 36,
                  width: 110,
                  child: CupertinoButton(
                    pressedOpacity: 1,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    color: primaryLight,
                    child: Text(
                      'Premium',
                      style: miniText(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  '✨',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

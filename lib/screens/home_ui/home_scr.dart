import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:cv_maker/util/resulabe_ui/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late double height, width;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryLight,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
      ),

      drawer: customDrawer(),

      //APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: ClipRRect(
                child: Image.asset(
                  'asset/images/home/menu.png',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        }),
      ),

      //BODY
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //HEADING OF APP
              addHeading(),

              const SizedBox(
                height: 20,
              ),

              //top banner
              createResumeBox(),

              const SizedBox(
                height: 20,
              ),

              //resume records
              resumeList(),
            ],
          ),
        ),
      ),
    );
  }

  Column resumeList() {
    return Column(
      children: [
        ...List.generate(
          users[currentUser]['data'].length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: BoxDecoration(
              color: greyBox,
              borderRadius: BorderRadius.circular(12),
            ),
            child: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: ClipRRect(
                      child: Image.asset(
                        'asset/images/home/file.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users[0]['data'][index]['title'],
                            style: miniText(bold: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${users[0]['data'][index]['date']['day']} ${users[0]['data'][index]['date']['month']} ${users[0]['data'][index]['date']['year']}',
                            style: ultraMiniText(bold: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  //resume box
  Container createResumeBox() {
    return Container(
      width: width,
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryLight,
            primaryDark,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(
              'asset/images/home/img1.png',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset('asset/images/home/img2.png'),
                  ),
                  Column(
                    children: [
                      Text(
                        'CREATE RESUME',
                        style: normalText(color: Colors.white),
                      ),
                      FittedBox(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Create good resume so that you can have a good experience',
                          style: ultraMiniText(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //DIVIDER
  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
      child: Divider(
        color: Color(0xff4f5054),
        height: 1,
      ),
    );
  }

  //HEADING OF APP
  addHeading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resume Maker!',
            style: GoogleFonts.varelaRound(
              textStyle: textStyle(),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Build a winning resume in minutes',
            style: GoogleFonts.varela(
              textStyle: normalText(),
            ),
          ),
        ],
      ),
    );
  }

  //CUSTOM DRAWER
  customDrawer() {
    return Container(
      height: height,
      width: width / 1.5,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 50, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 40,
                    child: Image.asset('asset/images/home/user.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome!',
                    style: GoogleFonts.varelaRound(
                      textStyle: textStyle(),
                    ),
                  ),
                  Text(
                    users[currentUser]['name'],
                    style: GoogleFonts.varelaRound(
                      textStyle: normalText(),
                    ),
                  ),
                  Text(
                    users[currentUser]['email'],
                    style: GoogleFonts.varelaRound(
                      textStyle: miniText(),
                    ),
                  ),
                ],
              ),
            ),
            divider(),
            CupertinoButton(
              onPressed: () {
                isLoggedin = false;
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Logout',
                      style: normalText(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

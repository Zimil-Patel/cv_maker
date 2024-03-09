import 'package:cv_maker/util/colors/colors.dart';
import 'package:cv_maker/util/lists/users_data.dart';
import 'package:cv_maker/util/resulabe_ui/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

late double height;
late double width;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController txtEmail = TextEditingController();
TextEditingController txtPass = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtLoginEmail = TextEditingController();
TextEditingController txtLoginPass = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  bool isOnLogin = users.isEmpty ? false : true;
  bool showPass = false;
  String? email;
  String? pass;
  String? name;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //images and text
              topImg(),

              //login text and box
              isOnLogin ? loginBox() : registerBox(),

              dividerText(),

              //google sign in button
              googleSigninBtn(),

              //register text
              isOnLogin ? registerTxt() : loginTxt(),
            ],
          ),
        ),
      ),
    );
  }

  //top image
  topImg() {
    return Center(
      child: ClipRRect(
        child: Image.asset(
          'asset/images/loginRegister/loginImg.png',
          height: 250,
        ),
      ),
    );
  }

  //login text and box
  loginBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //login text
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Text(
            'Login',
            style: GoogleFonts.varelaRound(textStyle: textStyle()),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //email pass textbox
        BlurryContainer(
          blur: 5,
          elevation: 10,
          color: Colors.grey.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                //email input  box
                Row(
                  children: [
                    //email icon
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),

                    //email input
                    Expanded(
                      child: TextField(
                        controller: txtLoginEmail,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        style: inputTextStyle(),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //password input box
                Row(
                  children: [
                    //lock icon
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.lock_rounded,
                        color: Colors.grey,
                      ),
                    ),

                    //password input
                    Expanded(
                      child: TextField(
                        controller: txtLoginPass,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.white,
                        obscureText: showPass,
                        style: inputTextStyle(),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            child: Icon(
                              showPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //spacer between input box
                const SizedBox(
                  height: 14,
                ),

                //forgotpass text
                Align(
                  alignment: Alignment.bottomRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.varelaRound(
                          textStyle: miniText(blueColor)),
                    ),
                  ),
                ),

                //login Button
                loginBtn(),
              ],
            ),
          ),
        )
      ],
    );
  }

  //login button
  loginBtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          email = txtEmail.text.toLowerCase();
          pass = txtPass.text;

          if (email == "patelzimil2310@gmail.com" && pass == "Zimil1023@") {
            Navigator.pushReplacementNamed(context, '/home');
          }
        });
      },
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Text(
          'Login',
          style: GoogleFonts.varelaRound(
            textStyle: normalText(Colors.white),
          ),
        ),
      ),
    );
  }

  registerBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //login text
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Text(
            'Sign Up',
            style: GoogleFonts.varelaRound(textStyle: textStyle()),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //email pass textbox
        BlurryContainer(
          blur: 5,
          elevation: 10,
          color: Colors.grey.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                //name input  box
                Row(
                  children: [
                    //person icon
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),

                    //name input
                    Expanded(
                      child: TextField(
                        controller: txtName,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.white,
                        style: inputTextStyle(),
                        decoration: const InputDecoration(
                          hintText: 'Full name',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //email input  box
                Row(
                  children: [
                    //email icon
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),

                    //email input
                    Expanded(
                      child: TextField(
                        controller: txtEmail,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        style: inputTextStyle(),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //password input box
                Row(
                  children: [
                    //lock icon
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.lock_rounded,
                        color: Colors.grey,
                      ),
                    ),

                    //password input
                    Expanded(
                      child: TextField(
                        controller: txtPass,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.white,
                        obscureText: showPass,
                        style: inputTextStyle(),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            child: Icon(
                              showPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //spacer between input box
                const SizedBox(
                  height: 14,
                ),

                //forgotpass text
                Align(
                  alignment: Alignment.bottomRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.varelaRound(
                          textStyle: miniText(blueColor)),
                    ),
                  ),
                ),

                //sign up button
                signUpBtn(),
              ],
            ),
          ),
        )
      ],
    );
  }

  //loginb button
  signUpBtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          email = txtEmail.text.toLowerCase();
          pass = txtPass.text;
          name = txtName.text;

          if (email != '' && pass != '' && name != '') {
            Map map = {'name': '$name', 'email': '$email', 'pass': '$pass'};
            users.add(map);
            userLen++;
            const snackBar = SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                'Registered Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            txtEmail.clear();
            txtPass.clear();
            txtName.clear();
            isOnLogin = true;
          }
        });
      },
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.varelaRound(
            textStyle: normalText(Colors.white),
          ),
        ),
      ),
    );
  }

  //divider with text
  dividerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 0.2,
              width: width,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'OR',
              style: miniText(Colors.grey),
            ),
          ),
          Expanded(
            child: Container(
              height: 0.2,
              width: width,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //sign in button
  googleSigninBtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: SizedBox(
                height: 24,
                width: 24,
                child: ClipRect(
                  child:
                      Image.asset('asset/images/loginRegister/googleLogo.png'),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  'Login with Google',
                  style: GoogleFonts.varelaRound(
                    textStyle: normalText(Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //new here register
  registerTxt() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'New to resumeBuilder?',
            style: miniText(Colors.white),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                isOnLogin = false;
              });
            },
            child: Text(
              '  Register here',
              style: miniText(blueColor),
            ),
          )
        ]),
      ),
    );
  }

  loginTxt() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Already registered?',
            style: miniText(Colors.white),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                isOnLogin = true;
              });
            },
            child: Text(
              '  Login here',
              style: miniText(blueColor),
            ),
          )
        ]),
      ),
    );
  }
}
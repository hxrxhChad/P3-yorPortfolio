// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element
// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, unused_local_variable, use_build_context_synchronously

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yorportfolio/constants/constants.dart';
import 'package:yorportfolio/services/database-service.dart';
import 'package:yorportfolio/services/helper.dart';
import 'package:yorportfolio/services/new.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAvrSppkfQYpZrpDU0LfwwC1AiUru3oarE",
          appId: "1:676066148656:web:ce71b4a76e47f73fd808f5",
          messagingSenderId: "676066148656",
          projectId: "demotwo-b7e07",
          authDomain: "demotwo-b7e07.firebaseapp.com",
          storageBucket: "demotwo-b7e07.appspot.com",
          measurementId: "G-WSEG0T4F2E"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black)
            .copyWith(
              bodyText1: TextStyle(color: bodyTextColor),
              bodyText2: TextStyle(color: bodyTextColor),
            ),
      ),
      home: LoginPage(),
    );
    // home: InputPage());
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final fullname = TextEditingController();
  final bio = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final project1name = TextEditingController();
  final project2name = TextEditingController();
  final project3name = TextEditingController();
  final project1desc = TextEditingController();
  final project2desc = TextEditingController();
  final project3desc = TextEditingController();
  final skill1 = TextEditingController();
  final skill2 = TextEditingController();
  final skill3 = TextEditingController();
  final skill4 = TextEditingController();
  final language1 = TextEditingController();
  final language2 = TextEditingController();
  final language3 = TextEditingController();
  final language4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 320, right: 320, top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "yor", style: TextStyle(color: primaryColor)),
                      TextSpan(text: "Portfolio")
                    ])),
                  ),
                  Row(
                    children: [
                      Text(
                        "back",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black54),
                      ),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      GestureDetector(
                        onTap: () {
                          DatabaseHarsh.addItem(
                                  fullname: fullname.text,
                                  bio: bio.text,
                                  phone: phone.text,
                                  email: email.text,
                                  age: age.text,
                                  city: city.text,
                                  state: state.text,
                                  project1name: project1name.text,
                                  project2name: project2name.text,
                                  project3name: project3name.text,
                                  project1desc: project1desc.text,
                                  project2desc: project2desc.text,
                                  project3desc: project3desc.text,
                                  skill1: skill1.text,
                                  skill2: skill2.text,
                                  skill3: skill3.text,
                                  skill4: skill4.text,
                                  language1: language1.text,
                                  language2: language2.text,
                                  language3: language3.text,
                                  language4: language4.text)
                              .whenComplete(() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OutputPage(
                                            id: phone.text,
                                          ))));
                        },
                        child: Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: bodyTextColor.withOpacity(0.1)),
                          child: Center(
                            child: Text(
                              "submit all",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 87, left: 320, right: 320),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BUILD YOUR PORTFOLIO",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: blueColor),
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Enter your Details\n",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.black,
                          fontSize: 57,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "inside the ",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.black,
                          fontSize: 57,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "<",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: blueColor,
                          fontSize: 57,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "field",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.black,
                          fontSize: 57,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ">",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: blueColor,
                          fontSize: 57,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " to",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.black,
                          fontSize: 57,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Text(
                    "Get a wonderful portfolio, with a very minimum effort.",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.black87),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 320, vertical: defaultPadding * 1.5),
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: 1000,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Material(
                        elevation: 7,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 480,
                          width: 880,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Material(
                        elevation: 7,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 480,
                          width: 880,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(defaultPadding),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "YOUR PERSONAL DETAILS",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: blueColor),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 2,
                                      ),
                                      Text(
                                        "Enter your personal details, \nthat will be displayed as a \nheading to your portfolio.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 2,
                                      ),
                                      SizedBox(
                                        height: 200,
                                        width: 300,
                                        child: SvgPicture.asset(
                                          "assets/apple.svg",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.black26,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //textfields
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding / 4),
                                        child: SizedBox(
                                          height: 35,
                                          width: 250,
                                          child: TextFormField(
                                            controller: fullname,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: blueColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  AntIcons.userOutlined,
                                                  color: Colors.black54,
                                                  size: 16),
                                              labelText: "Full name",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black54),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding / 4),
                                        child: SizedBox(
                                          height: 35,
                                          width: 250,
                                          child: TextFormField(
                                            controller: bio,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: blueColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  AntIcons.bookOutlined,
                                                  color: Colors.black54,
                                                  size: 16),
                                              labelText: "Bio",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black54),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding / 4),
                                        child: SizedBox(
                                          height: 35,
                                          width: 250,
                                          child: TextFormField(
                                            controller: phone,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: blueColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  AntIcons.phoneOutlined,
                                                  color: Colors.black54,
                                                  size: 16),
                                              labelText: "Phone number",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black54),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding / 4),
                                        child: SizedBox(
                                          height: 35,
                                          width: 250,
                                          child: TextFormField(
                                            controller: email,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: blueColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  AntIcons.mailOutlined,
                                                  color: Colors.black54,
                                                  size: 16),
                                              labelText: "Email id",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black54),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding / 4),
                                        child: SizedBox(
                                          height: 35,
                                          width: 250,
                                          child: TextFormField(
                                            controller: age,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: blueColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  AntIcons.qqOutlined,
                                                  color: Colors.black54,
                                                  size: 16),
                                              labelText: "Age",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black54),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding / 4),
                                        child: SizedBox(
                                          height: 35,
                                          width: 250,
                                          child: TextFormField(
                                            controller: city,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: blueColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  AntIcons.coffeeOutlined,
                                                  color: Colors.black54,
                                                  size: 16),
                                              labelText: "City",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black54),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: defaultPadding / 4),
                                        child: SizedBox(
                                          height: 35,
                                          width: 250,
                                          child: TextFormField(
                                            controller: state,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: blueColor),
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                  AntIcons.carOutlined,
                                                  color: Colors.black54,
                                                  size: 16),
                                              labelText: "State",
                                              labelStyle: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      color: Colors.black54),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.black38)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: defaultPadding, top: defaultPadding * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "PROJECT SECTION",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.deepOrange),
                  ),
                  Text(
                    "Enter your project details",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.black,
                        fontSize: 57,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "( BEST THREE )",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 11, color: Colors.black45),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Positioned(
                    right: 0,
                    child: SizedBox(
                      height: 500,
                      width: 800,
                      child: Image.asset("assets/glass.jpg"),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: defaultPadding * 4, top: defaultPadding * 2),
                      child: SizedBox(
                          height: 500,
                          width: 800,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black38,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Icon(AntIcons.cloudUploadOutlined,
                                          size: 30, color: Colors.black38),
                                    ),
                                  ),
                                  SizedBox(
                                    width: defaultPadding,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " PROJECT-1",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: blueColor),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 6,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width: 250,
                                        child: TextFormField(
                                          controller: project1name,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: blueColor),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                AntIcons.fileAddOutlined,
                                                color: Colors.black54,
                                                size: 16),
                                            labelText: "Project name",
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: Colors.black54),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black38)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black38)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 6,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: defaultPadding,
                                  ),
                                  SizedBox(
                                    height: 65,
                                    width: 250,
                                    child: TextFormField(
                                      controller: project1desc,
                                      maxLines: null,
                                      expands: true,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: blueColor),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                            AntIcons.fileAddOutlined,
                                            color: Colors.black54,
                                            size: 16),
                                        labelText: "Project description",
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.black54),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black38,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Icon(AntIcons.cloudUploadOutlined,
                                          size: 30, color: Colors.black38),
                                    ),
                                  ),
                                  SizedBox(
                                    width: defaultPadding,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " PROJECT-2",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: blueColor),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 6,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width: 250,
                                        child: TextFormField(
                                          controller: project2name,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: blueColor),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                AntIcons.fileAddOutlined,
                                                color: Colors.black54,
                                                size: 16),
                                            labelText: "Project name",
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: Colors.black54),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black38)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black38)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 6,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: defaultPadding,
                                  ),
                                  SizedBox(
                                    height: 65,
                                    width: 250,
                                    child: TextFormField(
                                      controller: project2desc,
                                      maxLines: null,
                                      expands: true,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: blueColor),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                            AntIcons.fileAddOutlined,
                                            color: Colors.black54,
                                            size: 16),
                                        labelText: "Project description",
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.black54),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black38,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Icon(AntIcons.cloudUploadOutlined,
                                          size: 30, color: Colors.black38),
                                    ),
                                  ),
                                  SizedBox(
                                    width: defaultPadding,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " PROJECT-3",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: blueColor),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 6,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width: 250,
                                        child: TextFormField(
                                          controller: project3name,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: blueColor),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                AntIcons.fileAddOutlined,
                                                color: Colors.black54,
                                                size: 16),
                                            labelText: "Project name",
                                            labelStyle: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: Colors.black54),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black38)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black38)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: defaultPadding / 6,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: defaultPadding,
                                  ),
                                  SizedBox(
                                    height: 65,
                                    width: 250,
                                    child: TextFormField(
                                      controller: project3desc,
                                      maxLines: null,
                                      expands: true,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: blueColor),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                            AntIcons.fileAddOutlined,
                                            color: Colors.black54,
                                            size: 16),
                                        labelText: "Project description",
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.black54),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 320, vertical: defaultPadding),
              child: Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 7,
                  shadowColor: darkColor,
                  child: Container(
                    height: 500,
                    width: 900,
                    decoration: BoxDecoration(
                        color: darkColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "SUBMIT YOUR SKILLS (ANY FOUR)",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.greenAccent),
                            ),
                            Text(
                              "Skills & Languages",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 57,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Whether you're a professional or a graduate, in your job hunt, your skills matter. They tell potential employers what you can do, how you can do it, and even who you are.",
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.white54),
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: skill1,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.greenAccent, size: 16),
                                      labelText: "SKILL-1",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.greenAccent),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: defaultPadding / 2,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: skill2,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.greenAccent, size: 16),
                                      labelText: "SKILL-2",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.greenAccent),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: defaultPadding / 2),
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: skill3,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.greenAccent, size: 16),
                                      labelText: "SKILL-3",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.greenAccent),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: defaultPadding / 2,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: skill4,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.greenAccent, size: 16),
                                      labelText: "SKILL-4",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.greenAccent),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.greenAccent)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: defaultPadding,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: language1,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.orange, size: 16),
                                      labelText: "Language-1",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.orange),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: defaultPadding / 2,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: language2,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.orange, size: 16),
                                      labelText: "Language-2",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.orange),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: defaultPadding / 2),
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: language3,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.orange, size: 16),
                                      labelText: "Language-3",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.orange),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: defaultPadding / 2,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 170,
                                  child: TextFormField(
                                    controller: language4,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(color: blueColor),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(AntIcons.sketchOutlined,
                                          color: Colors.orange, size: 16),
                                      labelText: "Language-4",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(color: Colors.orange),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.orange)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: defaultPadding * 2.5,
                            ),
                            Text(
                              "I would recommend making sure you are prepared to use these tools.",
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.white54),
                            )
                          ]),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: defaultPadding, bottom: defaultPadding),
              child: SizedBox(
                height: 400,
                width: 600,
                child: Stack(
                  children: [
                    Image.asset("assets/conver.jpg"),
                    Positioned(
                        bottom: 0,
                        left: 190,
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          elevation: 10,
                          shadowColor: darkColor,
                          child: GestureDetector(
                            onTap: () {
                              //SUBMIT FNs
                              DatabaseHarsh.addItem(
                                      fullname: fullname.text,
                                      bio: bio.text,
                                      phone: phone.text,
                                      email: email.text,
                                      age: age.text,
                                      city: city.text,
                                      state: state.text,
                                      project1name: project1name.text,
                                      project2name: project2name.text,
                                      project3name: project3name.text,
                                      project1desc: project1desc.text,
                                      project2desc: project2desc.text,
                                      project3desc: project3desc.text,
                                      skill1: skill1.text,
                                      skill2: skill2.text,
                                      skill3: skill3.text,
                                      skill4: skill4.text,
                                      language1: language1.text,
                                      language2: language2.text,
                                      language3: language3.text,
                                      language4: language4.text)
                                  .whenComplete(() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OutputPage(
                                                id: phone.text,
                                              ))));
                            },
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: darkColor),
                              child: Center(
                                child: Text(
                                  "SUMBIT ALL",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OutputPage extends StatefulWidget {
  const OutputPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;
  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  String? fullname = "";
  String? bio = "";
  String? phone = "";
  String? email = "";
  String? age = "";
  String? city = "";
  String? state = "";
  String? project1name = "";
  String? project2name = "";
  String? project3name = "";
  String? project1desc = "";
  String? project2desc = "";
  String? project3desc = "";
  String? skill1 = "";
  String? skill2 = "";
  String? skill3 = "";
  String? skill4 = "";
  String? language1 = "";
  String? language2 = "";
  String? language3 = "";
  String? language4 = "";

  // FETCH DATA FROM DATABASE
  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection('details')
        .doc(widget.id)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          fullname = snapshot.data()!['fullname'];
          bio = snapshot.data()!['bio'];
          phone = snapshot.data()!['phone'];
          email = snapshot.data()!['email'];
          age = snapshot.data()!['age'];
          city = snapshot.data()!['city'];
          state = snapshot.data()!['state'];
          project1name = snapshot.data()!['project1name'];
          project2name = snapshot.data()!['project2name'];
          project3name = snapshot.data()!['project3name'];
          project1desc = snapshot.data()!['project1desc'];
          project2desc = snapshot.data()!['project2desc'];
          project3desc = snapshot.data()!['project3desc'];
          skill1 = snapshot.data()!['skill1'];
          skill2 = snapshot.data()!['skill2'];
          skill3 = snapshot.data()!['skill3'];
          skill4 = snapshot.data()!['skill4'];
          language1 = snapshot.data()!['language1'];
          language2 = snapshot.data()!['language2'];
          language3 = snapshot.data()!['language3'];
          language4 = snapshot.data()!['language4'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 320, right: 320, top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "yor", style: TextStyle(color: primaryColor)),
                  TextSpan(text: "Portfolio")
                ])),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Update",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding / 1.5,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Profile",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                    child: Container(
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: bodyTextColor.withOpacity(0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            AntIcons.searchOutlined,
                            color: Colors.black,
                            size: 13,
                          ),
                          SizedBox(
                            width: defaultPadding / 4,
                          ),
                          Text(
                            "search",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: bodyTextColor.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding / 4),
                        child: Icon(AntIcons.logoutOutlined,
                            size: 10, color: Colors.black),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 320, right: 320, top: 87),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO THE PORTFOLIO OF",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: blueColor),
              ),
              Text(
                fullname!,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 57,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                bio!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.black45),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 320, right: 320, top: 87),
            child: Material(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70)),
              elevation: 7,
              shadowColor: darkColor,
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    width: 700,
                    decoration: BoxDecoration(
                        // color: darkColor,
                        image: DecorationImage(
                            image: AssetImage("assets/girl.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70),
                            bottomLeft: Radius.circular(70))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.green),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${age!}' Age",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: Colors.white, fontSize: 20)),
                            SizedBox(height: defaultPadding / 8),
                            Text("${city!}, ${state!}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: Colors.white, fontSize: 16)),
                          ],
                        )),
                  ),
                ],
              ),
            )),
        Padding(
          padding: EdgeInsets.only(top: 77),
          child: Material(
            elevation: 20,
            shadowColor: darkColor,
            child: Container(
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(color: darkColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 200, vertical: 80),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "MY SKILLS",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              "Know my skills & Knowledge.",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                            ),
                            Text(
                              "Skill is the knowledge and ability that enables you to do something well.The cut of a diamond depends on the skill of its craftsman. ",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.white38),
                            ),
                            SizedBox(
                              height: defaultPadding * 1.4,
                            ),
                            Container(
                                height: 300,
                                width: 450,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40)),
                                    image: DecorationImage(
                                        image: AssetImage("assets/skill.jpg"),
                                        fit: BoxFit.cover)))
                          ],
                        ),
                      ),
                      VerticalDivider(color: Colors.white24),
                      Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.only(left: defaultPadding),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("SOFT SKILLS",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          color:
                                                              Colors.white70)),
                                              Text("99%",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          fontSize: 70,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "I have several academis as well as\npersonality skills,that definetly\nhelps me build my confidence and\nprepares me for any\nchallenging things out there.\nSome of these are - Leadership, \nTeamwork,etc",
                                                  maxLines: 9,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          color:
                                                              Colors.white38)),
                                            ],
                                          )
                                        ],
                                      )),
                                  SizedBox(height: defaultPadding / 2),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 103, 65, 216)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: defaultPadding / 2,
                                              horizontal: defaultPadding),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("SKILL NO. 1",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 10)),
                                                  Text(skill1!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontSize: 27,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                  Text("SKILL NO. 2",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 10)),
                                                  Text(skill2!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontSize: 27,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("SKILL NO. 3",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 10)),
                                                  Text(skill3!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontSize: 27,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                  Text("SKILL NO. 4",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 10)),
                                                  Text(skill4!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              fontSize: 27,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: defaultPadding / 2),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white60)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: defaultPadding / 2,
                                              horizontal: defaultPadding),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "KNOWLEDGE",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                        color: Colors.white70,
                                                        fontSize: 10),
                                              ),
                                              Text(language1!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                              Text(
                                                "I know technologies like, ${language2!}, ${language3!}, ${language4!}, etc",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                        color: Colors.white54,
                                                        fontSize: 14),
                                              ),
                                              Text(
                                                "Learning Data Science now...",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                        color: Colors.white54,
                                                        fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ])),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 320, right: 320, top: 87),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PROJECT SECTION ---",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Colors.black54,
                            )),
                    Text("Check out my Projects",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.black54,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                    Text("--- 03",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black54, fontSize: 30)),
                  ]),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(color: darkColor),
                            ),
                            SizedBox(height: defaultPadding / 3),
                            Text(project1name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black)),
                            SizedBox(height: defaultPadding / 4),
                            Text(project1desc!,
                                maxLines: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black54)),
                          ])),
                  SizedBox(width: defaultPadding / 4),
                  Expanded(
                      flex: 1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(color: darkColor),
                            ),
                            SizedBox(height: defaultPadding / 3),
                            Text(project2name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black)),
                            SizedBox(height: defaultPadding / 4),
                            Text(project2desc!,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black54)),
                          ])),
                  SizedBox(width: defaultPadding / 4),
                  Expanded(
                      flex: 1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(color: darkColor),
                            ),
                            SizedBox(height: defaultPadding / 3),
                            Text(project3name!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black)),
                            SizedBox(height: defaultPadding / 4),
                            Text(project3desc!,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.black54)),
                          ])),
                ],
              ),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                top: defaultPadding * 2, bottom: defaultPadding * 2),
            child: SizedBox(
                height: 400,
                width: 600,
                child: Image.asset("assets/dino.jpg", fit: BoxFit.cover))),
        Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Text("THANKS FOR VISITING!",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.black54, fontSize: 20))),
      ]),
    ));
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 320, right: 320, top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "yor", style: TextStyle(color: primaryColor)),
                    TextSpan(text: "Portfolio")
                  ])),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Update",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding / 1.5,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Profile",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: bodyTextColor.withOpacity(0.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              AntIcons.searchOutlined,
                              color: Colors.black,
                              size: 13,
                            ),
                            SizedBox(
                              width: defaultPadding / 4,
                            ),
                            Text(
                              "search",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: bodyTextColor.withOpacity(0.1)),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding / 4),
                          child: Icon(AntIcons.logoutOutlined,
                              size: 10, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: defaultPadding * 2, left: 320, right: 320),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("WELCOME TO",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.deepOrangeAccent)),
                Text("Search Page",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 57)),
                Text(
                    "Search the particular portfolio using his yorPortfolio Phone Number.",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.black54)),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: defaultPadding * 2, left: 320, right: 320),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                  width: 370,
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    maxLength: null,
                    controller: search,
                    textAlignVertical: TextAlignVertical.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: blueColor),
                    decoration: InputDecoration(
                      prefixIcon: Icon(AntIcons.searchOutlined,
                          color: Colors.black45, size: 16),
                      labelText: "Phone",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black45)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black45)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                ),
                SizedBox(
                  height: defaultPadding / 2,
                ),
                Text("Enter the phone number to get...",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.black54)),
                SizedBox(height: defaultPadding),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 10,
                  shadowColor: darkColor,
                  child: GestureDetector(
                    onTap: () {
                      //SUBMIT FNs
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OutputPage(
                                    id: search.text,
                                  )));
                    },
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: darkColor),
                      child: Center(
                        child: Text(
                          "SUMBIT ALL",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: defaultPadding * 2),
              child: SizedBox(
                  height: 500,
                  width: 700,
                  child: Image.asset("assets/cycle.jpg", fit: BoxFit.cover))),
        ],
      )),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String phone = "";
  bool _isLoading = false;
  AuthService authService = AuthService();

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .logInwithEmailandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .getUserData(email);
          //SAVING THE VALUES TO OUR SHARED PREFERENCES
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OutputPage(
                        id: phone,
                      )));
        } else {
          showSnackBar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  createAccount() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailAndPassword(email, password)
          .then((value) async {
        if (value == true) {
          //SAVING THE VALUES TO OUR SHARED PREFERENCES
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InputPage()));
        } else {
          showSnackBar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: blueColor))
          : Form(
              key: formKey,
              child: Row(children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset("assets/pumpkin.jpg",
                                fit: BoxFit.cover)),

                        Text(
                          "Let's Log-in",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                        Text(
                          "Log-in to get back to yorPortfolio",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.black45),
                        ),
                        SizedBox(
                          height: defaultPadding * 1.5,
                        ),
                        SizedBox(
                          height: 35,
                          width: 270,
                          child: TextFormField(
                            // ON-CHANGE FN
                            onChanged: (value) {
                              setState(() {
                                phone = value;
                              });
                            },

                            //VALIDATION CHECK

                            validator: (value) {
                              if (value!.length < 10) {
                                return "Invalid Number";
                              } else {
                                return null;
                              }
                            },

                            textAlignVertical: TextAlignVertical.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: blueColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(AntIcons.searchOutlined,
                                  color: Colors.black45, size: 16),
                              labelText: "Phone",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black45),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        SizedBox(
                          height: 35,
                          width: 270,
                          child: TextFormField(
                            // ON-CHANGE FN
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },

                            //VALIDATION CHECK

                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                                      .hasMatch(value!)
                                  ? null
                                  : "Enter a valid Email";
                            },
                            textAlignVertical: TextAlignVertical.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: blueColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(AntIcons.profileOutlined,
                                  color: Colors.black45, size: 16),
                              labelText: "Email-id",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black45),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        SizedBox(
                          height: 35,
                          width: 270,
                          child: TextFormField(
                            // ON-CHANGE FN
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },

                            //VALIDATION CHECK

                            validator: (value) {
                              if (value!.length < 6) {
                                return "Password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                            textAlignVertical: TextAlignVertical.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: blueColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(AntIcons.lockOutlined,
                                  color: Colors.black45, size: 16),
                              labelText: "Password",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black45),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.black45)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        GestureDetector(
                          onTap: () {
                            login();
                          },
                          child: Container(
                            height: 35,
                            width: 270,
                            decoration: BoxDecoration(
                                color: darkColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Log-in",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(height: defaultPadding / 3),
                        GestureDetector(
                          onTap: () {
                            createAccount();
                          },
                          child: Container(
                            height: 35,
                            width: 270,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: darkColor,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Create Account",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: darkColor),
                            )),
                          ),
                        ),
                        // SizedBox(height: defaultPadding),
                        // SizedBox(
                        //     height: 200,
                        //     width: 200,
                        //     child: Image.asset("assets/pumpkin.jpg", fit: BoxFit.cover))
                      ],
                    )),
                Expanded(
                    flex: 9,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Material(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45)),
                        elevation: 10,
                        shadowColor: blueColor,
                        child: Container(
                          decoration: BoxDecoration(
                            color: darkColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                bottomRight: Radius.circular(45)),
                            image: DecorationImage(
                                image: AssetImage('assets/witch.jpg'),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding * 1.5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "yor",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: primaryColor,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        TextSpan(
                                            text: "Portfolio",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '"',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          "Experience our best ever made portfolio making website environment. You're just one click away to get a wonderful ui to your profile.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: 20,
                                              )),
                                      SizedBox(
                                        height: defaultPadding,
                                      ),
                                      Text(
                                        "- Harsh",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                      ),
                                      Text(
                                        "Flutter Developer",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Colors.white38,
                                            ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                    )),
              ]),
            ),
    );
  }
}

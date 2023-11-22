//TODO: Needs updation to show error messages when typing wrong emails
//snapshot alland vere nthenkilum upayogiknm or 1st userine login then check in snapshots and push new page

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'common_register.dart';
import 'components/bezierContainer.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'student_registration.dart';
//import 'components/constants.dart';

class Common_register extends StatefulWidget {
  Common_register({Key? key, this.title}) : super(key: key);

  final String? title;
  // final bool fromHomepage;

  @override
  _Common_registerState createState() => _Common_registerState();
}

//final _firestore = FirebaseFirestore.instance;

class _Common_registerState extends State<Common_register> {
  //final _auth = FirebaseAuth.instance;
  late String email, password, otp;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  int flag = 0;

  //Login logic if student -> take all docu from student user details, Compare with the user typed email,
  // If found -> Login the user else not
  //Same for faculty and admin
  //
  Widget _submitButton() {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Continue',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Zelect',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10)),
      ),
    );
  }

  String? _selectedOption = 'STUDENT';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email id',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true)),
                        Text(
                          'OTP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                            onChanged: (value) {
                              otp = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Color(0xfff3f3f4),
                                filled: true))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _submitButton(),
                  //_divider(),
                  //_facebookButton(),
                  SizedBox(height: height * .055),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}

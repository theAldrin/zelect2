import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Call extends StatelessWidget {
  String phoneno = '8590970319';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Text(
                    'Contact Us',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'images/phone.png',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Talk with our experts to get personalized guidance on which product to buy for free',
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: GestureDetector(
                  onTap: () async {
                    await FlutterPhoneDirectCaller.callNumber(phoneno);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(
                          4), // This adds the border radius
                    ),
                    child: Center(
                      child: Text(
                        'Call',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

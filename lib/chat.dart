import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StunningPage extends StatelessWidget {
  // Function to make a call
  _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stunning App'),
        elevation: 0, // removes shadow for a modern look
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.phone_in_talk,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Need assistance?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _makePhoneCall('tel:<YOUR_PHONE_NUMBER>'),
              icon: Icon(Icons.call, color: Colors.white),
              label: Text('Call Us Now'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          // TODO: Implement message function
        },
        tooltip: 'Message',
      ),
    );
  }
}

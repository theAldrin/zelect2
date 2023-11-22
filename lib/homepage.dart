import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'call.dart';
import 'chat.dart';
import 'phones.dart';
import 'laptops.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

//final _firestore = FirebaseFirestore.instance;

class _Home_pageState extends State<Home_page> {
  //final _auth = FirebaseAuth.instance;
  late String currentUserEmail;

  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       setState(() {
  //         currentUserEmail = user.email!;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    //getCurrentUser();
  }

  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Call(),
          TopPhones(),
          TopLaps(),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: Color.fromRGBO(255, 255, 255, 1),
        controller: _controller,
        flat: false,
        useActiveColorByDefault: false,
        items: [
          RollingBottomBarItem(Icons.call,
              label: 'Call', activeColor: Colors.purple),
          RollingBottomBarItem(Icons.phone_android_sharp,
              label: 'Phones', activeColor: Colors.purple),
          RollingBottomBarItem(Icons.laptop,
              label: 'Laptop', activeColor: Colors.purple),
          RollingBottomBarItem(Icons.chat_bubble,
              label: 'Chat', activeColor: Colors.purple),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}

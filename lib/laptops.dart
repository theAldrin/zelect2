import 'package:flutter/material.dart';

class TopLaps extends StatelessWidget {
  const TopLaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                'Top Laptops',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Wrap PhoneList with a SizedBox to provide a height
            Expanded(child: LapList())
          ],
        ),
      ),
    );
  }
}

class LapList extends StatelessWidget {
  const LapList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.pink];

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Container(
          height: 300,
          color: colors[index],
        );
      },
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

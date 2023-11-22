import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TopPhones extends StatelessWidget {
  const TopPhones({Key? key}) : super(key: key);

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
                'Top Smartphones',
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
            Expanded(child: PhoneList())
          ],
        ),
      ),
    );
  }
}

class productDetailClass {
  productDetailClass(
      {required this.price,
      required this.rank,
      required this.name,
      required this.image,
      required this.remarks,
      required this.link,
      required this.rating});

  int price, rank, rating;
  String name, image, link;
  List<String> remarks;
}

class PhoneList extends StatelessWidget {
  const PhoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    productDetailClass temp = productDetailClass(
        price: 15000,
        name: 'SAMSUNG S23 ULTRA',
        image:
            'https://s.yimg.com/uu/api/res/1.2/WAaKyWIMFMLpuveASW1r2A--~B/aD0xMzMzO3c9MjAwMDthcHBpZD15dGFjaHlvbg--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2023-02/51e159f0-a624-11ed-bbfd-4caa789dbbc5.cf.jpg',
        remarks: [
          'Best camera',
          'Best processor',
          'Great Battery Life',
          'Good software'
        ],
        rating: 90,
        rank: 1,
        link:
            'https://www.amazon.in/OnePlus-Titan-Black-256GB-Storage/dp/B0BQJLVSC2?crid=1QOH4MB4H5SXY&keywords=oneplus+11&nsdOptOutParam=true&qid=1699856261&sprefix=oneplus+%2Caps%2C250&sr=8-1&linkCode=ll1&tag=aldrin097-21&linkId=12b253bb02b86f6aef982fd518cd3558&language=en_IN&ref_=as_li_ss_tl');

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return BlockofProducts(
            minprice: 10000,
            maxprice: 20000,
            firstphone: temp,
            secondphone: temp,
            thirdphone: temp);
      },
    );
  }
}

class BlockofProducts extends StatelessWidget {
  BlockofProducts(
      {required this.minprice,
      required this.maxprice,
      required this.firstphone,
      required this.secondphone,
      required this.thirdphone});

  int minprice, maxprice;
  productDetailClass firstphone, secondphone, thirdphone;

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    Size screenSize = MediaQuery.of(context).size;

    // Access width and height
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFFAFAFA),
        border: Border.all(
          color: Colors.grey,
          width: 0.4,
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0x13000000),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '₹ $minprice - $maxprice',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SingleProductDetail(product: firstphone),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
            child: Divider(
              color: Colors.black54,
              thickness: 0.5,
            ),
          ),
          SingleProductDetail(product: secondphone),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
            child: Divider(
              color: Colors.black54,
              thickness: 0.5,
            ),
          ),
          SingleProductDetail(product: thirdphone),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
            child: Divider(
              color: Colors.black54,
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class SingleProductDetail extends StatelessWidget {
  SingleProductDetail({required this.product});

  productDetailClass product;

  // Function to launch the URL
  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await _launchURL('${product.link}');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.only(left: 25),
            padding:
                const EdgeInsets.only(bottom: 8, left: 18, right: 18, top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  const BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${product.rank}. ${product.name}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '₹ ${product.price}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      width: 120,
                      margin: const EdgeInsets.only(left: 50),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(children: [
                        Container(
                          width: (product.rating / 100) * 120,
                          height: 11,
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${product.rating}',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(49, 0, 0, 3),
                  child: Text(
                    '${product.remarks[0]}',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(49, 0, 0, 3),
                  child: Text(
                    '${product.remarks[1]}',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(49, 0, 0, 3),
                  child: Text(
                    '${product.remarks[2]}',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(49, 0, 0, 3),
                  child: Text(
                    '${product.remarks[3]}',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 192, 208, 218),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(product.image),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

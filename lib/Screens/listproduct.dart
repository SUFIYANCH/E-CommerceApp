import 'package:ecommerceapp/Screens/homepage.dart';
import 'package:ecommerceapp/colors/colors.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Men Shirt',
                          price: 499.0,
                          image:
                              'lib/assets/images__1_-removebg-preview (1).png'),
                      _buildFeaturedProduct(
                          name: 'Woman Watch',
                          price: 1500.0,
                          image: 'lib/assets/womanwatch-removebg-preview.png'),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Mobile Cover',
                          price: 499.0,
                          image: 'lib/assets/mobileCase-removebg-preview.png'),
                      _buildFeaturedProduct(
                          name: 'Kurti Set',
                          price: 1500.0,
                          image: 'lib/assets/kurti-removebg-preview.png'),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Mouse',
                          price: 499.0,
                          image: 'lib/assets/mouse.jpeg'),
                      _buildFeaturedProduct(
                          name: 'Woman Watch',
                          price: 1500.0,
                          image: 'lib/assets/womanwatch-removebg-preview.png'),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeaturedProduct(
                          name: 'Earings',
                          price: 499.0,
                          image: 'lib/assets/earings.jpeg'),
                      _buildFeaturedProduct(
                          name: 'Bangles',
                          price: 1500.0,
                          image: 'lib/assets/bangles.jpeg'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildFeaturedProduct(
      {required String name, required double price, required String image}) {
    return Card(
      color: secondaryColor,
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            SizedBox(
              height: 190,
              width: 160,
              child: Padding(
                padding: const EdgeInsets.only(right: 32, top: 24),
                child: Image.asset(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$price',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerceapp/Screens/cart.dart';
import 'package:ecommerceapp/Screens/homepage.dart';
import 'package:ecommerceapp/colors/colors.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  const DetailScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            }),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            Center(
              child: SizedBox(
                width: 350,
                child: _buildImage(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.price.toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: Wrap(
                      children: [
                        const Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Size',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildSizeProduct(name: 'S'),
                      _buildSizeProduct(name: 'M'),
                      _buildSizeProduct(name: 'L'),
                      _buildSizeProduct(name: 'XLL'),
                    ],
                  ),
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      _buildColorProduct(color: const Color(0xff56A5E6)),
                      _buildColorProduct(color: const Color(0xffE3E4FA)),
                      _buildColorProduct(color: const Color(0XFF3EB489)),
                      _buildColorProduct(color: Colors.black),
                    ],
                  ),
                  const Text(
                    'Quantity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _buildQuantity(),
                  _buildCheck(),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _buildSizeProduct({required String name}) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 50,
      width: 50,
      color: Color(0xfff2f2f2),
      child: Center(
          child: Text(
        name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget _buildColorProduct({required Color color}) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 50,
      width: 50,
      color: color,
    );
  }

  Widget _buildImage() {
    return Card(
      child: Container(
        height: 220,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.image))),
      ),
    );
  }

  Widget _buildQuantity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 50), backgroundColor: Colors.black),
          onPressed: (() {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: const Icon(Icons.remove),
                onTap: (() {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                }),
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18),
              ),
              GestureDetector(
                child: Icon(Icons.add),
                onTap: (() {
                  setState(() {
                    count++;
                  });
                }),
              ),
            ],
          )),
    );
  }

  Widget _buildCheck() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(350, 55),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: (() {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => CartScreen(
                    image: widget.image,
                    name: widget.name,
                    price: widget.price,
                  )));
        }),
        child: Text('Check Out'));
  }
}

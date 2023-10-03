import 'package:ecommerceapp/Screens/DetailScreen.dart';
import 'package:ecommerceapp/Screens/checkout.dart';
import 'package:ecommerceapp/colors/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  const CartScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.price});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          width: 100,
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              onPressed: (() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CheckOut(
                        image: widget.image,
                        name: widget.name,
                        price: widget.price)));
              }),
              child: const Text('Continue')),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0.0,
          leading: IconButton(
              onPressed: (() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        image: widget.image,
                        name: widget.name,
                        price: widget.price)));
              }),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          centerTitle: true,
          title: const Text(
            'Detail Page',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ))
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(children: [
            Column(
              children: [
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
              ],
            ),
          ]),
        ));
  }

  Widget _buildQuantity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 50),
              backgroundColor: const Color(0xfff2f2f2)),
          onPressed: (() {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                }),
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    count++;
                  });
                }),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildSingleCartProduct() {
    return Card(
      child: Row(
        children: [
          Container(
            height: 130,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(widget.image))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Text('Cover',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text(
                '\$ ${widget.price}',
                style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              _buildQuantity(),
            ],
          )
        ],
      ),
    );
  }
}

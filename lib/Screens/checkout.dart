// ignore_for_file: unused_element

import 'package:ecommerceapp/Screens/cart.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  const CheckOut(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff746bc9)),
            onPressed: (() {}),
            child: Text('Buy Now ')),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => CartScreen(
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
          'CheckOut Page',
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              // color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CheckOut',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            _buildSingleCartProduct(),
            _buildSingleCartProduct(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomDetails(
                    startName: "your price", endName: '\$ 90.00'),
                _buildBottomDetails(startName: "Discount", endName: '3%'),
                _buildBottomDetails(startName: "Shipping", endName: '\$ 20.00'),
                _buildBottomDetails(startName: "Total", endName: '\$ 110.00'),
              ],
            )
          ],
        ),
      ),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Text('Cover',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text(
                '\$ ${widget.price}',
                style: TextStyle(
                    color: Color(0xff9b96d6),
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

  Widget _buildQuantity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 50),
              backgroundColor: Color(0xfff2f2f2)),
          onPressed: (() {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
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
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
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

  Widget _buildBottomDetails({String? startName, String? endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName!,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          endName!,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

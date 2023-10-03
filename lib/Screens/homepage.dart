import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Screens/DetailScreen.dart';
import 'package:ecommerceapp/Screens/listproduct.dart';
import 'package:ecommerceapp/colors/colors.dart';
import 'package:ecommerceapp/model/products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

late Product menData;

late Product womenData;

int imageIndex = 0;
bool homeColor = false;
bool cartColor = false;
bool aboutColor = false;
bool contactUsColor = false;
bool logoutColor = false;

class _HomePageState extends State<HomePage> {
  List image = [
    const Image(
        image: AssetImage('lib/assets/images__1_-removebg-preview (1).png')),
    const Image(
        image: AssetImage('lib/assets/womanwatch-removebg-preview.png')),
    const Image(image: AssetImage('lib/assets/pants-removebg-preview.png')),
    const Image(image: AssetImage('lib/assets/menswatch-removebg-preview.png')),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
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
              ))
        ],
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("products")
              .doc("y9u680PYydHCdTbwdmm6")
              .collection("featuredproducts")
              .get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // var docs = snapshot.data?.docs ?? [];

            menData = Product(
              image: snapshot.data!.docs[0]["image"],
              name: snapshot.data!.docs[0]["name"],
              price: snapshot.data!.docs[0]["price"].toString(),
            );
            womenData = Product(
              image: snapshot.data!.docs[1]["image"],
              name: snapshot.data!.docs[1]["name"],
              price: snapshot.data!.docs[1]["price"].toString(),
            );
            print(menData.name);
            return Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        ImageSlider(child: image),
                        const Padding(
                          padding: EdgeInsets.only(top: 32, right: 230),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        _buildCategory(),
                        Padding(
                          padding: const EdgeInsets.only(top: 32, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Featured',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ListProduct()));
                                }),
                                child: const Text(
                                  'View more',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        _buildFeatured(),
                        const Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'New Achieves',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        _buildArchieve(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildFeaturedProduct(
      {required String name, required int price, required String image}) {
    return Card(
      child: Container(
        color: secondaryColor,
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
                '₹$price',
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

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Sufiyan ch',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('sufiyanch@gmail.com',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  'lib/assets/WhatsApp Image 2023-02-13 at 10.18.27 PM.jpeg'),
            ),
            decoration: BoxDecoration(color: Color(0xfff2f2f2)),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactUsColor = false;
                cartColor = false;
                aboutColor = false;
                logoutColor = false;
              });
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              setState(() {
                cartColor = true;
                contactUsColor = false;
                homeColor = false;
                aboutColor = false;
                logoutColor = false;
              });
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                contactUsColor = false;
                homeColor = false;
                cartColor = false;
                logoutColor = false;
              });
            },
            leading: const Icon(Icons.info),
            title: const Text('About'),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                contactUsColor = true;
                aboutColor = false;
                homeColor = false;
                cartColor = false;
                logoutColor = false;
              });
            },
            leading: const Icon(Icons.phone),
            title: const Text('Contact Us'),
          ),
          ListTile(
            selected: logoutColor,
            onTap: () {
              setState(() {
                logoutColor = true;
                aboutColor = false;
                homeColor = false;
                cartColor = false;
                contactUsColor = false;
              });
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildCategoryProduct(
                image: "lib/assets/images (2).jpeg",
                color: 0xff33dcfd,
                text: 'Watches'),
            _buildCategoryProduct(
                image: "lib/assets/mobileCase-removebg-preview.png",
                color: 0xfff38cdd,
                text: 'Ladies'),
            _buildCategoryProduct(
                image: "lib/assets/shoe-removebg-preview.png",
                color: 0xff4ff2af,
                text: 'shoes'),
            _buildCategoryProduct(
                image: "lib/assets/pants-removebg-preview.png",
                color: 0xff74acf7,
                text: 'Pants'),
            _buildCategoryProduct(
                image: "lib/assets/tie-removebg-preview.png",
                color: 0xfffc6c8d,
                text: 'Ties'),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatured() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const DetailScreen(
                          name: 'Men Shirt',
                          price: 499,
                          image:
                              'lib/assets/images__1_-removebg-preview (1).png')));
                },
                child: _buildFeaturedProduct(
                    name: 'Men Shirt',
                    price: 499,
                    image: 'lib/assets/images__1_-removebg-preview (1).png'),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const DetailScreen(
                          name: 'Woman Watch',
                          price: 1500,
                          image:
                              'lib/assets/womanwatch-removebg-preview.png')));
                }),
                child: Card(
                  child: Container(
                    color: secondaryColor,
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 190,
                          width: 160,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 32, top: 24),
                            child: Image.network(womenData.image),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '₹${womenData.price.hashCode}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ),
                        Text(
                          womenData.name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildArchieve() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                            name: 'Pants',
                            price: 499,
                            image: 'lib/assets/pants-removebg-preview.png')));
                  }),
                  child: _buildFeaturedProduct(
                      name: 'Pants',
                      price: 499,
                      image: 'lib/assets/pants-removebg-preview.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                            name: 'Woman Watch',
                            price: 1500,
                            image:
                                'lib/assets/womanwatch-removebg-preview.png')));
                  },
                  child: _buildFeaturedProduct(
                    name: 'Woman Watch',
                    price: 1500,
                    image: 'lib/assets/womanwatch-removebg-preview.png',
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCategoryProduct(
      {required String image, required int color, required String text}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6),
          child: CircleAvatar(
            maxRadius: 35,
            backgroundColor: Color(color),
            backgroundImage: AssetImage(image),
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ImageSlider extends StatefulWidget {
  final List child;
  const ImageSlider({super.key, required this.child});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, realIndex) => Container(
        child: widget.child[index],
      ),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        height: 200,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        onPageChanged: (index, reason) {
          setState(() {
            imageIndex = index;
          });
        },
      ),
    );
  }
}

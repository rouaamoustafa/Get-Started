import 'package:flutter/material.dart';
import '../../app/test2.dart';
import '../../data/product.dart';
import '../presentation/pages/CustomProductCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool _isDiscountVisible = false;
  int _clickedButtonIndex = -1;

  void _handleButtonClick(int index) {
    setState(() {
      _clickedButtonIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isDiscountVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
          imagePath: "assets/images/jaune-blanc.png",
          name: "Air Max 97",
          price: "\$20.99"),
      Product(
          imagePath: "assets/images/bleu-blanc.png",
          name: "Air Max 95",
          price: "\$18.99"),
      Product(
          imagePath: "assets/images/red_espadrille.png",
          name: "Air Max 90",
          price: "\$19.99"),
      Product(
          imagePath: "assets/images/red-blue2.png",
          name: "Air Max 1",
          price: "\$22.99"),
      Product(
          imagePath: "assets/images/green_espadrille.png",
          name: "Air Max 98",
          price: "\$21.99"),
      Product(
          imagePath: "assets/images/blanc-bleau-rouge.png",
          name: "Air Max Plus",
          price: "\$23.99"),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 30,
                              height: 30, // Adjusted to make the icon more centered
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF374957), width: 1), // Border settings
                                borderRadius: BorderRadius.circular(8), // Optional: To make the border rounded
                                color: Colors.white,
                              ),
                              child: Icon(Icons.format_align_left_outlined)),
                          SizedBox(width: 8.0),
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: Image.asset("assets/images/nike_logo.png",
                                fit: BoxFit.contain),
                          ),
                        ],
                      ),
                      Container(
                          width: 30,
                          height: 30, // Adjusted to make the icon more centered
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF374957), width: 1), // Border settings
                            borderRadius: BorderRadius.circular(8), // Optional: To make the border rounded
                            color: Colors.white,
                          ),
                          child: Icon(Icons.shopping_bag_outlined)),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFEFEFEF),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 45), // Add space to align text properly
                            AnimatedPositioned(
                              duration: Duration(seconds: 1),
                              top: _isDiscountVisible ? 0 : -50,
                              child: Text.rich(
                                TextSpan(
                                  text: "20%",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 45),
                                  children: [
                                    TextSpan(
                                        text: " Discount",
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: _isDiscountVisible ? 1.0 : 0.0,
                              duration: Duration(seconds: 1),
                              child: Text("on your first purchase",
                                  style: TextStyle(fontSize: 15, height: 1.5)),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -25,
                        left: 120,
                        bottom: 10,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(-35 * 3.141592653589793 / 180),
                          child: Container(
                            width: 250,
                            decoration: const BoxDecoration(),
                            child: Image.asset("assets/images/green_espadrille.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCustomButton(text: 'All', index: 0),
                  _buildCustomButton(text: 'Running', index: 1),
                  _buildCustomButton(text: 'Sneakers', index: 2),
                  _buildCustomButton(text: 'Formal', index: 3),
                  _buildCustomButton(text: 'Sale', index: 4),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height, // Set a height constraint
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      mainAxisSpacing: 16.0, // Spacing between rows
                      crossAxisSpacing: 16.0, // Spacing between columns
                      childAspectRatio: 0.75, // Aspect ratio of each grid item
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return CustomProductCard(product: products[index]);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton({required String text, required int index}) {
    bool isClicked = _clickedButtonIndex == index;

    return GestureDetector(
      onTap: () {
        _handleButtonClick(index);
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isClicked ? Colors.black : Colors.white,
        ),
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isClicked ? Colors.white : Color(0xFF9C9C9C),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

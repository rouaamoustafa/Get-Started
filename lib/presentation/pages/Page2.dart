import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../data/product.dart';

class Page2 extends StatefulWidget {
  final Product product;

  const Page2({Key? key, required this.product}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin{
  int _clickedButtonSize = 1;
  int _clickedButtonColor = -1;
  bool _isBookmarkClicked = false;

  AnimationController? _shoeAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shoeAnimationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _shoeAnimationController!.forward();

  }

  final List<String> sizes = ["UK 6", "UK 7", "UK 8", "UK 9"];
  final List<Color> colors = [Color(0xFFCD2626), Color(0xFF394376)];

  void _ColorButtonClick(int index) {
    setState(() {
      _clickedButtonColor = index;
    });
  }

  void _SizeButtonClick(int index) {
    setState(() {
      _clickedButtonSize = index;
    });
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarkClicked = !_isBookmarkClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF374957), width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back, color: Color(0xFF374957)),
                  ),
                ),
                Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF374957), width: 1),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.shopping_bag_outlined, color: Color(0xFF374957)),
                ),
              ],
            ),
          ),
          Container(
            height: screenHeight * 0.63,
            width: screenWidth * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.13,
                  height: screenHeight * 0.5,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: sizes.length,
                          itemBuilder: (context, index) {
                            bool isClicked = _clickedButtonSize == index;
                            return GestureDetector(
                              onTap: () {
                                _SizeButtonClick(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12),
                                width: screenWidth * 0.075,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isClicked ? Colors.black : Colors.grey,
                                    width: isClicked ? 2 : 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    sizes[index],
                                    style: TextStyle(
                                      color: Color(0xFF374957),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: screenWidth * 0.53,
                      height: screenHeight * 0.60,
                      //color: Colors.blue,
                    ),
                    Positioned(
                        bottom: 367,
                        left: 100,
                        child: Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.rotationZ(90 * 3.141592653589793 / 180),
                          child: const Text(
                            "NIKE",
                            style: TextStyle(
                                fontSize: 190,
                                fontFamily: 'Poppins',
                                color: Color(0xFFD3D3D3),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic
                            ),
                          ),
                        )
                    ),
                    Positioned(
                      bottom: 135,
                      top: 15,
                      left: 20,
                      child: Container(
                        width: screenWidth * 0.85,
                        height: screenHeight * 0.75,
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.rotationZ(-45 * 3.141592653589793 / 180),
                          child: Container(
                            width: 300,
                            decoration: const BoxDecoration(),
                            child:Image.asset(widget.product.imagePath)
                            // AnimatedBuilder(
                            //     animation: _shoeAnimationController!.view,
                            //     builder: (buildContext , child){
                            //       return Transform.translate(offset:Offset(_shoeAnimationController!.value ,_shoeAnimationController!.value =-7) );
                            //     },
                            //     child:
                            //     Image.asset(widget.product.imagePath)
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 450,
                      right: 175,
                      child: Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.08,
                        child:  Column(
                          children: [
                            Text(widget.product.price, style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                            Text.rich(
                              TextSpan(
                                text: "10%",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.red, fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: " OFF",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: screenWidth * 0.13,
                  height: screenHeight * 0.5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: _toggleBookmark,
                        child: Container(
                          width: screenWidth * 0.25,
                          height: 50,
                          child: Center(
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF374957), width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Icon(
                                _isBookmarkClicked ? Icons.bookmark_outlined : Icons.bookmark_border,
                                color: Color(0xFF374957),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: colors.length,
                          itemBuilder: (context, index) {
                            bool isClickedColor = _clickedButtonColor == index;
                            return GestureDetector(
                              onTap: () {
                                _ColorButtonClick(index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 12),
                                width: 50,
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isClickedColor ? Colors.black : Colors.grey,
                                    width: isClickedColor ? 2 : 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
              children: [
                Container(
                  height: screenHeight * 0.23,
                  width: screenWidth * 0.9,
                  child: Image.asset("assets/images/boxes.png"),
                  // color: Colors.green,
                ),
                Positioned(
                  bottom: 107,
                  right: 150,
                  child: Container(
                    width: screenWidth * 0.11,
                    height: screenHeight * 0.10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: Colors.black,
                    ),
                    child: Lottie.asset(
                      "assets/Animation/scroll_down.json",
                      errorBuilder: (context, error, stackTrace) {
                        print(error);
                        return Center(child: Text('Error loading animation'));
                      },
                    ),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }
}

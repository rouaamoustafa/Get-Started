import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../data/product.dart';

class Page2 extends StatefulWidget {
  final Product product;

  const Page2({Key? key, required this.product}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double screenHeight = 0;
  double screenWidget = 0;

  final List<String> sizes = ["UK 7", "UK 8", "UK 9", "UK 10"];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidget = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
            child: Column(
              children: [
                Row(
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
                          border:
                          Border.all(color: Color(0xFF374957), width: 1),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.arrow_back, color: Color(0xFF374957)),
                      ),
                    ),
                    Text(widget.product.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF374957), width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.shopping_bag_outlined,
                          color: Color(0xFF374957)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
            child: Row(
              children: [
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text("Size"),
                //     Expanded(
                //       child: ListView.builder(
                //         scrollDirection: Axis.vertical,
                //           // primary: false,
                //           // shrinkWrap: true,
                //           itemCount: sizes.length,
                //           itemBuilder: (context, index) {
                //             return GestureDetector(
                //               onTap: () {
                //                 Navigator.pop(context);
                //               },
                //               child: Container(
                //                 margin: EdgeInsets.only(bottom: 8),
                //                 width: 50,
                //                 height: 30,
                //                 decoration: BoxDecoration(
                //                   border: Border.all(
                //                     color: Color(0xFF374957),
                //                     width: 1,
                //                   ),
                //                   borderRadius: BorderRadius.circular(8),
                //                   color: Colors.white,
                //                 ),
                //                 child: Center(
                //                   child: Text(
                //                     sizes[index],
                //                     style: TextStyle(
                //                       color: Color(0xFF374957),
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //
                //       ),
                //     ),
                //   ],
                // ),
                Stack(
                  children: [
                    Container(
                      width:screenWidget * 0.4,
                      height:screenHeight  * 0.5,
                      child: Transform(
                          alignment: Alignment.center,
                          transform:
                          Matrix4.rotationZ(90 * 3.141592653589793 / 180),
                          child: Text(
                            "NIKE",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          )
                      ),
                    ),

                    //
                  ],
                )
              ],
            ),
          ),

          // Add other widgets related to product details here
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Column(
          //     children: [
          //       Image.asset(product.imagePath),
          //       SizedBox(height: 20),
          //       Text(product.name, style: TextStyle(fontSize: 24)),
          //       SizedBox(height: 10),
          //       Text(product.price, style: TextStyle(fontSize: 24)),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

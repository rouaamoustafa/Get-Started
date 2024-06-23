import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/product.dart';
import 'Page2.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;

  const CustomProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFEFEFEF),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(-35 * 3.141592653589793 / 180),
              child: Image.asset(product.imagePath),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.price, style: TextStyle(fontSize: 18)),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page2(product: product),
                      ),
                    );
                  },
                  child: Container(
                    width: 30,
                    height: 30, // Adjusted to make the icon more centered
                    decoration: BoxDecoration(
                      border: Border.all(color:Color(0xFF374957), width: 1), // Border settings
                      borderRadius: BorderRadius.circular(8), // Optional: To make the border rounded
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_forward_rounded),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

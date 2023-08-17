import 'package:flutter/material.dart';
import 'package:flutter_ui_ecommerce_a/models/my_product.dart';
import 'package:flutter_ui_ecommerce_a/pages/detail_screen.dart';

import '../widget/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Our Product",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryMethod(
                index: 0,
                name: "All Product",
              ),
              _buildCategoryMethod(
                index: 1,
                name: "Jackets",
              ),
              _buildCategoryMethod(
                index: 2,
                name: "Sneakers",
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: isSelected == 0 ? _buildAllProducts() : Text("Not Found"),
          ),
        ],
      ),
    );
  }

  _buildCategoryMethod({
    required int index,
    required String name,
  }) =>
      GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(
            top: 10,
            right: 10,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index
                ? Colors.blueAccent
                : Colors.blueAccent[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );

  _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.products.length,
        itemBuilder: (context, index) {
          final allProduct = MyProducts.products[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(product: allProduct),
                )),
            child: ProductCard(
              product: allProduct,
            ),
          );
        },
      );
}

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

void main() {
  runApp(ABC());
}

class Product {
  final String name;
  final String imageUrl;

  Product({required this.name, required this.imageUrl});
}

class ABC extends StatelessWidget {
  final List<Product> products = [
    Product(name: "Product 1", imageUrl: "https://example.com/product1.jpg"),
    Product(name: "Product 2", imageUrl: "https://example.com/product2.jpg"),
    Product(name: "Product 3", imageUrl: "https://example.com/product3.jpg"),
    Product(name: "Product 1", imageUrl: "https://example.com/product1.jpg"),
    Product(name: "Product 2", imageUrl: "https://example.com/product2.jpg"),
    Product(name: "Product 3", imageUrl: "https://example.com/product3.jpg"),
    Product(name: "Product 1", imageUrl: "https://example.com/product1.jpg"),
    Product(name: "Product 2", imageUrl: "https://example.com/product2.jpg"),
    Product(name: "Product 3", imageUrl: "https://example.com/product3.jpg"),
    Product(name: "Product 1", imageUrl: "https://example.com/product1.jpg"),
    Product(name: "Product 2", imageUrl: "https://example.com/product2.jpg"),
    Product(name: "Product 3", imageUrl: "https://example.com/product3.jpg"),
    // Add more products as needed.
  ];

  ABC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and organization name
              Text('MyShop', style: TextStyle(fontSize: 20)),
            ],
          ),
          actions: [
            // Search bar
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality here
              },
            ),
            // Heart icon (Wishlist)
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Implement wishlist functionality here
              },
            ),
            // Cart icon
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Implement cart functionality here
              },
            ),
          ],
        ),
        drawer: const MyDrawer(),

        body: Center(
          child: Container(
            width: 1300,
            height: 1000,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 1000,
                  child: ListView.builder(

                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 300,
                          height: 400,// Adjust the width as needed
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Image.network(
                                products[index].imageUrl,
                                width: 100, // Adjust the image width as needed
                                height: 100, // Adjust the image height as needed
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                products[index].name,
                                style: const TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

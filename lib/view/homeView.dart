import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final double price;
  final String imageUrl;

  Product(
      {required this.name,
      required this.category,
      required this.price,
      required this.imageUrl});
}

class Order {
  final Product product;
  final DateTime orderDate;

  Order({required this.product, required this.orderDate});
}

class HomeViewCustomer extends StatelessWidget {
  // Sample Product Data
  final List<Product> products = [
    Product(
        name: "Product 1",
        category: "Category 1",
        price: 10.0,
        imageUrl: "assets/product1.jpg"),
    Product(
        name: "Product 2",
        category: "Category 2",
        price: 20.0,
        imageUrl: "assets/product2.jpg"),
    Product(
        name: "Product 3",
        category: "Category 1",
        price: 15.0,
        imageUrl: "assets/product3.jpg"),
    // Add more products as needed
  ];

  // Sample Order History Data
  final List<Order> orderHistory = [
    Order(
        product: Product(
            name: "Product 1",
            category: "Category 1",
            price: 10.0,
            imageUrl: "assets/product1.jpg"),
        orderDate: DateTime.now().subtract(Duration(days: 5))),
    Order(
        product: Product(
            name: "Product 2",
            category: "Category 2",
            price: 20.0,
            imageUrl: "assets/product2.jpg"),
        orderDate: DateTime.now().subtract(Duration(days: 10))),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Your existing dashboard content
          // ...
          // Product Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Featured Products",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle product tap
                        },
                        child: Container(
                          width: 150,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(products[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  products[index].name,
                                  style: TextStyle(color: Colors.white),
                                ),
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
          // Category Section (Assuming you have predefined categories)
          // Add your category section here
          // Order History Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order History",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderHistory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(orderHistory[index].product.imageUrl,
                          width: 50, height: 50),
                      title: Text(orderHistory[index].product.name),
                      subtitle: Text(orderHistory[index].orderDate.toString()),
                      // Add more details if needed
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  // Dummy Product List
  final List<Map<String, dynamic>> products = [
    {"name": "Smartphone", "price": "\$699", "image": "assets/phone.png"},
    {"name": "Laptop", "price": "\$999", "image": "assets/laptop.png"},
    {"name": "Headphones", "price": "\$199", "image": "assets/headphones.png"},
    {"name": "Smartwatch", "price": "\$299", "image": "assets/watch.png"},
    {"name": "Camera", "price": "\$499", "image": "assets/camera.png"},
    {"name": "Tablet", "price": "\$599", "image": "assets/tablet.png"},
  ];

  // Dummy Category List
  final List<String> categories = ["All", "Phones", "Laptops", "Headphones", "Watches", "Cameras"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping App"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to Cart Page
            },
          ),
          PopupMenuButton<String>(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Profile Picture
              radius: 16,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(value: "Profile", child: Text("Profile")),
              PopupMenuItem(value: "Orders", child: Text("My Orders")),
              PopupMenuItem(value: "Logout", child: Text("Logout")),
            ],
            onSelected: (value) {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search products...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16),

            // Categories (Horizontal Scroll)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      label: Text(category),
                      backgroundColor: Colors.blue.shade100,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),

            // Product Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 Products per Row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            products[index]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                products[index]["name"],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                products[index]["price"],
                                style: TextStyle(fontSize: 14, color: Colors.green),
                              ),
                              SizedBox(height: 5),
                              ElevatedButton(
                                onPressed: () {
                                  // Add to Cart Action
                                },
                                child: Text("Add to Cart"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

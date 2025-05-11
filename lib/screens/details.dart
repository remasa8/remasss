import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  final String address;

  DetailsPage({required this.email, required this.name, required this.address, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image),
          Text(
            name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            address,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
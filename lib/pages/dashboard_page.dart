import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class DashboardScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  final List<String> donations = []; // Change this list to test

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sahara',
          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 200.0, autoPlay: true),
            items: images.map((imgPath) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your Donations:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: donations.isEmpty
                ? Center(
                    child: Text(
                      'No donations available!',
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: donations.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(donations[index]),
                        leading: Icon(Icons.volunteer_activism, color: Colors.green),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextButton(
          onPressed: () {},
          child: Text(
            '+ Donate Now',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

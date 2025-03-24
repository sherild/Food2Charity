import 'package:flutter/material.dart';

class DonationSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank you for donating!"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back to previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/success.png', // Ensure this image is added in assets
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Your donation is successful",
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            Text(
              "Receiver will contact you shortly",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure you want to donate?"),
          content: Text(
              "We assume that you take the responsibility of the food you donate."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("No", style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                _submitDonation(); // Proceed with donation
              },
              child: Text("Yes", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void _submitDonation() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Donation Submitted Successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Donate Now")),
      body: Center(
        child: ElevatedButton(
          onPressed: _showConfirmationDialog,
          child: Text("+ Donate"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
        ),
      ),
    );
  }
}

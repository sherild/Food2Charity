import 'package:flutter/material.dart';

class DonateNowScreen extends StatefulWidget {
  @override
  _DonateNowScreenState createState() => _DonateNowScreenState();
}

class _DonateNowScreenState extends State<DonateNowScreen> {
  TextEditingController peopleController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? selectedDate;
  String? selectedTime;
  bool isVeg = false;
  bool isNonVeg = false;

  // Date Picker Function
  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    // if (pickedDate != null) {
    //   setState(() {
    //     selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    //   });
    // }
  }

  // Time Picker Function
  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime.format(context);
      });
    }
  }

  void _submitDonation() {
    if (!isVeg && !isNonVeg) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select at least one food category!")),
      );
      return;
    }

    print("Donation Submitted!");
    print("People: ${peopleController.text}");
    print("Contact: ${contactController.text}");
    print("Description: ${descriptionController.text}");
    print("Address: ${addressController.text}");
    print("Date: $selectedDate");
    print("Time: $selectedTime");
    print("Food Type: ${isVeg ? "Veg" : ""} ${isNonVeg ? "Non-Veg" : ""}");
    Navigator.pushNamed(context, '/donate');

    // Navigate to the next screen
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Donation Submitted Successfully!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Donate Now")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: peopleController,
              decoration: InputDecoration(labelText: "People you can serve"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: "Your Contact Number"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description of food"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: "Your Address"),
            ),
            SizedBox(height: 20),

            // Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Set Date:", style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () => _pickDate(context),
                  child: Text(
                    selectedDate ?? "Set a date",
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ],
            ),

            // Time Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Set Time:", style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () => _pickTime(context),
                  child: Text(
                    selectedTime ?? "Set a time",
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Food Category
            Text("Food Category:", style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Checkbox(
                  value: isVeg,
                  onChanged: (value) {
                    setState(() {
                      isVeg = value!;
                      if (isVeg) isNonVeg = false; // Ensure only one selection
                    });
                  },
                ),
                Text("Veg"),
                SizedBox(width: 20),
                Checkbox(
                  value: isNonVeg,
                  onChanged: (value) {
                    setState(() {
                      isNonVeg = value!;
                      if (isNonVeg) isVeg = false; // Ensure only one selection
                    });
                  },
                ),
                Text("Non-Veg"),
              ],
            ),

            // Error message
            if (!isVeg && !isNonVeg)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Select any ONE checkbox",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            SizedBox(height: 20),

            // Donate Button
            Center(
              child: ElevatedButton(
                onPressed: _submitDonation,
                child: Text("+ Donate"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

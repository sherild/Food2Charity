import 'package:flutter/material.dart';

class StartDonatingScreen extends StatefulWidget {
  @override
  _StartDonatingScreenState createState() => _StartDonatingScreenState();
}

class _StartDonatingScreenState extends State<StartDonatingScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool restaurant = false;
  bool caterer = false;
  bool individual = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Invalid Email.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please provide a value.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please provide a value.";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text("What are you?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              CheckboxListTile(
                title: Text("Restaurant"),
                value: restaurant,
                onChanged: (bool? value) {
                  setState(() {
                    restaurant = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Caterer"),
                value: caterer,
                onChanged: (bool? value) {
                  setState(() {
                    caterer = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Individual"),
                value: individual,
                onChanged: (bool? value) {
                  setState(() {
                    individual = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process signup
                  }
                },
                child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

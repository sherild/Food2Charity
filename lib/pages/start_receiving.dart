import 'package:flutter/material.dart';

class StartReceivingSignUpScreen extends StatefulWidget {
  @override
  _StartReceivingSignUpScreenState createState() => _StartReceivingSignUpScreenState();
}

class _StartReceivingSignUpScreenState extends State<StartReceivingSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTextField("Email", Icons.email, false, true),
                    buildTextField("Password", Icons.lock, true, false),
                    buildTextField("Confirm Password", Icons.lock, true, false),
                    buildTextField("Your Name", Icons.person, false, false),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigate to next screen
                        }
                      },
                      child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hintText, IconData icon, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        obscureText: isPassword ? (hintText == "Password" ? _obscurePassword : _obscureConfirmPassword) : false,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please provide a value.";
          }
          if (isEmail && !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
            return "Invalid Email.";
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    hintText == "Password" ? (_obscurePassword ? Icons.visibility_off : Icons.visibility) : (_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      if (hintText == "Password") {
                        _obscurePassword = !_obscurePassword;
                      } else {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      }
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}


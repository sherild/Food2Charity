import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _agreed = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent - 10) {
      setState(() {
        _agreed = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms and Conditions")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. Terms of Use", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("This Terms and Conditions Agreement sets forth...\n"),
                      Text("2. Services", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("We are a food donation service provider...\n"),
                      Text("3. Registration", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("By signing up to our application you agree...\n"),
                      Text("4. Pick Up", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Pick up period quoted at the time of ordering...\n"),
                      Text("5. Limitation of Liability", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Great care has been taken to ensure...\n"),
                      Text("6. General", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("We may subcontract any part of the services...\n"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _agreed ? () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You agreed to the terms and conditions!"))) : null,
              child: Text("I Agree"),
            ),
          ),
        ],
      ),
    );
  }
  
  SingleChildScrollView({required ScrollController controller, required EdgeInsets padding, required Column child}) {}
}

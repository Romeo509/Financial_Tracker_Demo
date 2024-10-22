import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final String username; // Accept username as a parameter

  const AccountPage({Key? key, required this.username}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                "My Account",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: Text(
                  "Hey ${widget.username}!", // Display username
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 22,
                      color: Colors.greenAccent,
                    ),
                    title: Text("My Account"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.payment_outlined,
                      size: 22,
                      color: Colors.greenAccent,
                    ),
                    title: Text("My Banking Details"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.loyalty,
                      size: 22,
                      color: Colors.greenAccent,
                    ),
                    title: Text("My Subscription"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.group,
                      size: 22,
                      color: Colors.greenAccent,
                    ),
                    title: Text("Referrer Program"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.question_answer,
                      size: 22,
                      color: Colors.greenAccent,
                    ),
                    title: Text("FAQs"),
                    trailing: Icon(Icons.question_mark),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent)),
                onPressed: () {
                  // Navigate to the login page
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false, // Remove all previous routes
                  );
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

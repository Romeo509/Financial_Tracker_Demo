import 'package:flutter/material.dart';
import 'mainPages/AccountPage.dart';
import 'mainPages/HomePage.dart';
import 'mainPages/transactionsPage.dart';
import 'mainPages/upcomingTransactionsPage.dart';
import 'mainPages/LoginPage.dart'; // Ensure this import is correct
import 'mainPages/RegistrationPage.dart'; // Import the registration page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) {
          final String? username =
              ModalRoute.of(context)?.settings.arguments as String?;
          return HomeNavigationPage(
              username ?? "", 0); // Pass username to HomeNavigationPage
        },
        '/registration': (context) =>
            RegistrationPage(), // Add registration route
      },
    );
  }
}

class HomeNavigationPage extends StatefulWidget {
  HomeNavigationPage(this.username, this.currentIndex);
  final String username;
  int currentIndex;

  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(),
      TransactionPage(),
      PastTransactionsPage(),
      AccountPage(username: widget.username), // Pass username to AccountPage
    ];

    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.greenAccent,
        currentIndex: widget.currentIndex,
        onTap: (index) => setState(() {
          widget.currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: "Upcoming"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Past"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}

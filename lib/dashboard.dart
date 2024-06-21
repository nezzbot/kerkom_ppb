import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Consult with Your Preferred Doctor',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Flexible(
                    flex: 0,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          AssetImage('assets/logo2.png'), // Your circular logo
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/dr1.jpeg'),
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/doctor.png'),
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/doctor2.jpeg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Top article',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 3.0,
                color: const Color.fromARGB(255, 137, 184, 223),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Mental health has a great influence',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color of the title
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Lorem ipsum bismillah jadi orang hebat',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white, // Set text color of the content
                        ),
                      ),
                      // Add more widgets as needed for your card content
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 3.0,
                color: const Color.fromARGB(255, 137, 184, 223),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Dont make your mental just like that',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color of the title
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Lorem ipsum bismillah jadi orang hebat',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white, // Set text color of the content
                        ),
                      ),
                      // Add more widgets as needed for your card content
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Find Your Consultation Services',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to desired page or perform desired action
                        },
                        child: Image.asset(
                          'assets/chat.jpeg',
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Chat Doctor',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to desired page or perform desired action
                        },
                        child: Image.asset(
                          'assets/meet.jpeg',
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Onsite',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to desired page or perform desired action
                        },
                        child: Image.asset(
                          'assets/vidcall.jpeg',
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Video Call',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, '/page2');
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/home.jpeg',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to desired page or perform desired action
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/articles.jpeg',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to desired page or perform desired action
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/message.jpeg',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to desired page or perform desired action
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/profile.jpeg',
                            width: 50.0,
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class PageIcad2 extends StatefulWidget {
  @override
  _PageIcad2State createState() => _PageIcad2State();
}

class _PageIcad2State extends State<PageIcad2> {
  bool _isContainerVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_isContainerVisible)
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // X button
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(30, 30),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/page2');
                      },
                      child: Text(
                        'X',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // Saved Article text
                    Text(
                      'Appointment',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

            Text(
              'Upcoming',
              style: TextStyle(
                color: const Color.fromARGB(97, 0, 0, 0),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ), // Article information cards
            _buildArticleCard(
              'Dr Zwitsal',
              'Psychiatry',
              '26 June 2024',
              '13.00',
              'assets/doctor1.jpeg',
            ),
            _buildArticleCard(
              'Dr. Pryangga',
              'Psychology',
              '15 June 2024',
              '15.30',
              'assets/doctor2.jpeg',
            ),
            Text(
              'Past',
              style: TextStyle(
                color: const Color.fromARGB(97, 0, 0, 0),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ), // Article information cards
            _buildArticleCard(
              'Dr. Pryangga',
              'Psychology',
              '15 June 2024',
              '15.30',
              'assets/doctor2.jpeg',
            ),
            _buildArticleCard(
              'Dr Zwitsal',
              'Psychiatry',
              '26 June 2024',
              '13.00',
              'assets/doctor1.jpeg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCard(String name, String profession, String dateSchedule,
      String hourSchedule, String imagePath) {
    return Card(
      color: Color.fromARGB(255, 149, 203, 224), // Light grey background color
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        profession,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "DATE & TIME",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle button 1 tap
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  child: Text(
                    dateSchedule,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle button 2 tap
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                  child: Text(
                    hourSchedule,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

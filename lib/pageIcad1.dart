import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class PageIcad1 extends StatefulWidget {
  @override
  _PageIcad1State createState() => _PageIcad1State();
}

class _PageIcad1State extends State<PageIcad1> {
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
                      'Saved Article',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            // Article information cards
            _buildArticleCard(
              'Kaki Okumura * 7 min read • 12 Oct',
              'Get in Shape: Japanese Rule to a Healthy Diet',
              'I’m no biohacker, but I have a profound interest in nutrition, food, and how we can optimize our health and well-being.',
            ),
            _buildArticleCard(
              'Markham Heid * 5 min read • 23 Oct',
              '3 Hobbies That Can Improve Your Memory',
              'For thousands of years, humans have recognized that the sun plays a role in the emergence and transmission of viruses',
            ),
            _buildArticleCard(
              'Dr. Christine Bradstreet * 7 min read • 20 Nov',
              'The Science Behind Improving Your Immune System',
              'Today i will talk about that science about your immune system that nobody ever talk about',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCard(
      String authorInfo, String title, String description) {
    return Card(
      color: Color.fromARGB(255, 149, 203, 224), // Light grey background color
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authorInfo,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

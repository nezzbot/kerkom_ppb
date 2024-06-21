import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class BookingConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Booking Consultation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30, // Reduced size
                  backgroundImage: AssetImage(
                      'assets/doctor.jpg'), // Replace with your image path
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Bruce Scott Hoffman, PHD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Psychiatrist',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Doctor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Dr. Bruce Scott Hoffman, PHD is a Clinical Professor of Psychiatry, Obstetrics, Gynecology, and Reproductive Sciences at the Icahn School of Medicine at Mount Sinai, which he first joined in 2007. He is a specialist in Psychiatry at Mount Sinai Medical Center. He also has a private practice in New York City.',
                    style: TextStyle(
                      fontSize: 14, // Reduced text size
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Special',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Chip(
                    label: Text('Psychiatry'),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Video Call',
                          style: TextStyle(fontSize: 12), // Smaller text
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 36), // Adjust size
                          padding: EdgeInsets.symmetric(
                              horizontal: 8), // Adjust padding
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Chat',
                          style: TextStyle(fontSize: 12), // Smaller text
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 36), // Adjust size
                          padding: EdgeInsets.symmetric(
                              horizontal: 8), // Adjust padding
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Order Counseling',
                          style: TextStyle(fontSize: 12), // Smaller text
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 36), // Adjust size
                          padding: EdgeInsets.symmetric(
                              horizontal: 8), // Adjust padding
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Get Consultation Services with Dr. Bruce Scott Hoffman, PHD now',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Consultation Fees Starting from IDR 39,000/hour',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Consultation services can be via chat, voice call, or video call',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Get Instant Service'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

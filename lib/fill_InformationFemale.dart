import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'main.dart';

class SixthPage extends StatefulWidget {
  @override
  _SixthPageState createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _tinggiBadanController = TextEditingController();
  TextEditingController _beratBadanController = TextEditingController();
  TextEditingController _golonganDarahController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process form data
      String tanggalLahir = _tanggalLahirController.text;
      String beratBadan = _beratBadanController.text;
      String golonganDarah = _golonganDarahController.text;
      String tinggiBadan = _tinggiBadanController.text;

      // You can now use 'name', 'email', and 'password' variables as needed

      // Example: Print form data
      print('Tanggal lahir: $tanggalLahir');
      print('Tinggi badan: $tinggiBadan');
      print('Berat badan: $beratBadan');
      print('Golongan darah: $golonganDarah');

      Navigator.pushNamed(context, '/dashboard');
    }
  }

  void _navigateToMalePage() {
    Navigator.pushNamed(context, '/page5');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Fill your profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _navigateToMalePage,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child:
                            Text('Male', style: TextStyle(color: Colors.black)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Text('Female',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _tanggalLahirController,
                          decoration: InputDecoration(
                            labelText: 'Tanggal lahir',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your tanggal lahir';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _tinggiBadanController,
                          decoration: InputDecoration(
                            labelText: 'Tinggi badan',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your tinggi badan';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _beratBadanController,
                          decoration: InputDecoration(
                            labelText: 'Berat badan',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your berat badan';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _golonganDarahController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Golongan darah',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your golongan darah';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitForm,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          child: Text('Submit',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

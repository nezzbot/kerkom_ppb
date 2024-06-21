// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Green Ranger Beta Testing',
//             style: TextStyle(color: Colors.green), // Set the title text color to green
//           ),
//           backgroundColor: Colors.grey[900],  // Darker color for AppBar
//         ),
//         body: MyHomePage(),
//         backgroundColor: Colors.grey[850], // Set the background color to dark grey
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _controller = TextEditingController();
//   String _response = "";

//   Future<void> postData() async {
//     try {
//       var response = await http.post(
//         Uri.parse('http://127.0.0.1:8000/greet/'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode({
//           "id": 1,
//           "name": _controller.text,
//         }),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           _response = 'Response: ${response.body}';
//         });
//       } else {
//         setState(() {
//           _response = 'Failed to send data. Status code: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _response = 'Error: $e';
//       });
//     }
//   }

//   void sendData() {
//     postData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: <Widget>[
//           TextField(
//             controller: _controller,
//             decoration: InputDecoration(
//               labelText: 'Enter data',
//               labelStyle: TextStyle(color: Colors.green), // Change label text color to green
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.green), // Change border color to green
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.green), // Change border color to green
//               ),
//             ),
//             style: TextStyle(color: Colors.green), // Change input text color to green
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: sendData,
//             child: Text('Send Data'),
//           ),
//           SizedBox(height: 20),
//           Text(
//             _response,
//             style: TextStyle(color: Colors.green), // Change response text color to green
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Search Bar with Carousel Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SearchPage(),
//     );
//   }
// }

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   TextEditingController _searchController = TextEditingController();
//   List<String> _allItems = [
//     "Apple",
//     "Banana",
//     "Cherry",
//     "Date",
//     "Elderberry",
//     "Fig",
//     "Grape",
//     "Honeydew"
//   ];
//   List<String> _filteredItems = [];
//   List<String> _carouselItems = [
//     "https://via.placeholder.com/600x400?text=Slide+1",
//     "https://via.placeholder.com/600x400?text=Slide+2",
//     "https://via.placeholder.com/600x400?text=Slide+3",
//     "https://via.placeholder.com/600x400?text=Slide+4",
//     "https://via.placeholder.com/600x400?text=Slide+5"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _filteredItems.addAll(_allItems);
//   }

//   void _filterItems(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         _filteredItems.clear();
//         _filteredItems.addAll(_allItems);
//       });
//     } else {
//       setState(() {
//         _filteredItems = _allItems
//             .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const double cardHeight = 200.0;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Bar with Carousel Demo"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                 ),
//               ),
//               onChanged: _filterItems,
//             ),
//           ),
//           Card(
//             margin: EdgeInsets.all(8.0),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             elevation: 4.0,
//             child: SizedBox(
//               height: cardHeight,
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   height: cardHeight,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 16 / 9,
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: Duration(milliseconds: 800),
//                   viewportFraction: 0.8,
//                 ),
//                 items: _carouselItems.map((item) => ClipRRect(
//                   borderRadius: BorderRadius.circular(15.0),
//                   child: Image.network(item, fit: BoxFit.cover, width: 1000),
//                 )).toList(),
//               ),
//             ),
//           ),
//           Card(
//             margin: EdgeInsets.all(8.0),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             elevation: 4.0,
//             child: SizedBox(
//               height: cardHeight,
//               child: Center(
//                 child: Text(
//                   "Hello Lizzie.",
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filteredItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_filteredItems[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/page1',
      routes: {
        '/page1': (context) => MyHomePage(),
        '/page2': (context) => SecondPage(),
        '/page3': (context) => ThirdPage(),
        '/page4': (context) => FourthPage(),
        '/page5': (context) => FifthPage(),
        '/page6': (context) => SixthPage(),
        '/dashboard': (context) => DashboardPage(),
        '/bookingScreen': (context) => BookingConsultationScreen(),
        '/pageIcad1': (context) => PageIcad1(),
        '/pageIcad2': (context) => PageIcad2(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg1_2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page2');
                },
                child: Text('Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2_2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page3');
                },
                child: Text('Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process form data
      String email = _emailController.text;
      String password = _passwordController.text;

      // You can now use 'email' and 'password' variables as needed

      // Example: Print form data
      print('Email: $email');
      print('Password: $password');
    }
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
              child: Image.asset(
                'assets/logo2.png',
                width: 150,
                height: 150,
              ),
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Login to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true, // for password fields
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // You can add more validation logic here for email format
                            return null;
                          },
                        ),
                        SizedBox(height: 10), // Adjust spacing as needed
                        TextButton(
                          onPressed: () {
                            // Add your 'forgot password' logic here
                            // For example, navigate to a password reset page
                            Navigator.pushNamed(context, '/forgot_password');
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitForm,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          child: Text('Start',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/page4');
                    },
                    child: Text('Sign Up'),
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

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Process form data
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      // Prepare the data to be sent to the backend
      Map<String, dynamic> formData = {
        'name': name,
        'email': email,
        'password': password,
      };

      // Send data to backend
      try {
        final response = await http.post(
          Uri.parse('http://nezha.chandrawisesa.com:8000/register/'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(formData),
        );

        if (response.statusCode == 200) {
          // If the server returns an OK response, extract the id from response body
          var responseBody = json.decode(response.body);
          String userId = responseBody[
              'id']; // Adjust 'id' to match your response structure

          // Navigate to Page5 and pass userId as a parameter
          Navigator.pushNamed(context, '/page5', arguments: {'userId': userId});
        } else {
          // If the server did not return an OK response, handle the error
          print('Failed to register: ${response.body}');
          _showErrorDialog('Failed to register. Please try again.');
        }
      } catch (error) {
        print('Error occurred while registering: $error');
        _showErrorDialog('Error occurred while registering. Please try again.');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('Okay'),
          ),
        ],
      ),
    );
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
              child: Image.asset(
                'assets/logo2.png',
                width: 150,
                height: 150,
              ),
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start your healthy journey with us',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // You can add more validation logic here for email format
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // You can add more validation logic here for password strength
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: _submitForm,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                                child: Text('Sign Up',
                                    style: TextStyle(color: Colors.white)),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/page3');
                    },
                    child: Text('Sign In'),
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

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
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

  void _navigateToFemalePage() {
    Navigator.pushNamed(context, '/page6');
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
                        onPressed: () {
                          // Handle male button press
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child:
                            Text('Male', style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: _navigateToFemalePage,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text('Female',
                            style: TextStyle(color: Colors.black)),
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

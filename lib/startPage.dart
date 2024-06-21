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
import 'secondPage.dart';
import 'thirdPage.dart';
import 'fourthPage.dart';
import 'fifthPage.dart';
import 'sixthPage.dart';
import 'dashboard.dart';
import 'bookingConsultationScreen.dart';
import 'pageIcad1.dart';
import 'pageIcad2.dart';


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











// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BelajarListView(),
//     );
//   }
// }

// class BelajarListView extends StatelessWidget {
//   final List bulan = [
//     "Januari",
//     "Fabruari",
//     "Maret",
//     "April",
//     "Mei",
//     "Juni",
//     "Juli",
//     "Agustus",
//     "September",
//     "Oktober",
//     "November",
//     "Desember"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("belajarFlutter.com"),
//       ),
//       body: ListView.builder(
//         itemCount: bulan.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Text(bulan[index], style: TextStyle(fontSize: 30)),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

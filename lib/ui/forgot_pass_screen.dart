// import 'package:flutter/material.dart';
// import 'package:anonia/route/route.dart' as route;

// class ForgotPasswordWidget extends StatefulWidget {
//   const ForgotPasswordWidget({Key? key}) : super(key: key);

//   @override
//   ForgotPasswordWidgetState createState() => ForgotPasswordWidgetState();
// }

// class ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
//   final phoneNumberController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     phoneNumberController.addListener(() {
//       setState(() {
//         //
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: InkWell(
//           onTap: () async {
//             Navigator.pop(context);
//           },
//           child: const Icon(
//             Icons.chevron_left_rounded,
//             size: 32,
//           ),
//         ),
//         title: const Text(
//           'Forgot Password',
//         ),
//         actions: [],
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
//             child: TextFormField(
//               obscureText: false,
//               decoration: InputDecoration(
//                 labelText: 'Enter your email',
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     width: 2,
//                   ),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     width: 2,
//                   ),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 filled: true,
//                 contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               children: const [
//                 Expanded(
//                   child: Text(
//                     'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
//               child: TextButton(
//                 onPressed: () {},
//                 child: const Text('Umm...'),
//               ))
//         ],
//       ),
//     );
//   }
// }

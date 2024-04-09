// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'login.dart';
// import 'hi.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sign Up Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SignPage(),
//     );
//   }
// }

// class SignPage extends StatelessWidget {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmController = TextEditingController();

//   void _showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.black54,
//       textColor: Colors.white,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up Page'),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//               () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HelloTherePage()),
//                 );
//               };
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               size: 20,
//               color: Colors.white,
//             )),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(height: 70),
//               const Text(
//                 'Sign up Page',
//                 style: TextStyle(
//                     fontSize: 36,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 'Welcome back sign up and sign up pager pls enter yout nmame and some informationn',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: confirmController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Colors.blue,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 128, vertical: 10),
//                     textStyle:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 onPressed: () {
//                   String email = emailController.text;
//                   String password = passwordController.text;
//                   _showToast('Email: $email\nPassword: $password');
//                 },
//                 child: Text('Sign Up'),
//               ),
//               SizedBox(height: 10),
//               const Text(
//                 'Already have an account?',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginPage()),
//                   );
//                 },
//                 child: Text('Log in'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

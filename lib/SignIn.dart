// import 'package:flutter/material.dart';
// import '../../services/auth.dart';
//
// class SignIn extends StatefulWidget {
//   @override
//   _SignInState createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   bool isDarkMode = false;
//   final AuthService _auth = AuthService();
//
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';
//   String error = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sign In", style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold
//         )),
//         backgroundColor: Colors.purple[800],
//       ),
//       backgroundColor: isDarkMode ? Color.fromRGBO(38, 6, 57, 1.0) : Color.fromRGBO(201, 143, 255, 1.0),
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 20.0),
//               TextFormField(
//                 style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
//                 decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(
//                   color: isDarkMode ? Colors.white70 : Colors.black87,
//                 )),
//                 validator: (val) => val!.isEmpty ? 'Enter your email' : null,
//                 onChanged: (val) {
//                   setState(() => email = val);
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
//                 decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(
//                   color: isDarkMode ? Colors.white70 : Colors.black87,
//                 )),
//                 obscureText: true,
//                 validator: (val) => val!.length < 1 ? 'Enter your password' : null,
//                 onChanged: (val) {
//                   setState(() => password = val);
//                 },
//               ),
//               SizedBox(height: 40.0),
//               ElevatedButton(
//                 child: Text('Sign In', style: TextStyle(color: Colors.white)),
//                 style: ButtonStyle(
//                   backgroundColor: WidgetStateProperty.all(Colors.purple[800]),
//                 ),
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//                     if (result is String) {
//                       setState(() => error = result);
//                     }
//                   }
//                 },
//               ),
//               SizedBox(height: 12.0),
//               Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             isDarkMode = !isDarkMode;
//           });
//         },
//         hoverColor: Colors.purpleAccent[700],
//         backgroundColor: Colors.purple[800],
//         child: Icon(
//           isDarkMode ? Icons.light_mode : Icons.dark_mode,
//           color: isDarkMode ? Color.fromRGBO(38, 6, 57, 1.0) : Color.fromRGBO(201, 143, 255, 1.0),
//           size: 30,
//         ),
//       ),
//     );
//
//   }
// }










// lib/pages/signin_page.dart

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class SignInPage extends StatefulWidget {
//   @override
//   _SignInPageState createState() => _SignInPageState();
// }
//
// class _SignInPageState extends State<SignInPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   String errorMessage = '';
//
//   Future<void> signIn() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message ?? 'An error occurred';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign In')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             if (errorMessage.isNotEmpty)
//               Text(errorMessage, style: TextStyle(color: Colors.red)),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: signIn,
//               child: Text('Sign In'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage=e.message ?? 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromRGBO(25, 0, 80, 0.4),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 50,
          right: 50,
          top: 50,
          bottom: 220,
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(26, 0, 67, 1.0),
                Color.fromRGBO(16, 0, 46, 1.0),
                Color.fromRGBO(9, 0, 27, 1.0),
              ],
            ),
          ),
          child: Column(
            children: [
              // SizedBox(height: 20,),
              Text('Authentication Required', style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: signIn,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green[800]),
                ),
                child: Text('Sign In', style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ),
              SizedBox(height: 10),
              if (errorMessage.isNotEmpty)
                Text(errorMessage, style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(9, 0, 27, 1),
    );
  }
}
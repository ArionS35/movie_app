import 'package:flutter/material.dart';
import 'package:movieexplorer/SignIn.dart';
import 'package:movieexplorer/edit.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromRGBO(25, 0, 80, 0.4),
      ),
      body: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                width: 100,
                height: 100,
                // child: Image.asset('assets/dp.png'),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/dp.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Name : Anonymous', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
              SizedBox(height: 10),
              Text('Email : abc@mail.com', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
              SizedBox(height: 10),
              Text('Phone : 123456789', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(
                  left: 186,
                  right: 186,
                ),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (context) => SignInPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red[800])
                  ),
                  child: Row(
                    children: [
                      Text('Sign out  ',style: TextStyle(
                        color: Colors.white
                      ),),
                      Icon(Icons.logout, color: Colors.white,)
                    ],
                  )
                )
              )
            ],
          )
        ),
      backgroundColor: const Color.fromRGBO(9, 0, 27, 1),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(eccentricity: 1),
        backgroundColor: Colors.deepPurple[800],
          child: Icon(Icons.edit_outlined),
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditPage()),);
          }
      ),
    );
  }
}

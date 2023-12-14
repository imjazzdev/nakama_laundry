import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/lupa_password.dart';
import 'package:nakama_laundry/view/pages/register.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 205, 248),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(30),
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 300,
            child: Image.asset('assets/logo.png'),
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, size: 28),
                fillColor: Colors.white,
                filled: true,
                // hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, size: 28),
                fillColor: Colors.white,
                filled: true,
                // hintText: 'Password',
                labelText: 'Password',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainNavigator(),
                  ),
                  (route) => false);
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tidak punya akun? '),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
                  },
                  child: Text('DAFTAR DISINI',
                      style: TextStyle(color: Colors.black))),
            ],
          )
        ],
      )),
    );
  }
}

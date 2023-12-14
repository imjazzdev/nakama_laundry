import 'package:flutter/material.dart';
import 'package:nakama_laundry/view/pages/home.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';
import 'package:nakama_laundry/view/widget/oke_botom_nav.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    bool isPasswordVisibile = false;
    bool isConfirmPwdVisibile = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Identitas Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nama'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'No. Telpon'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisibile = !isPasswordVisibile;
                        });
                      },
                      icon: Icon(isConfirmPwdVisibile == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(),
                  labelText: 'Kata sandi'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPwdVisibile = !isConfirmPwdVisibile;
                        });
                      },
                      icon: Icon(isConfirmPwdVisibile == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(),
                  labelText: 'Konfirmasi Password'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainNavigator(),
              ),
              (route) => false);
        },
        child: OkeBottomNav(
          txt: 'DAFTAR',
        ),
      ),
    );
  }
}

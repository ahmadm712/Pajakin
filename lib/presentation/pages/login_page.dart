//ROUTE BELUM ADA
//TAMPILAN LOG IN MASIH SEDERHANA

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Icon(Icons.person, size: 30, color: Colors.white,),
              ),
            ),
            SizedBox(height: 20,),

            Text("Selamat Datang", style: TextStyle(fontSize: 20, color: Colors.black),),

            SizedBox(height: 20,),

            TextFormField(
              decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  prefixIcon: Icon(Icons.person, size: 20,),
                  hintText: "masukkan username",
                  hintStyle: TextStyle(color:  Colors.grey),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.black)
              ),
            ),

            SizedBox(height: 15,),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  prefixIcon: Icon(Icons.visibility_off, size: 20,),
                  hintText: "masukkan password",
                  hintStyle: TextStyle(color:  Colors.grey),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black)
              ),
            ),

            SizedBox(height: 20,),

            Card(
              color: Colors.black,
              elevation: 5,
              child: Container(
                height: 40,
                width: 120,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: (){},
                  child: Center(
                    child: Text("Login", style: TextStyle(fontSize: 15, color: Colors.white),),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            Card(
              color: Colors.black,
              elevation: 5,
              child: Container(
                height: 40,
                width: 120,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: (){},
                  child: Center(
                    child: Text("Login Google", style: TextStyle(fontSize: 15, color: Colors.white),),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Text.rich(
              TextSpan(
                text: 'Lupa Kata Sandi? ',
                style: TextStyle(fontSize: 15,
                  decoration: TextDecoration.underline,),
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Belum punya akun?',
                style: TextStyle(fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Daftarkan Akun',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
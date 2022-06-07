import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Container(
                width: 400,
                height: 280,
                color: Colors.blue[900],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Selamat Datang di',
                        style: TextStyle(fontSize: 20,color: Colors.white)),
                    Text('PajakIn',
                        style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: heading6.copyWith(color: textGrey),
                              border: OutlineInputBorder(borderSide: BorderSide.none)
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14)
                        ),
                        child: TextFormField(
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: heading6.copyWith(color: textGrey),
                              suffixIcon: IconButton(
                                color: textGrey,
                                splashRadius: 1,
                                icon: Icon(passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                onPressed: togglePassword,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none
                              )
                          ),
                        ),
                      )
                    ],
                  )
              ),
              SizedBox(height: 25,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: 200,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Center(
                child: Text(
                  'Or',
                  style: heading6.copyWith(color: textGrey),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: 200,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Login with Google",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lupa kata sandi?',
                    style: regular16pt.copyWith(color: textGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      // onTap belum
                    },
                    child: Text(
                      'Klik Disini',
                      style: regular16pt.copyWith(color: Colors.blue[900]),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun? ',
                    style: regular16pt.copyWith(color: textGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()
                          )
                      );
                    },
                    child: Text(
                      'Daftarkan Akun',
                      style: regular16pt.copyWith(color: Colors.blue[900]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
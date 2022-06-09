import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

import 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVissiblePassword = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = GlobalFunctions.screenSize(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 400,
              decoration: BoxDecoration(
                color: kColorPrimary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Text(
                    'Selamat datang di',
                    style: GlobalFunctions.textTheme(context: context)
                        .headline3!
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    'PajakIn',
                    style: GlobalFunctions.textTheme(context: context)
                        .headline3!
                        .copyWith(color: Colors.white, fontSize: 48),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: size.width,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hai isi email dulu ya';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: kColorPrimary,
                        hintText: 'Email',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: kColorPrimary,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xffD6D6D6),
                            width: 1,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hai isi kata sandi dulu ya';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(16),
                          fillColor: kColorPrimary,
                          hintText: 'Kata Sandi',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: kColorPrimary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffD6D6D6),
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red.shade300,
                              width: 1,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: 154,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kColorPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            User? user =
                                await FirebaseServices.signInUsingEmailPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InformationAccountPage(user: user)),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Masuk',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun ?',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                  color: const Color(0xff9E9E9E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.REGISTER_PAGE);
                          },
                          child: Text(
                            'Daftar disini'.toUpperCase(),
                            style: GlobalFunctions.textTheme(context: context)
                                .headline3!
                                .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/data/services/firebase_services.dart';
import 'package:pajakin/presentation/pages/pages.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVissiblePassword = true;

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
                      obscureText: isVissiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Hai isi kata sandi dulu ya';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              isVissiblePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kColorPrimary,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                isVissiblePassword = !isVissiblePassword;
                              });
                            },
                          ),
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
                      width: 180,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kColorPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              await FirebaseServices.signInUsingEmailPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ).then((value) {
                                if (value != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                  );
                                }
                              });
                            } on FirebaseAuthException catch (e) {
                              print('Failed with error code: ${e.code}');
                              if (e.code == 'weak-password') {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message:
                                        'The password provided is too weak.',
                                    color: Colors.red);
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message:
                                        'Akun dengan email ini sudah di gunakan',
                                    color: Colors.red);
                              } else if (e.code == 'user-not-found') {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message:
                                        'Akun tidak ada , silahkan register dulu',
                                    color: Colors.red);
                              } else if (e.code == 'wrong-password') {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message: 'Password Salah',
                                    color: Colors.red);
                              } else if (e.code == 'too-many-requests') {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message:
                                        'Terlalu banyak permintaan login tunggu sebentar ...',
                                    color: Colors.red);
                              } else if (e.code == 'invalid-email') {
                                GlobalFunctions.scaffoldMessage(
                                    context: context,
                                    message:
                                        'Email salah. Masukan Email yang benar',
                                    color: Colors.red);
                              }
                            } catch (e) {
                              print('${e}');
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
                    SizedBox(
                      width: 180,
                      height: 45,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            primary: kColorPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          await FirebaseServices().signInWithGoogleNew().then(
                            (value) async {
                              if (await FirebaseServices()
                                  .searchUser(id: value.user!.uid)) {
                                Navigator.pushNamed(context, Routes.HOME_PAGE);
                              } else {
                                FirebaseServices()
                                    .registergoogleSignIn(user: value.user!)
                                    .then((value) => Navigator.pushNamed(
                                        context, Routes.HOME_PAGE));
                              }
                            },
                          ).catchError((e) {
                            GlobalFunctions.scaffoldMessage(
                                context: context,
                                message: e.toString(),
                                color: Colors.red);
                          });
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              '${assetIcons}icon-google.png',
                              height: 20,
                              width: 20,
                            ),
                            const Spacer(),
                            const Text(
                              'Sign In with Google',
                            ),
                          ],
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

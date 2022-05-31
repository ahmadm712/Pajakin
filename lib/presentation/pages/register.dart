import 'package:flutter/material.dart';
import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:pajakin/utils/routes.dart';
import 'package:pajakin/utils/styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPassController = TextEditingController(text: '');
  TextEditingController umkmNameController = TextEditingController(text: '');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVissiblePassword = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    umkmNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = GlobalFunctions.screenSize(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
              width: size.width,
              height: 132,
              decoration: BoxDecoration(
                color: kColorPrimary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  Image.asset(
                    '${assetIcons}icon-register.png',
                    width: 144,
                    height: 43,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Ayo daftarkan UMKM anda terlebih dahulu',
                    style: GlobalFunctions.textTheme(context: context)
                        .headline3!
                        .copyWith(color: Colors.white, fontSize: 14),
                  )
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
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi email';
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
                      controller: usernameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(16),
                          fillColor: kColorPrimary,
                          hintText: 'Username',
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
                      height: 16,
                    ),
                    TextFormField(
                      controller: umkmNameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi nama UMKM Nya';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: kColorPrimary,
                        hintText: 'Nama UMKM',
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
                          return 'Tolong isi passwrod';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(16),
                          fillColor: kColorPrimary,
                          hintText: 'Password',
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
                      height: 16,
                    ),
                    TextFormField(
                      controller: confirmPassController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: isVissiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi Password';
                        }
                        if (value != passwordController.text) {
                          return 'Password tidak sama';
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
                              color: Theme.of(context).primaryColorDark,
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
                          hintText: 'Confirm Password',
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
                      height: 12,
                    ),
                    SizedBox(
                      width: 154,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kColorPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          if (GlobalFunctions.validate(
                              context: context, formkey: formKey)) {
                            GlobalFunctions.scafoldMessage(
                                context: context,
                                message: 'Register Success',
                                color: Colors.green);
                          }
                        },
                        child: const Text(
                          'Daftar',
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
                          'Sudah punya akun ?',
                          style: GlobalFunctions.textTheme(context: context)
                              .headline3!
                              .copyWith(
                                  color: const Color(0xff9E9E9E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.LOGIN_PAGE);
                          },
                          child: Text(
                            ' login disini'.toUpperCase(),
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

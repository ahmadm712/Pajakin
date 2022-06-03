import 'package:pajakin/utils/constans.dart';
import 'package:pajakin/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:pajakin/utils/styles.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordController = TextEditingController(text: '');
  TextEditingController newPasswordController = TextEditingController(text: '');
  TextEditingController confirmNewPasswordController =
      TextEditingController(text: '');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVissiblePassword = false;

  @override
  void dispose() {
    super.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = GlobalFunctions.screenSize(context: context);
    return Scaffold(
      backgroundColor: kColorSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kColorSecondary,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            '${assetIcons}icon-back.png',
            height: 25,
            width: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kata Sandi',
              style: GlobalFunctions.textTheme(context: context)
                  .headline3!
                  .copyWith(
                      color: kColorPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                '${assetIcons}icon-padlock.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: size.width,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Informasi Kata Sandi Lama',
                            style: GlobalFunctions.textTheme(context: context)
                                .headline3!
                                .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextFormField(
                      controller: oldPasswordController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi kata sandi lama';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: kColorPrimary,
                        hintText: 'Kata Sandi Lama',
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
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Perubahan Kata Sandi Baru',
                            style: GlobalFunctions.textTheme(context: context)
                                .headline3!
                                .copyWith(
                                    color: kColorPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextFormField(
                      controller: newPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: isVissiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan isi kata sandi baru';
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
                          hintText: 'Kata Sandi Baru',
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
                      controller: confirmNewPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: isVissiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan konfirmasi kata sandi baru';
                        }
                        if (value != newPasswordController.text) {
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
                          hintText: 'Konfirmasi Kata Sandi Baru',
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
                      height: 100,
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
                                message: 'Ubah Kata Sandi Berhasil',
                                color: Colors.green);
                          }
                        },
                        child: const Text(
                          'Ubah Kata Sandi',
                        ),
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/custom_text_field.dart';
import 'package:newsco/provider/entry_provider.dart';
import 'package:newsco/utilities/const_colors.dart';
import 'package:newsco/utilities/const_elavatedbutton.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 50),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  text: 'Email',
                  icon: Icons.account_circle_outlined,
                  controller: emailTextEditingController,
                  val: (value) {
                    if (value == null ||
                        !value.endsWith('.com') ||
                        !value.contains('.com')) {
                      return 'Enter a Valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'Password',
                  icon: Icons.lock,
                  controller: passwordTextEditingController,
                  choice: true,
                  val: (value) {
                    if (value == null || value!.length < 8) {
                      return 'Must be grater than 8';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: 120,
                    child: Consumer<EntryProvider>(
                      builder: (context, value, child) {

                        return ElevatedButton(
                          onPressed: ()  {
                            if (formKey.currentState!.validate()) {

                               value.signInWithEmail(emailTextEditingController.text,
                                  passwordTextEditingController.text,context);


                            }
                          },
                          style: ConstEButton.Ebutton,
                          child: value.isLoading ?CircularProgressIndicator(color: Colors.white,) :const Text(
                            'Sign In',
                          ),
                        );


                      },

                    )),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Forget Password?',
                  style: TextStyle(color: ConstColors.constrColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

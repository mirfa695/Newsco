import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/custom_text_field.dart';
import 'package:newsco/model_class/class_user.dart';
import 'package:newsco/provider/entry_provider.dart';
import 'package:newsco/provider/firestore_provider.dart';
import 'package:newsco/utilities/const_elavatedbutton.dart';
import 'package:provider/provider.dart';

import '../../routing/route_name.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final cPasswordTextEditingController = TextEditingController();
  final nameTextEditingController=TextEditingController();
  final dobTextEditingController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 0.5),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  text: 'Full Name',
                  icon: Icons.account_circle_outlined,
                  controller: nameTextEditingController,
                  val: (value) {
                    if (value== null) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'Email',
                  icon: Icons.email,
                  controller: emailTextEditingController,
                  val: (value) {
                    if (value == null ||
                        !value.endsWith('.com') ||
                        !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(onTap: (){
                  CalendarDatePicker2(config: CalendarDatePicker2Config(), value: value,
                    onValueChanged: (dates)=>value=dates,
                  );
                },
                  
                  child: Container(
                    height: 60,width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(.3)),
                    child: Row(children: [
                      const SizedBox(width: 11,),
                      Icon(Icons.date_range,color: Colors.black.withOpacity(.3),),
                      const SizedBox(width: 11,),
                      Text('Date of Birth',style: TextStyle(color:Colors.black.withOpacity(.5),fontSize: 15),)
                    ],),
                  ),
                ),
                const SizedBox(height: 10,),
                CustomTextField(
                  text: 'Date of Birth',
                  icon: Icons.access_time,
                  controller: dobTextEditingController,
                  val: (value) {
                    if (value == null) {
                      return 'Please enter a value';
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
                  val: (value) {
                    if (value!.length < 8) {
                      return 'Paswword must be grater than 8';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  text: 'Confirm Password',
                  icon: Icons.remove_red_eye,
                  controller: cPasswordTextEditingController,
                  choice: true,
                  val: (value) {
                    if (value == passwordTextEditingController) {
                      return 'password must be same';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          User1 data=User1(name: nameTextEditingController.text,email: emailTextEditingController.text,dob: dobTextEditingController.text);
                          await context.read<EntryProvider>().registerUserWithEmail(data, passwordTextEditingController.text, context);
                        }
                      },
                      style:ConstEButton.Ebutton,
                      child:
                        context.watch<EntryProvider>().isLoading?const CircularProgressIndicator(
                          color: Colors.white,strokeWidth: .5,
                        ) :Text('Sign Up',
                        )
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/config/app_theme_manager.dart';
import '../../../core/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  static String routeName = "RegisterView";
  var formKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color(0XFFDFECDB),
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.2,
                  ),
                  Text(
                    "Full Name",
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.001,
                  ),
                  CustomTextField(
                    controller: fullNameController,
                    keyboardType: TextInputType.name,
                    hint: "Enter your Full Name",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.person),
                    onValidate: (value) {
                      if(value==null||value.trim().isEmpty){
                        return "you must enter full name";
                      }

                    },
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.03,
                  ),
                  Text(
                    "E-mail",
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.001,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    hint: "Enter your e-mail address",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.email_rounded),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your email";
                      }
                      var reges = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!reges.hasMatch(value)) {
                        return "Invalid e-mail";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.03,
                  ),
                  Text(
                    "Password",
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.001,
                  ),
                  CustomTextField(
                    maxLines: 1,
                    isPassword: true,
                    controller: passwordController,
                    hint: "Enter your password",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.remove_red_eye_rounded),
                    onChanged: (value) {
                      print(passwordController.text);
                    },
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your password";
                      }

                      var regex = RegExp(
                          r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                      if (!regex.hasMatch(value)) {
                        return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 8 characters long.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.03,
                  ),
                  Text(
                    "Confirm Password",
                    style: theme.textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.001,
                  ),
                  CustomTextField(
                    maxLines: 1,
                    isPassword: true,
                    controller: confirmPasswordController,
                    hint: "Enter your confirm password",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.remove_red_eye_rounded),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your password";
                      }
                      if(value !=passwordController.text){
                        return "password is not matched";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.025,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print("validate done");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        backgroundColor: ApplicationThemeManager.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create Account",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

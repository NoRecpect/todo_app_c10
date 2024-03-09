import 'package:flutter/material.dart';
import 'package:todo_app/features/registure/pages/register_view.dart';

import '../../../core/config/app_theme_manager.dart';
import '../../../core/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  static String routeName = "login view";
  var formKey =GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();


  LoginView({super.key});

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
            "Login",
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
                    "Welcome Back!",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your e-mail address",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.email_rounded),
                    onValidate: (value) {
                      if(value==null||value.trim().isEmpty){
                        return "You must enter your e-mail";
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
                    controller: passwordController,
                    maxLines: 1,
                    isPassword: true,
                    hint: "Enter your password",
                    hintColor: Colors.grey.shade700,
                    suffixWidget: const Icon(Icons.remove_red_eye_rounded),
                    onValidate: (value) {
                      if(value==null||value.trim().isEmpty){
                        return "you must enter your password";
                      }

                      return null;

                    },

                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.025,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()){
                        print("successfully login");

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
                          "Login",
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
                  Row(
                    children: [
                      Text(
                        "OR",
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterView.routeName);
                        },
                        child: Text(
                          "Create new account..",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

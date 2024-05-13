import 'package:estate_listings/view/login/widgets/input_email_widget.dart';
import 'package:estate_listings/view/login/widgets/input_password_widget.dart';
import 'package:estate_listings/view/login/widgets/login_button_widget.dart';
import 'package:estate_listings/view_models/controller/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("login".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputEmailWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        InputPasswordWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              LoginButtonWidget(formKey: _formKey,),
            ]),
      ),
    );
  }
}

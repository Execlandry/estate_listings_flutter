import 'package:estate_listings/res/components/round_button_widget.dart';
import 'package:estate_listings/view_models/controller/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  LoginButtonWidget({super.key,required this.formKey});

  final loginVM = Get.put(LoginViewModel());


  @override
  Widget build(BuildContext context) {
    return Obx(
                () => RoundButtonWidget(
                  width: 200,
                  title: 'login'.tr,
                  loading: loginVM.loading.value,
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      loginVM.loginApi();
                    }
                  },
                ),
              );
  }
}
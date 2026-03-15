import 'package:flutter/material.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/utils/app_regix.dart';

class EmailAndPassFormField extends StatefulWidget {
  const EmailAndPassFormField({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<EmailAndPassFormField> createState() => _EmailAndPassFormFieldState();
}

class _EmailAndPassFormFieldState extends State<EmailAndPassFormField> {
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CoustomFadeInRight(
            child: CustomTextField(
              controller: widget.emailController,
              hintText: context.translate(LangKeys.email),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          CoustomFadeInLeft(
            child: CustomTextField(
              controller: widget.passwordController,
              hintText: context.translate(LangKeys.password),
              obscureText: isPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: isPasswordVisible
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

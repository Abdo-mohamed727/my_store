import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/extensions/context_extensions.dart';

class SignUpFormField extends StatefulWidget {
  const SignUpFormField({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  State<SignUpFormField> createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CoustomFadeInDown(
            child: CustomTextField(
              controller: widget.nameController,
              hintText: context.translate(LangKeys.fullName),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.translate(LangKeys.validName);
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20.h),
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
          SizedBox(height: 20.h),
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

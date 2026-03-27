import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/coustom_text_form_field.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/features/auth/presintation/cubit/bloc/auth_bloc.dart';

class EmailAndPassFormField extends StatefulWidget {
  const EmailAndPassFormField({
    super.key,
  });

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
    final authBloc = context.read<AuthBloc>();
    return Form(
      key: authBloc.formKey,
      child: Column(
        children: [
          CoustomFadeInRight(
            child: CustomTextField(
              controller: authBloc.emailController,
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
              controller: authBloc.passwordController,
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
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

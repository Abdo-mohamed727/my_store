import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/animation/animate_do.dart';
import 'package:my_store/core/app/language/lang_keys.dart';
import 'package:my_store/core/app/widgets/coustom_linear_button.dart';
import 'package:my_store/core/app/widgets/text_app.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/routes/app_routes.dart';
import 'package:my_store/core/style/fonts/font_weight.dart';
import 'package:my_store/features/auth/presintation/cubit/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CoustomFadeInDown(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          await state.whenOrNull(
            success: (userRole) async {
              if (userRole == 'admin') {
                await context.pushReplacementNamed(AppRoutes.adminHomePage);
              } else {
                await context.pushReplacementNamed(AppRoutes.customerHomePage);
              }
            },
            error: (message) async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                width: double.infinity,
                onPressed: () {},
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
            orElse: () {
              return CustomLinearButton(
                width: double.infinity,
                onPressed: () {
                  if (context
                      .read<AuthBloc>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<AuthBloc>().add(const AuthEvent.login());
                  }
                },
                child: TextApp(
                  text: context.translate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

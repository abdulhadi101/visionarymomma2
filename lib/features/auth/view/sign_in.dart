import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionarymomma/common/loading_page.dart';
import 'package:visionarymomma/common/vbuttons.dart';
import 'package:visionarymomma/common/vtext_field.dart';
import 'package:visionarymomma/const/constants.dart';
import 'package:visionarymomma/features/auth/controller/auth_controller.dart';
import 'package:visionarymomma/features/auth/view/sign_up.dart';
import 'package:visionarymomma/services/validation_service.dart';

class SignIn extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignIn(),
      );
  const SignIn({Key? key}) : super(key: key);

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

@override
  void initState() {

    super.initState();
  }
  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  late String errorText;

  bool _checkValidatorsOfTextField() {
    if(ref.read(authControllerProvider.notifier).errorMessage != ""){

      errorText = ref.read(authControllerProvider.notifier).errorMessage;
      return true;
    }

    errorText = TextConstants.emailErrorText;
    return ! ValidationService.email(emailController.text);


  }

  bool _checkValidatorsOfPasswordField() {
    return ! ValidationService.password(passwordController.text);
  }
  bool _checkIfSignInButtonEnabled() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body:  isLoading ?  const Loader() : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                PathConstants.logo_name,
                height: 40.0,
                width: 140.0,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Login to your account',
                style: klabelTextStyle3,
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Resume where you left off', style: titleTextStyle),
              const SizedBox(
                height: 20,
              ),
              VTextField(
                keyboardType: TextInputType.emailAddress,
                placeholder: TextConstants.emailPlaceholder,
                controller: emailController,
                isError: _checkValidatorsOfTextField(),
                onTextChanged: () {
                  _checkValidatorsOfTextField();
                },
                errorText: errorText,
              ),
              const SizedBox(
                height: 10,
              ),
              VTextField(
                obscureText: true,
                placeholder: TextConstants.password,
                isError: _checkValidatorsOfPasswordField(),
                isInfo: _checkValidatorsOfPasswordField(),
                controller: passwordController,
                onTextChanged: () {
                  _checkValidatorsOfTextField();
                },
                errorText: TextConstants.passwordErrorText,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                bgColor: ColorConstants.secondaryColor,
                textColor: ColorConstants.white,
                title: TextConstants.login,
                onTap: () {

                  onLogin();

                },

              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    TextConstants.forgotPassword,
                    style: tabTitleTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(SignUp.route());
                  },
                  child: Text(
                    '${TextConstants.signUp} here',
                    style: tabTitleTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionarymomma/common/loading_page.dart';
import 'package:visionarymomma/common/vbuttons.dart';
import 'package:visionarymomma/common/vtext_field.dart';
import 'package:visionarymomma/const/constants.dart';
import 'package:visionarymomma/features/auth/controller/auth_controller.dart';
import 'package:visionarymomma/features/auth/view/auth_otp.dart';
import 'package:visionarymomma/features/auth/view/sign_in.dart';
import 'package:visionarymomma/services/validation_service.dart';

class SignUp extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUp(),
      );

  const SignUp({super.key});
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isButtonEnabled = false;

  void onSignUp() {
 ref.read(authControllerProvider.notifier).signUp(
        email: emailController.text,
        password: passwordController.text,
        context: context);

  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  void initState() {
    _checkValidatorsOfTextField() == false;
    _checkValidatorsOfPasswordField() == false;

    super.initState();
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
      backgroundColor: ColorConstants.secondaryColor,
      body: isLoading ?  const Loader() : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Image.asset(
                    PathConstants.logo,
                    alignment: Alignment.topLeft,
                    height: 32.0,
                    width: 42.0,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Let’s start with your email address and Password",
                      style: headingTextStyle1),
                  const SizedBox(
                    height: 30,
                  ),
                  VTextField(
                    textInputAction: TextInputAction.next,
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
                    textInputAction: TextInputAction.done,
                    isError: _checkValidatorsOfPasswordField(),
                    isInfo: _checkValidatorsOfPasswordField(),
                    obscureText: true,
                    placeholder: TextConstants.password,
                    controller: passwordController,
                    onTextChanged: () {
                      _checkValidatorsOfPasswordField();
                    },
                    errorText: TextConstants.passwordErrorText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: PrimaryButtonWithIcon(
                      // isEnabled: _checkIfSignInButtonEnabled() ? true :false,
                      title: "Continue",
                      onTap:

                      // _checkValidatorsOfTextField() ? () {} :

                          () {
                       onSignUp();
                       // if(ref.read(authControllerProvider.notifier).errorMessage != ""){
                       //
                       //
                       //
                       // }
                      },
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height/5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: normalTextWhite,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: SecondaryButton(
                      color: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).push(SignIn.route());
                      },
                      title: ' Login here ',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionarymomma/common/loading_page.dart';
import 'package:visionarymomma/common/vbuttons.dart';

import 'package:visionarymomma/const/constants.dart';
import 'package:visionarymomma/features/auth/controller/auth_controller.dart';

import 'package:visionarymomma/features/registration/view/registration_page.dart';




final inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100.0),
  borderSide: BorderSide(color: Colors.grey.shade400),
);

final inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
  border: inputBorder,
  focusedBorder: inputBorder,
  enabledBorder: inputBorder,
);



class AuthOTPPage extends  ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const AuthOTPPage(),
  );

  const AuthOTPPage({super.key});
  @override
  _AuthOTPPageState createState() => _AuthOTPPageState();
}

class _AuthOTPPageState extends   ConsumerState<AuthOTPPage> {
  final otpController = TextEditingController();

  FocusNode? pin2FN;
  FocusNode? pin3FN;
  FocusNode? pin4FN;
  FocusNode? pin5FN;
  FocusNode? pin6FN;
  final pinStyle = const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);

   String? userEmail ="null";


  void getUserEmail () async {

    final user = await ref.read(authControllerProvider.notifier).currentUser();
    userEmail = user?.email;

  }


  @override
  void initState() {
    super.initState();
    pin2FN = FocusNode();
    pin3FN = FocusNode();
    pin4FN = FocusNode();
    pin5FN = FocusNode();
    pin6FN = FocusNode();
    getUserEmail();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FN?.dispose();
    pin3FN?.dispose();
    pin4FN?.dispose();
    pin5FN?.dispose();
    pin6FN?.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
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
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Text("Enter the OTP sent to your email",
                      style: headingTextStyle1),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("We sent an OTP code to $userEmail verify to proceed",
                      style: kTitleTextStyle),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          autofocus: true,
                          style: pinStyle,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: inputDecoration,
                          onChanged: (value) {
                            nextField(value, pin2FN);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          focusNode: pin2FN,
                          style: pinStyle,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: inputDecoration,
                          onChanged: (value) => nextField(value, pin3FN),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          focusNode: pin3FN,
                          style: pinStyle,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: inputDecoration,
                          onChanged: (value) => nextField(value, pin4FN),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          focusNode: pin4FN,
                          style: pinStyle,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: inputDecoration,
                          onChanged: (value) => nextField(value, pin5FN),
                        ),
                      ),

                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          focusNode: pin5FN,
                          style: pinStyle,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: inputDecoration,
                          onChanged: (value) => nextField(value, pin6FN),
                        ),
                      ),

                      SizedBox(
                        width: 50,
                        child: TextFormField(
                          focusNode: pin6FN,
                          style: pinStyle,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: inputDecoration,
                          onChanged: (value) {
                            if (value.length == 1) {
                              pin4FN!.unfocus();
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: PrimaryButtonWithIcon(title: "Continue", onTap: (){
                      Navigator.pushReplacement(context,  MaterialPageRoute(
                        builder: (context) => const RegistrationPage(initialPage: 0),
                      ),);
                    },),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),



                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "This code shall expire in (10mins) ",
                        style: normalTextWhite,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Didn't receive an OTP? ",
                        style: normalTextWhite,
                      ),
                      TextButton(
                        child: const Text(
                            "Resent here (30s) "),
                        onPressed: (){},
                      ),

                    ],
                  ),

                ],

          ),
        ),
      ),
    );
  }
}

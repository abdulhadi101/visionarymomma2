import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionarymomma/common/common.dart';
import 'package:visionarymomma/const/constants.dart';
import 'package:visionarymomma/features/auth/controller/auth_controller.dart';
class EmailVerification extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const EmailVerification(),
  );
  const EmailVerification({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends ConsumerState<EmailVerification> {
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
                  Text("Let’s start with your email address and password",
                      style: headingTextStyle1),
                  const SizedBox(
                    height: 30,
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     SizedBox(
                  //       width: 50,
                  //       child: TextFormField(
                  //         autofocus: true,
                  //         style: pinStyle,
                  //         keyboardType: TextInputType.number,
                  //         textAlign: TextAlign.center,
                  //         decoration: inputDecoration,
                  //         onChanged: (value) {
                  //           nextField(value, pin2FN);
                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 50,
                  //       child: TextFormField(
                  //         focusNode: pin2FN,
                  //         style: pinStyle,
                  //         keyboardType: TextInputType.number,
                  //         textAlign: TextAlign.center,
                  //         decoration: inputDecoration,
                  //         onChanged: (value) => nextField(value, pin3FN),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 50,
                  //       child: TextFormField(
                  //         focusNode: pin3FN,
                  //         style: pinStyle,
                  //         keyboardType: TextInputType.number,
                  //         textAlign: TextAlign.center,
                  //         decoration: inputDecoration,
                  //         onChanged: (value) => nextField(value, pin4FN),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 50,
                  //       child: TextFormField(
                  //         focusNode: pin4FN,
                  //         style: pinStyle,
                  //         keyboardType: TextInputType.number,
                  //         textAlign: TextAlign.center,
                  //         decoration: inputDecoration,
                  //         onChanged: (value) => nextField(value, pin5FN),
                  //       ),
                  //     ),
                  //
                  //     SizedBox(
                  //       width: 50,
                  //       child: TextFormField(
                  //         focusNode: pin5FN,
                  //         style: pinStyle,
                  //         keyboardType: TextInputType.number,
                  //         textAlign: TextAlign.center,
                  //         decoration: inputDecoration,
                  //         onChanged: (value) => nextField(value, pin6FN),
                  //       ),
                  //     ),
                  //
                  //     SizedBox(
                  //       width: 50,
                  //       child: TextFormField(
                  //         focusNode: pin6FN,
                  //         style: pinStyle,
                  //         keyboardType: TextInputType.number,
                  //         textAlign: TextAlign.center,
                  //         decoration: inputDecoration,
                  //         onChanged: (value) {
                  //           if (value.length == 1) {
                  //             pin4FN!.unfocus();
                  //           }
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: PrimaryButtonWithIcon(title: "Continue", onTap: (){},),
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

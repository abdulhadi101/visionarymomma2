import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visionarymomma/common/vbuttons.dart';
import 'package:visionarymomma/const/constants.dart';
import 'package:visionarymomma/features/auth/view/sign_in.dart';
import 'package:visionarymomma/features/auth/view/sign_up.dart';


class WelcomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const WelcomePage(),
  );

  const WelcomePage({super.key});
  @override
  _WelcomePageState createState() => _WelcomePageState();
}


class _WelcomePageState extends State<WelcomePage> {

@override
void initState() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: ColorConstants.secondaryColor,
      body: Container(

      //  alignment: Alignment.topLeft,
       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const SizedBox(height: 10,),

              Column(

                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Image.asset(PathConstants.logo, alignment: Alignment.topLeft, height: 32.0, width: 42.0,),
                    const SizedBox(height: 30,),


                RichText(

                  text:  TextSpan(text: TextConstants.kheaderText, style: headingTextStyle2 , children:

                  [TextSpan(text: TextConstants.subtitle,  style: kBodyTextStyle2, )]

                  ),  ),

                    const SizedBox(height: 10,),
                    const SizedBox(height: 10,),
                    const SizedBox(height: 10,),

                  ],),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize:MainAxisSize.max ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child:
                PrimaryButton(onTap: (){
                  Navigator.of(context).pushReplacement(SignUp.route());
                }, title: 'Sign up here', ),),
                const SizedBox(width: 20.0,),
                Expanded(child:
                PrimaryButton(onTap: (){

                 Navigator.of(context).pushReplacement(SignIn.route());

                }, title: 'Continue to Login', ),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
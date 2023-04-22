import 'package:flutter/material.dart';
import 'package:visionarymomma/common/vbuttons.dart';
import 'package:visionarymomma/const/constants.dart';


class HomePage extends StatefulWidget {
  static const String path = "lib/src/pages/onboarding/intro6.dart";

  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: ColorConstants.secondaryColor,
      body: Container(

      //  alignment: Alignment.topLeft,
       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const SizedBox(height: 50,),

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
              ]),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize:MainAxisSize.max ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child:
                PrimaryButton(onTap: (){}, title: 'Sign up here', ),),
                const SizedBox(width: 20.0,),
                Expanded(child:
                PrimaryButton(onTap: (){}, title: 'Continue to Login', ),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
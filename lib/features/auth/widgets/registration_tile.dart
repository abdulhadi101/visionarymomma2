import 'package:flutter/material.dart';
import 'package:visionarymomma/common/common.dart';
import 'package:visionarymomma/const/constants.dart';

class RegistrationTile extends StatelessWidget {
  final title,  onClick, field;

  const RegistrationTile({Key? key, this.field, this.onClick, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
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
                Text(title,
                    style: headingTextStyle1),
                const SizedBox(
                  height: 30,
                ),
               field,

                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  child: PrimaryButtonWithIcon(

                    // isEnabled: _checkIfSignInButtonEnabled() ? true :false,
                    title: "Next",
                    onTap: () {
                    onClick;

                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/5,
            ),

          ],
        ),
      ),
    );
  }
}

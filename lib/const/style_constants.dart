import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:visionarymomma/const/color_constants.dart';

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  foregroundColor: ColorConstants.primaryColor, backgroundColor: ColorConstants.primaryColor,
  padding: const EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 13,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
);


ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
  foregroundColor: ColorConstants.thirdColor, backgroundColor: ColorConstants.textColorGrey,
  padding: const EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 13,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);



TextStyle bodyTextStyle = GoogleFonts.sora(
  fontSize: 14,
  color: ColorConstants.textBlack.withOpacity(.7),
);
TextStyle titleTextStyle = GoogleFonts.roboto(
  fontSize: 16,
  color: ColorConstants.textBlack,
  fontWeight: FontWeight.bold,
);



TextStyle tabTitleTextStyle = GoogleFonts.roboto(
  fontSize: 14,
  color: ColorConstants.textBlack,
  fontWeight: FontWeight.w500,
);

TextStyle normalTextWhite = GoogleFonts.roboto(
  fontSize: 14,
  color: ColorConstants.white,
  fontWeight: FontWeight.w400,
);

TextStyle headingTextStyle = GoogleFonts.sora(
  fontSize: 24,
  color: ColorConstants.textBlack,
  fontWeight: FontWeight.bold,
);
TextStyle headingTextStyle1 = GoogleFonts.sora(
  fontSize: 24,
  color: ColorConstants.white,
  fontWeight: FontWeight.bold,
);

TextStyle headingTextStyle2 = GoogleFonts.sora(
  fontSize: 32,
  color: ColorConstants.white,

  fontWeight: FontWeight.bold,
);

// Onboarding textStyle

TextStyle kTitleTextStyle = GoogleFonts.sora(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w700,
    color: ColorConstants.textColor,
    fontSize: 18.0,
  ),
);

TextStyle kBodyTextStyle1 = GoogleFonts.roboto(
    textStyle: const TextStyle(

        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: ColorConstants.textColorGrey));

TextStyle kBodyTextStyle2 = GoogleFonts.roboto(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18.0,
        color: ColorConstants.grey));

const klabelTextStyle2 =
TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w900);
const klabelTextStyle3 = TextStyle(
    color: ColorConstants.primaryColor,
    fontSize: 25.0, fontWeight: FontWeight.w700);
const klabelTextStyle4 = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);
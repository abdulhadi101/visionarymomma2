import 'package:flutter/material.dart';
import 'package:visionarymomma/const/color_constants.dart';

class PrimaryButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String title;
  final bool isEnabled;
  final Function() onTap;
  const PrimaryButton(
      {Key? key,
        this.bgColor = ColorConstants.thirdColor,
        this.textColor = ColorConstants.primaryColor,
        required this.title,
        this.isEnabled = true,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: isEnabled
          ? BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
      )
          : BoxDecoration(
        color: ColorConstants.disabledColor,
        //   color: isEnabled
        // ? ColorConstants.primaryColor
        // : ColorConstants.disabledColor,

        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style:  TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryButtonWithIcon extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Color bgColor;
  final Color textColor;
  final Icon icon;
  final Function() onTap;
  const PrimaryButtonWithIcon(
      {Key? key,
        required this.title,
        this.bgColor = ColorConstants.thirdColor,
        this.textColor = ColorConstants.primaryColor,
        this.icon = const Icon(Icons.arrow_forward, color: ColorConstants.primaryColor,),
        this.isEnabled = true,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: isEnabled
          ? BoxDecoration(
      color: ColorConstants.thirdColor,
        borderRadius: BorderRadius.circular(100),
      )
          : BoxDecoration(
        color: ColorConstants.disabledColor,
        //   color: isEnabled
        // ? ColorConstants.primaryColor
        // : ColorConstants.disabledColor,

        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10,),
                icon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Color color;
  final Function() onTap;
  const SecondaryButton(
      {Key? key,
        required this.title,
        this.color = ColorConstants.primaryColor,
        this.isEnabled = true,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: isEnabled
          ? BoxDecoration(
        border: Border.all(color: ColorConstants.textColorGrey),
        color: color,
        borderRadius: BorderRadius.circular(100),
      )
          : BoxDecoration(
        color: ColorConstants.disabledColor,
        // color: isEnabled
        //     ? ColorConstants.primaryColor
        //     : ColorConstants.disabledColor,

        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: ColorConstants.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
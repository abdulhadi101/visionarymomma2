import 'package:flutter/material.dart';
import 'package:visionarymomma/const/color_constants.dart';
import 'package:visionarymomma/const/path_constants.dart';
//import 'package:flutter/services.dart';

class VTextField extends StatefulWidget {
  final String placeholder;
  final String errorText;
  final bool obscureText;
  final bool isInfo;
  final bool isError;
  final TextEditingController controller;
  final VoidCallback onTextChanged;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;

  const VTextField({
    required this.placeholder,
    this.obscureText = false,
    this.isError = false,
    this.isInfo = false,
    required this.controller,
    required this.onTextChanged,
    required this.errorText,
    this.textInputAction = TextInputAction.done,
    this.keyboardType,
    Key? key,
  }) : super(key: key);

  @override
  VTextFieldState createState() => VTextFieldState();
}

class VTextFieldState extends State<VTextField> {
  final focusNode = FocusNode();
  bool stateObscureText = false;
  bool stateIsError = false;

  bool stateIsInfo = false;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(
          () {
        setState(() {
          if (focusNode.hasFocus) {
            stateIsError = false;
          }
        });
      },
    );

    stateObscureText = widget.obscureText;
    stateIsError = widget.isError;
    stateIsInfo = widget.isInfo;
  }

  @override
  void didUpdateWidget(covariant VTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    stateIsInfo = widget.isInfo;
    stateObscureText = widget.obscureText;
    stateIsError = focusNode.hasFocus ? false : widget.isError;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _createTextFieldStack(),
          if (stateIsError) ...[
            _createError(),
          ],
        ],
      ),
    );
  }


  Widget _createTextFieldStack() {
    return Stack(

      children: [
        _createTextField(),
        if (widget.obscureText) ...[
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: _createShowEye(),
          ),
        ],
      ],
    );
  }

  Widget _createTextField() {
    return TextField(


      focusNode: focusNode,
      controller: widget.controller,
      obscureText: stateObscureText,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,

      style: const TextStyle(
        color: ColorConstants.primaryColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
            color: stateIsError
                ? ColorConstants.errorColor
                : ColorConstants.textFieldBorder.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            color: ColorConstants.textGrey,
          ),
        ),
        hintText: widget.placeholder,
        hintStyle: const TextStyle(

          color: ColorConstants.textGrey,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
      onChanged: (text) {
        setState(() {});
        widget.onTextChanged();
      },
    );
  }

  Widget _createShowEye() {
    return GestureDetector(
      onTap: () {
        setState(() {
          stateObscureText = !stateObscureText;
        });
      },
      child: Image(
        image: const AssetImage(
          PathConstants.eye,
        ),
        color: widget.controller.text.isNotEmpty
            ? ColorConstants.primaryColor
            : ColorConstants.grey,
      ),
    );
  }

  Widget _createError() {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        children: [
           Icon(  stateIsInfo ?  Icons.info_outline :  Icons.cancel, color: stateIsInfo ? ColorConstants.white: ColorConstants.errorColor,),
         const SizedBox(width: 8.0,),
          Flexible(

            child: Text(
              widget.errorText,
              style:  TextStyle(
                overflow: TextOverflow.visible,
                fontSize: 12,
                color: stateIsInfo ? ColorConstants.white: ColorConstants.errorColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// defult button function
Widget defultButton({
  double containerWidth = double.infinity,
  Color buttonBackground = Colors.green,
  required Function buttonFunction,
  required String buttonName,
  bool isUperCase = true,
}) =>
    SizedBox(
      width: containerWidth,
      child: MaterialButton(
        color: buttonBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
        height: 58,
        onPressed: () => buttonFunction(),
        child: Text(
          isUperCase ? buttonName.toUpperCase() : buttonName,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

// EmailAdress Field
Widget defultEmailFormField({
  required TextEditingController controller,
  required String hintText,
  required IconData suffixIcon,
  required Function(String)? onChanged,
  String? email,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextFormField(
          onChanged: onChanged,
          onFieldSubmitted: (newValue) {
            email = newValue;
          },
          controller: controller,
          autofillHints: const [AutofillHints.email],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email address';
            }
            if (!value.contains('@')) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            labelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.black,
            ),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: "Julee",
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
          )),
    );

void navigateToNextPage(BuildContext context, String recordName) {
  if (recordName.isEmpty) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Empty Record Name',
      desc: 'Please enter a name for the record.',
      btnOkOnPress: () {},
    ).show();
  } else {
    Navigator.pushNamed(context, '/next-page', arguments: recordName);
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:diseases_checker/style/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Next extends StatefulWidget {
  const Next({super.key});

  @override
  State<Next> createState() => _NextState();
}

String nextSignup = "next";

class _NextState extends State<Next> {
  String? Selectedgovernorate;
  final myFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: hight,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: hight / 2,
                decoration: BoxDecoration(
                    color: ColorConstants.starterWhite,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 100,
                      child: Image(
                        image: AssetImage("images/NextLogo.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Continue".tr,
                      style: TextStyle(
                          fontSize: 20,
                          color: ColorConstants.cardBackGroundColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Julee',
                          fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: hight,
                  child: Form(
                    key: myFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          height: hight / 1.5,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(32)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'More information'.tr,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Julee",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return ("please enter your name".tr);
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: ColorConstants
                                                    .starterWhite)),
                                        // filled: true,
                                        prefixIcon: Icon(Icons.person,
                                            color: ColorConstants
                                                .cardBackGroundColor),
                                        hintText: "Member Name".tr,
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "Julee",
                                        )),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.length < 11) {
                                        return ("please enter your real number"
                                            .tr);
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color:
                                                  ColorConstants.starterWhite)),
                                      // filled: true,
                                      prefixIcon: const Icon(Icons.phone),
                                      hintText: "Phone".tr,
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "Julee",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  DropdownSearch<String>(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return ("please enter your governorate"
                                            .tr);
                                      }
                                      return null;
                                    },
                                    popupProps: PopupProps.menu(
                                      showSelectedItems: true,
                                      showSearchBox: true,
                                      disabledItemFn: (String s) =>
                                          s.startsWith('I'.tr),
                                    ),
                                    items: [
                                      "Cairo".tr,
                                      "Giza".tr,
                                      'Alexandria'.tr,
                                      'Dakahlia'.tr,
                                      'Menoufia'.tr,
                                      'Qalyubia'.tr,
                                      'Albuhayra'.tr,
                                      'Algharbia'.tr,
                                      'Port Saeed'.tr,
                                      'Damietta'.tr,
                                      'Ismailia'.tr,
                                      'Suez'.tr,
                                      'Kafr al-Sheikh'.tr,
                                      'Fayoum'.tr,
                                      'Bani Sweif'.tr,
                                      'Matruh'.tr,
                                      'North Sinai'.tr,
                                      'South of Sinai'.tr,
                                      'El-Minya'.tr,
                                      'Asyut'.tr,
                                      'Sohag'.tr,
                                      'Qena'.tr,
                                      'Albahr al-Ahmar'.tr,
                                      'Al-uqsar'.tr,
                                      'Aswan'.tr,
                                      'alwahat'.tr,
                                      'the new Valley'.tr
                                    ],
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: ColorConstants
                                                    .starterWhite)),
                                        hintText: "Governorate".tr,
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "Julee",
                                        ),
                                      ),
                                    ),
                                    onChanged: print,
                                    selectedItem: Selectedgovernorate,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Now you are almost ready".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Julee",
                                ),
                              ),
                              const SizedBox(height: 16),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(31)),
                                height: 40,
                                color: ColorConstants.primaryColor,
                                onPressed: () {
                                  if (myFormKey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ));
                                  }
                                },
                                child: Text(
                                  'Sign up'.tr,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31)),
                            height: 40,
                            color: ColorConstants.primaryColor,
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Back'.tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

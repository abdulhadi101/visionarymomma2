import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionarymomma/common/common.dart';
import 'package:visionarymomma/const/constants.dart';
import 'package:visionarymomma/features/auth/controller/auth_controller.dart';
import 'package:visionarymomma/features/auth/widgets/registration_tile.dart';
import 'package:visionarymomma/features/registration/controller/user_reg_controller.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  final int initialPage;

  const RegistrationPage( {required this.initialPage,
    Key? key,
  }) : super(key: key);


  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationPageState();
}




class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  // late TextEditingController  firstNameController;
  // late TextEditingController  lastNameController;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();




  final cityController = TextEditingController();
  late final pageController = PageController(initialPage: widget.initialPage,);
  String? _dropDownCountry;
  String? _dropDownState;
  int groupValue = 0;
  bool numberOfkids = true;
  num kidsNumber = 1;

  final  inviterId = TextEditingController();


  //   @override
  //   void initState() {
  //     super.initState();
  //     firstNameController = TextEditingController(
  //       text: ref.read(currentUserDetailsProvider).value?.firstname ?? '',
  //     );
  //     lastNameController = TextEditingController(
  //       text: ref.read(currentUserDetailsProvider).value?.lastname ?? '',
  //     );
  //
  // }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(userProfileControllerProvider);
  final user = ref.watch(currentUserDetailsProvider).value;
  final id = ref.watch(currentUserAccountProvider).value;
  print(user);
 //  print(id?.email);
    return Scaffold(
      backgroundColor: ColorConstants.secondaryColor,
      body:
      isLoading ? const Loader():
      PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
        RegistrationTile(
        title:
        "To enable us customize your experience, and provide maximum value to you on the VMomas app, please complete the registration below",
        field: Column(
          children: [
            VTextField(
              placeholder: "First name",
              controller: firstNameController,
              onTextChanged: () {},
              errorText: '',
            ),
            const SizedBox(
              height: 10.0,
            ),
            VTextField(
              placeholder: "Last name",
              controller: lastNameController,
              onTextChanged: () {},
              errorText: '',
            ),
          ],
        ),

        onClick: () {

          pageController.animateToPage(1,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
          print("hello im here");

          // ref.read(userProfileControllerProvider.notifier).updateUserProfile(userModel: user!.copyWith(
          //   firstname: firstNameController.text,
          //   lastname: lastNameController.text,
          //
          // ),  context: context,
          //
          //   );





          },
      ),
          selectCountry(),
          selectState(),
          city(),
          maternalStatus(),
          inverterId(),
        ],
      ),
    );
  }

  RegistrationTile selectCountry() {
    return RegistrationTile(onClick: (){
      pageController.animateToPage(2,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    },
      title: "Select your coutry of residence",
      field: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: ColorConstants.textFieldBorder.withOpacity(0.4),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: ColorConstants.secondaryColor,
            hint: _dropDownCountry == null
                ? const Text('Select Country',
                    style: TextStyle(color: ColorConstants.grey))
                : Text(
                    _dropDownCountry!,
                    style: const TextStyle(color: ColorConstants.grey),
                  ),
            isExpanded: true,
            icon: const Icon(
              Icons.arrow_drop_down_outlined,
              color: ColorConstants.grey,
            ),
            iconSize: 30.0,
            style: const TextStyle(color: ColorConstants.grey),
            items: ['One', 'Two', 'Three'].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  _dropDownCountry = val!;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  RegistrationTile selectState() {
    return RegistrationTile(
      onClick: (){
        pageController.animateToPage(3,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      title: "Select your State/Province of residence",
      field: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: ColorConstants.textFieldBorder.withOpacity(0.4),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: ColorConstants.secondaryColor,
            hint: _dropDownState == null
                ? const Text('Select State',
                    style: TextStyle(color: ColorConstants.grey))
                : Text(
                    _dropDownState!,
                    style: const TextStyle(color: ColorConstants.grey),
                  ),
            isExpanded: true,
            icon: const Icon(
              Icons.arrow_drop_down_outlined,
              color: ColorConstants.grey,
            ),
            iconSize: 30.0,
            style: const TextStyle(color: ColorConstants.grey),
            items: ['One', 'Two', 'Three'].map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  _dropDownState = val!;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // RegistrationTile firstAndLastname() {
  //   return RegistrationTile(
  //     title:
  //         "To enable us customize your experience, and provide maximum value to you on the VMomas app, please complete the registration below",
  //     field: Column(
  //       children: [
  //         VTextField(
  //           placeholder: "First name",
  //           controller: firstNameController,
  //           onTextChanged: () {},
  //           errorText: '',
  //         ),
  //         const SizedBox(
  //           height: 10.0,
  //         ),
  //         VTextField(
  //           placeholder: "Last name",
  //           controller: lastNameController,
  //           onTextChanged: () {},
  //           errorText: '',
  //         ),
  //       ],
  //     ),
  //     onClick: () {
  //
  //       //ref.read(userProfileControllerProvider.notifier).updateUserProfile(userModel: , context: context);
  //
  //
  //       pageController.animateToPage(1,
  //           duration: const Duration(milliseconds: 500), curve: Curves.ease);
  //     },
  //   );
  // }

  RegistrationTile city() {
    return RegistrationTile(
      title: "Enter your City/Town of residence",
      field: Column(
        children: [
          VTextField(
            placeholder: "City/Town",
            controller: cityController,
            onTextChanged: () {},
            errorText: '',
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
      onClick: () {
        pageController.animateToPage(4,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  RegistrationTile inverterId() {
    return RegistrationTile(
      skipButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextButton(child: const Text("Skip this step"), onPressed: (){}),
      ),
      title: "If you were invited by a moma, please provide her inviters ID",
      field: Column(
        children: [
          VTextField(
            placeholder: "Inviter’s ID",
            controller: inviterId,
            onTextChanged: () {},
            errorText: '',
          ),
          const SizedBox(
            height: 10.0,
          ),


        ],
      ),
      onClick: () {
        pageController.animateToPage(4,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  RegistrationTile maternalStatus() {
    return RegistrationTile(

      title: "What best describes your maternal status",
      field: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<int>(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),

            title: Row(children: const [Text("Current Mom")]),
            value: 0,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = 0;
                numberOfkids = !numberOfkids;
              });
            },
          ),
       
          Visibility(
            visible:
            numberOfkids,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("How many kids do you have?"),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (kidsNumber == 1) {
                          } else {
                            kidsNumber--;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(20.0, 20.0),
                        backgroundColor: ColorConstants.grey,
                        shape: const CircleBorder(),
                      ),
                      child: const Text(
                        '-',
                        style: TextStyle(fontSize: 24, color: ColorConstants.textBlack),
                      ),
                    ),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            kidsNumber.toString(),
                            style: klabelTextStyle2,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (kidsNumber >= 10) {
                          } else {
                            kidsNumber++;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.grey,
                        fixedSize: const Size(20.0, 20.0),
                        shape: const CircleBorder(),
                      ),
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //

          RadioListTile<int>(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            //  activeColor: ColorConstants.secondaryColor,
            title: Row(children: const [Text("Future Mom")]),
            value: 1,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = 1;
               numberOfkids = !numberOfkids;
              });
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
      onClick: () {
        pageController.animateToPage(5,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }
}

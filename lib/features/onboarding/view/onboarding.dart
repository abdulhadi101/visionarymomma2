import 'package:flutter/material.dart';
import 'package:visionarymomma/common/common.dart';

import 'package:visionarymomma/const/constants.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:visionarymomma/features/auth/view/welcome.dart';
import 'package:visionarymomma/features/onboarding/widgets/onboard_image.dart';


class OnboardingPage extends StatefulWidget {


  const OnboardingPage({super.key});
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> titles = [
    TextConstants.onboarding1Title,
    TextConstants.onboarding2Title,
    TextConstants.onboarding3Title,
    TextConstants.onboarding4Title,
  ];
  final List<String> descriptions = [
    TextConstants.onboarding1Description,
    TextConstants.onboarding2Description,
    TextConstants.onboarding3Description,
    TextConstants.onboarding4Description,
  ];
  final List<Color> colors = [
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.indigo.shade300,
    Colors.yellow.shade300,
  ];

  final List<String> onboardimages = [
    PathConstants.onboarding1,
    PathConstants.onboarding2,
    PathConstants.onboarding3,
    PathConstants.onboarding4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: const SwiperPagination(
              margin: EdgeInsets.only(bottom: 100),
              builder: DotSwiperPaginationBuilder(
                color: ColorConstants.loadingBlack,
                activeColor: ColorConstants.thirdColor,
                size: 8,
                activeSize: 10.0,
              ),
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return OnboardingItems(
                title: titles[index],
                descriptions: descriptions[index],
                bg: colors[index],
                image: onboardimages[index],
              );
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
              child: Row(
                children: [

                  Expanded(child: TextButton(
                    child:  Text(TextConstants.skip,
                      style: kBodyTextStyle1,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          WelcomePage.route()
                      );
                    },
                  ),),
                  Expanded(child: PrimaryButton(

                    title: _currentIndex == 3 ? TextConstants.done :  TextConstants.next,
                    onTap: (){
                      if (_currentIndex != 3) {
                        _controller.next();
                      } else {
                        Navigator.of(context).pushReplacement(
                            WelcomePage.route()
                        );
                      }
                    },
                  ),)

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class OnboardingItems extends StatelessWidget {
  final String title;
  final String? descriptions;
  final Color? bg;
  final String? image;

  const OnboardingItems(
      {Key? key, required this.title, this.descriptions, this.bg, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            flex: 3,
            child: ClipPath(
              clipper: WaveClipperOne(flip: false),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      ColorConstants.thirdColor,
                      ColorConstants.secondaryColor,
                    ],
                    stops: [
                      0.55,
                      1,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: OnboardImage(
                                     image!,
                                     fit: BoxFit.cover,
                                    ),
                ),
              ),
            ),
          ),
          //  const SizedBox(height: 30.0),

          Expanded(
            flex: 2,
            child: Column(
              children: [Padding(
                padding: const EdgeInsets.fromLTRB(45, 50, 45, 15),
                child: Text(
                  title,
                  style: kTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                ),
                child: Text(
                  descriptions!,
                  style: kBodyTextStyle1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],),
          ),


        ],
      ),
    );
  }
   }

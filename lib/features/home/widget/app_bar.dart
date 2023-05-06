import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/name_vlogo.svg',
            height: 28,
          ),
          const Spacer(),
          GestureDetector(
            child: const Icon(
              IconlyLight.search,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            child: const Icon(
              IconlyLight.notification,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          CircleAvatar(
            maxRadius: 18,
            child: ClipOval(
              child: Image.asset('assets/images/onboarding/momma1.png'),
            ),
          )
        ],
      ),
    );
  }
}

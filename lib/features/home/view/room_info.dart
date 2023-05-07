import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoomInfo extends StatelessWidget {
  const RoomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  maxRadius: 50,
                  child: ClipOval(
                    child: Image.asset('assets/images/onboarding/momma1.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Group Name',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RoomItem(title: 'Resource Hub', value: '4', route: 'route'),
              RoomItem(title: 'Favorite Post', value: '12', route: 'route'),
              RoomItem(
                  title: 'Notification Setting',
                  value: 'Muted',
                  route: 'route'),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Group Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomItem extends StatelessWidget {
  const RoomItem({
    super.key,
    required this.title,
    required this.value,
    required this.route,
  });

  final String title, value, route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(248, 248, 248, 1),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/xy.svg"),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          )
        ],
      ),
    );
  }
}

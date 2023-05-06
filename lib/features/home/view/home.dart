import 'package:flutter/material.dart';

import '../../../common/vbuttons.dart';
import '../widget/app_bar.dart';
import '../widget/group_card.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const AppBarHome(),
                TabBar(
                  labelColor: Colors.black,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: 'Feed',
                    ),
                    Tab(
                      text: 'Exclusive Offers',
                    ),
                  ],
                  controller: tabController,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: const Color.fromRGBO(245, 244, 248, 1),
          child: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(child: FeedScreen()),
              Container(
                color: Colors.green,
              )
            ],
          ),
        ),
        // bottomSheet: Container(
        //   height: size.height * 0.2,
        //   color: Colors.white60,
        //   child: FeedButton(),
        // ),
      ),
    );
  }
}

class FeedScreen extends StatelessWidget {
  const FeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List RandomImages = [
      'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
      'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
      'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s'
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'You don\'t seem to have many\ngroups. Join more groups?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FeedButton(),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Joined Group',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GroupCard(RandomImages: RandomImages),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Recommended Rooms',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return GroupCard(RandomImages: RandomImages);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedButton extends StatelessWidget {
  const FeedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Color.fromRGBO(98, 71, 241, 1),
          ),
          child: const Text(
            'Find groups',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

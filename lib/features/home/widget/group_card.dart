import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.RandomImages,
  });

  final List RandomImages;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vmonas Groups',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 10,
                  child: Image.asset('assets/images/vlogo.png'),
                ),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  'Vmonas Groups',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 13, 8, 0),
              child: Row(
                children: [
                  Row(
                    children: [
                      for (int i = 0; i < RandomImages.length; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 0),
                          child: Align(
                              widthFactor: 0.6,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    RandomImages[i],
                                  ),
                                ),
                              )),
                        )
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 18,
                      child: Center(
                        child: Text(
                          '+23',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

            // Expanded(
            //   child: ListView.builder(itemBuilder: (context, index) {
            //     return Container();
            //   }),
            // )
          ],
        ),
      ),
    );
  }
}

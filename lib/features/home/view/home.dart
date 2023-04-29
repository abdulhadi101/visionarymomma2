import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {

  static route() => MaterialPageRoute(
    builder: (context) => const HomePage(),
  );
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

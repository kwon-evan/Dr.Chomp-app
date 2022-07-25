import 'package:flutter/material.dart';

class my_page extends StatelessWidget {
  const my_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Logo("Home Page"),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {},
              child: const Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}


class Logo extends StatelessWidget {
  final String title;

  const Logo(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/img1.jpg",
          height: 70,
          width: 70,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}


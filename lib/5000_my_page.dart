import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/main.dart';

import 'styles/app_styles.dart';

class my_page extends StatelessWidget {
  const my_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),

                //컬러 Red, Blue로 변경하면 요즘느낌 가능
                colors: <Color>[
                  Colors.amberAccent,
                  Colors.amber,
                ],
                stops: <double>[0.0, 1.0],
                tileMode: TileMode.clamp),
            // 하단만 cirular 주기
            // borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom:  Radius.circular(30))
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
            padding: EdgeInsets.zero,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {

            },
            padding: EdgeInsets.zero,
          )
        ],
        iconTheme: IconThemeData(),
        // color black

        title: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("내 정보",
                style: TextStyle(fontFamily: "NotoSans",
                    fontSize: 23,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Styles.bgColor,
        elevation: 0,

      ), // 상단 바


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


      bottomNavigationBar: navi_bar(),
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


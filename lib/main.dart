import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart'; //뛰어쓰기
import 'package:untitled/5000_my_page.dart';
import 'package:untitled/styles/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
            padding: EdgeInsets.zero,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
            padding: EdgeInsets.zero,
          )
        ],
        iconTheme: IconThemeData(),
        // color black
        leading: IconButton(
            icon: Icon(Icons.menu), onPressed: () {}, padding: EdgeInsets.zero),
        title: Text("쩝접박사", style: Styles.headLineStyle2),
        backgroundColor: Styles.bgColor,
        elevation : 0,

      ), // 상단 바

      body: ListView(
          children:[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(  // 1열
                    children: [
                      Container( // 사진
                        margin: EdgeInsets.all(10),
                        height:40,
                        width: 40,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/img1.jpg"
                              )
                          ),


                        ),
                      ),

                      Expanded(

                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.my_location_sharp),
                              Text("   "), // icon이랑 text 여백
                              Text("포항시 남구 지곡로 102",style: Styles.headLineStyle4,
                              )
                            ],
                          )
                      ),

                    ],
                  ),
                  const Gap(10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6Fd)
                    ),
                    padding : const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Color(0xFFBFC205),size: 30),
                        Text(
                          "오늘은 무엇을 먹을까요?",
                          style: Styles.headLineStyle4,
                        )
                      ],
                    ),
                  ),
                  const Gap(30),

                  Row(
                    children: [
                      Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffeeeeee)
                        ),
                        // padding : const EdgeInsets.symmetric(horizontal: ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Icon(Icons.mode_of_travel, color: Color(
                                0xFF414141),size: 30),
                            Gap(10),
                            Text(
                              "진행중인 일정이 없습니다.",
                              style: Styles.headLineStyle4,
                            ),
                            Gap(10),
                            ElevatedButton(onPressed: (){},
                              child: Text("일정 추가하기"),
                              style: ElevatedButton.styleFrom(
                                maximumSize: Size(120, 50),
                                  primary: Color(0xffee2d2d),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  elevation: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Row()),
                      //자리 차지
                      Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffeeeeee)
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/food1.jpg",width: 180,alignment: Alignment.topCenter),
                            Gap(10),
                            Text(
                              "오늘은 든든한 한정식어떠세요?",
                              style: TextStyle(fontSize: 13,fontStyle: FontStyle.italic),
                            )
                          ],
                        ),

                      ),
                    ],
                  ),
                  HomeBodyBanner(),
                ],
              ),
            ),
          ]),

      bottomNavigationBar: navi_bar(), //하단 네비게이션
    ));
  }
}

class navi_bar extends StatelessWidget {
  const navi_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.home, color: Colors.black, size: 30.0),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black, size: 30.0),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.mode_of_travel, color: Colors.black, size: 30.0),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Colors.black, size: 30.0),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
            icon: Icon(Icons.account_circle, color: Colors.black, size: 30.0),
          )
        ],
      ),
    ));
  }
}

class Food_Card extends StatelessWidget {
  const Food_Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomeBodyBanner extends StatelessWidget {
  const HomeBodyBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 1. 상단에 마진을 준다.
      padding: const EdgeInsets.only(top: gap_m),
      // 2. 이미지와 글자를 겹치게 하기 위해서 Stack 위젯을 사용한다.
      child: Stack(
        children: [
          _buildBannerImage(),
          _buildBannerCaption(),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/location.webp",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 320,
      ),
    );
  }

  Widget _buildBannerCaption() {
    return Positioned(
      top: 40,
      left: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: 250,
            ),
            child: Text(
              "이제, 여행은 가까운 곳에서",
              style: h4(mColor: Colors.white),
            ),
          ),
          const SizedBox(height: gap_m),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 250,
            ),
            child: Text(
              "새로운 공간에 머물러 보세요. 살아보기, 출장, 여행 등 다양한 목적에 맞는 숙소를 찾아보세요.",
              style: subtitle1(mColor: Colors.white),
            ),
          ),
          const SizedBox(height: gap_m),
          SizedBox(
            height: 35,
            width: 170,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Text(
                "가까운 여행지 둘러보기",
                style: subtitle2(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Route _createRoute() {
  // var _page;
  // if (a == 1) {
  //   _page = Page1();
  // } else if (a == 2) {
  //   _page = Page2();
  // } else if (a == 3) {
  //   _page = Page3();
  // } else if (a == 4) {
  //   _page = Page4();
  // }
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => my_page(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
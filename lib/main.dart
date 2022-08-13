import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:gap/gap.dart'; //뛰어쓰기
import 'package:untitled/5000_my_page.dart';
import 'package:untitled/2000_search_screen.dart';
import 'package:untitled/styles/3000_makes_plan.dart';
import 'package:untitled/styles/app_styles.dart';
import 'package:untitled/3200_Add_Region.dart';

import '4000_my_favorite.dart';
import 'http/app_http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //디버그 모드 지움
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
            Gap(10),
            Text("쩝쩝박사",
                style: TextStyle(fontFamily: "NotoSans",
                    fontSize: 23,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Styles.bgColor,
        elevation: 0,

      ), // 상단 바

      // drawer: _drawer(),
      body: ListView(shrinkWrap: true,
          children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(10),
              //유저 사진 + 위치 텍스트
              main_user_locate(),
              const Gap(10),

              //검색창
              // main_searchbar(),
              // const Gap(30),

              Row(
                children: [
                  main_planner(),
                  Expanded(child: Row()),
                  //자리 차지
                  daily_recommend_category(),
                ],
              ),
              HomeBodyBanner(),
              _http_card(),
              Store_Card(),
              Store_Card(),
              Store_Card(),
              Store_Card(),

            ],
          ),
        ),
      ]),

      bottomNavigationBar: navi_bar(), //하단 네비게이션
    ));
  }
}

//유저 사진 + 위치기반 표시
class main_user_locate extends StatelessWidget {
  const main_user_locate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // 1열
      children: [
        //유저 사진
        Container(
          margin: EdgeInsets.all(10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/img1.jpg")),
          ),
        ),

        //위치표시
        Expanded(
            child: Container(

              decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(5)),

              child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Icon(Icons.my_location_sharp),
              Gap(5),
              Text(
                "포항시 남구 지곡로 102",
                style: TextStyle(color:Colors.grey,fontSize: 15, fontWeight: FontWeight.w400),
              )
          ],
        ),
            )),
      ],
    );
  }
}


//진행 일정
class main_planner extends StatelessWidget {
  const main_planner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            spreadRadius: 2.0,
            blurRadius: 3.0)
      ], borderRadius: BorderRadius.circular(15), color: Color(0xffffffff)),
      // padding : const EdgeInsets.symmetric(horizontal: ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Icon(Icons.mode_of_travel,
                  color: Color(0xFF414141),
                  size: 30,
                  shadows: [
                    Shadow(
                        color: Colors.grey, blurRadius: 3, offset: Offset(1, 1))
                  ]),
              // box decoration [box]
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.white54, offset: Offset(1, 1))
                ],
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 2),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15), top: Radius.circular(15)),
              )),
          Gap(10),
          Text(
            "진행중인 일정이 없습니다.",
            style: TextStyle(
                fontFamily: "NotoSans",
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          Gap(10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => makes_plan(), fullscreenDialog: true),
              );            },
            child: Text(
              "일정 추가하기",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "NatoSans",
                  fontSize: 15),
            ),
            style: ElevatedButton.styleFrom(
              maximumSize: Size(120, 50),
              primary: Color(0xffee2d2d),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}

//매일 카테고리 추천
class daily_recommend_category extends StatelessWidget {
  const daily_recommend_category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      //box shadow
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            spreadRadius: 2.0,
            blurRadius: 3.0)
      ], borderRadius: BorderRadius.circular(15), color: Color(0xffffffff)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
                "https://post-phinf.pstatic.net/MjAxODExMjJfMTc3/MDAxNTQyODU0NDU0MDE5.Nfv1xUOnVIRkeF7DqtgfLknbhis5zjFWCyMd9YiKJkQg.suievJoqNbFSogXWPu_MIAIKUs2yHHmtmubiZaESBbQg.JPEG/China-Food-Reco-Travel-Hotels.com-4.jpg?type=w1200",
                width: 180,
                alignment: Alignment.topCenter),
          ),
          Gap(15),
          Container(
            child: Row(
              children: [
                Gap(10),
                Text(
                  "오늘은 푸짐한 ",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "중식 ",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "어떠세요?",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//네비 게이션 바
class navi_bar extends StatelessWidget {
  const navi_bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white70,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(_createRoute(0));
                },
                icon: Icon(Icons.home, color: Colors.black, size: 30.0),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(_createRoute(4));
                },
                icon: Icon(Icons.search, color: Colors.black, size: 30.0),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(_createRoute(3));
                },
                icon:
                    Icon(Icons.mode_of_travel, color: Colors.black, size: 30.0),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(_createRoute(2));
                },
                icon: Icon(Icons.favorite, color: Colors.black, size: 30.0),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).push(_createRoute(1));
                },
                icon:
                    Icon(Icons.account_circle, color: Colors.black, size: 30.0),
              )
            ],
          ),
        ));
  }
}

class _drawer extends StatelessWidget {
  const _drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                  borderRadius:BorderRadius.circular(50),
                  child: Image.asset('assets/img/img2.jpg',fit: BoxFit.cover,height: 80,width: 80,)),
            ),
            accountEmail: Text('sky32133@kakao.com',style: TextStyle(fontFamily: "NotoSnas",fontWeight: FontWeight.w500)),
            accountName: Text('Lee Dong-Jun',style: TextStyle(fontFamily: "NotoSnas",fontWeight: FontWeight.w600)),
            onDetailsPressed: () {
              print('Drawer press details');
            },
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/h_1cover.jpg"),
                  //커버 필터 opacity
                  colorFilter: ColorFilter.mode(Colors.white60.withOpacity(0.9), BlendMode.modulate,),
                  fit: BoxFit.cover
              ),
                // color: Color(0xffffd73c),
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(40),
                //   bottomRight: Radius.circular(40),
                // )
            ),
          ),

          // DrawerHeader(
          //   child: Text('뭘 적을까요?'),
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          // ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}




//홈 배너
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

//음식 점 카드
class Store_Card extends StatelessWidget {
  String _Store_name = "효자곱 영일대 직영점";
  String _Store_cateroty = "곱창";
  String _username = "junu0804";
  String _user_num = "1840";
  String _store_comment = "※한우곱창,대창구이,곱창전골※ 포항 맛집!";

  //유저 좋아요 이미지
  List<String> _images = [
    "http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg",
    "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMjA3MjlfNjMg%2FMDAxNjU5MDg4ODE4Nzkx.TIJso473Rf1tyLZIUVZPDpm0eIjVUXDml_ThEdAqfmIg.ISsf7w8hzfd7UdLdlbjnfM29BKHmoaTri-CYn4caHbwg.JPEG%2Fupload_7611f33ce2a5accf4d0dfea14ab4434e.jpg",
    "http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg",
    "https://post-phinf.pstatic.net/MjAxOTExMjZfMTE3/MDAxNTc0NzU4MDg3NDEw.CggSQDsdhfe1Ikuw1pcxdwFLGtkatpSpcXe3ao2v9L0g.qasezGYP6qHINA3il8QZWyue5k8DBumiDedcVwMqH7og.JPEG/EHJNBOiUwAUAeQX.jpg?type=w1200",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 1. 상단에 마진을 준다.
      padding: const EdgeInsets.only(top: gap_m),

      // 2. 이미지와 글자를 겹치게 하기 위해서 Stack 위젯을 사용한다.
      //stack(겹치기) - Positioned(stack안에 text 위치)
      child: Column(
        children: [_storeImage(), Gap(20)],
      ),
    );
  }

  Widget _storeImage() {
    return Container(
      height: 360,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(10), bottom: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(1, 1), blurRadius: 5.0)
          ],
          color: Colors.white),
      child: Column(
        children: [
          //이미지
          ClipRRect(
            //이미지 border도 해줘야함
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              "https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMjA3MjlfNjMg%2FMDAxNjU5MDg4ODE4Nzkx.TIJso473Rf1tyLZIUVZPDpm0eIjVUXDml_ThEdAqfmIg.ISsf7w8hzfd7UdLdlbjnfM29BKHmoaTri-CYn4caHbwg.JPEG%2Fupload_7611f33ce2a5accf4d0dfea14ab4434e.jpg",
              // fit: BoxFit.fill,
              // width: double.infinity,
              alignment: Alignment.topCenter,
              height: 250,
              width: 400,
              fit: BoxFit.fill,
            ),
          ),

          // 카드 Text 내용
          Container(
            padding: EdgeInsets.only(top: 10,left: 5,right: 5),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  //글씨 높이 맞춰줌
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,

                  children: [
                    Text(
                      '$_Store_name',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "NotoSans"),
                    ),
                    Spacer(flex: 1),
                    Text(
                      '$_Store_cateroty',
                      style: TextStyle(
                          fontFamily: "NotoSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    Spacer(flex: 10),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 20,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      // 패딩 설정
                      constraints: BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.comment,
                        size: 20,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      // 패딩 설정
                      constraints: BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.launch,
                        size: 20,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      // 패딩 설정
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
                Gap(3),
                Row(
                  children: [
                    FlutterImageStack(
                      imageList: _images,
                      showTotalCount: true,
                      totalCount: 0,
                      itemRadius: 30,
                      // Radius of each images
                      itemCount:
                          3, // Maximum number of images to be shown in stack
                    ),
                    //user name
                    Text("$_username",
                        style: TextStyle(
                            fontFamily: "NotoSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black)),
                    //total favorit
                    Text(
                      "님 외 ",
                      style: TextStyle(
                          fontFamily: "NotoSans",
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                    Text(
                      "$_user_num",
                      style: TextStyle(
                          fontFamily: "NotoSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    Text(
                      " 명이 수강중입니다.",
                      style: TextStyle(
                          fontFamily: "NotoSans",
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ],
                ),
                Gap(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //가게 comment
                    Text('$_store_comment',
                    style: TextStyle(
                      fontFamily: "NotoSans",fontWeight: FontWeight.w500,fontSize: 16),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//이동을 위한 라우터 설정
Route _createRoute(int port_num) {
  var _page;

  if (port_num == 0) {
    _page = MyApp();
  } else if (port_num == 1) {
    _page = my_page();
  } else if (port_num == 2) {
    _page = honny_tip();
  } else if (port_num == 3) {
    _page = makes_plan();
  } else if (port_num == 4) {
    _page = SearchScreen();
  } else if (port_num == 5){
    _page = app_http();

  }

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => _page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //팝업 애니메이션 효과

      // var begin = Offset(1.0, 0.0);
      // var end = Offset.zero;
      // var curve = Curves.ease;
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // return SlideTransition(
      //   position: animation.drive(tween),
      //   child: child,
      // );
      //아니면 그냥 리턴
      return child;
    },
  );
}


class _http_card extends StatelessWidget {
  const _http_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: (){ Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => app_http(), fullscreenDialog: true),
      );}, child: Text("http 연결")),
    );
  }
}

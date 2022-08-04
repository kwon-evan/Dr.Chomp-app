import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/styles/app_styles.dart';

// void main() {
//   runApp(const test1());
// }

class test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),

                    //컬러 Red, Blue로 변경하면 요즘느낌 가능
                    colors: <Color>[
                      Colors.redAccent,
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
                onPressed: () {},
                padding: EdgeInsets.zero,
              )
            ],
            iconTheme: IconThemeData(),
            // color black

            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("쩝쩝박사",
                    style: TextStyle(fontFamily: "NotoSans",
                        fontSize: 21,
                        color: Color(0xfff5e1e1),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            backgroundColor: Styles.bgColor,
            elevation: 0,

            bottom: TabBar(
              // padding: EdgeInsets.all(5),
              tabs: [
                Tab(
                    child: Text(
                  '방문지역',
                  style: body1(),
                )),
                Tab(
                    child: Text(
                  '맛집 선택',
                  style: h5(),
                )),
                Tab(
                    child: Text(
                  '친구 추가',
                  style: subtitle1(),
                )),
              ],
            ),
          ), // 상단 바

          body: TabBarView(
            children: [
              Container(
                  child: Column(children: [
                Text(
                  "나토산스 웨이트 w100",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "나토산스 웨이트 w600",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "나토산스 웨이트 w200",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "나토산스 웨이트 w300",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "나토산스 웨이트 w400",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "나토산스 웨이트 w500",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w500),
                ),
              ])),
              _tab1(),
              Center(
                child: Text("page3"),
              ),
            ],
          ),

          bottomNavigationBar: navi_bar(), //하단 네비게이션
        ));
  }
}

class _tab1 extends StatelessWidget {
  const _tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
            child: Image.asset(
          "assets/img1.jpg",
          width: 150,
        )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // 우측 정렬
                children: [
                  Icon(Icons.favorite),
                  Text('5'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

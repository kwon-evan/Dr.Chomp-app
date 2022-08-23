import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/main.dart';
import 'package:untitled/styles/app_styles.dart';

class add_Region extends StatefulWidget {
  String? calendar_Data;

  add_Region(this.calendar_Data, {Key? key}) : super(key : key);

  @override
  State<add_Region> createState() => _add_RegionState(calendar_Data!);
}

class _add_RegionState extends State<add_Region> {
  String? calendar_data;
  _add_RegionState(this.calendar_data);

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
                        color: Color(0xff000000),
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
                padding: EdgeInsets.only(top: 180),
                alignment: Alignment.center,
                  child: Column(children: [
                Text("여행 날짜 : " +
                  calendar_data!,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "방문지역 추가 예정",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w500),
                ),
              ])),
              _tab1(),
              Center(
                child: Text(
                  "친구추가 구현 예정",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "NotoSans",
                      fontWeight: FontWeight.w600),
                ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("맛있는대, 어디갈과? 쩝쩝박사", style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
        Gap(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                    child: Image.asset(
                  "assets/img1.jpg",
                  fit: BoxFit.fill,
                      width: 120,
                      height: 160,

                    )),
                Text("App 개발 담당 : 이동준", style: TextStyle(fontSize: 12),)
              ],
            ),
            Gap(10),

            Column(
              children: [
                Center(
                    child: Image.asset(
                      "assets/img/img10.jpg",
                      fit: BoxFit.fill,
                      width: 120,
                      height: 160,

                    )),
                Text("Algorithm 담당 : 황호민", style: TextStyle(fontSize: 12),)

              ],
            ),
            Gap(10),
            Column(
              children: [
                Center(
                    child: Image.asset(
                      "assets/img/img11.jpg",
                      fit: BoxFit.fill,
                      width: 120,
                      height: 160,
                    )),
                Text("Data Scraping 담당 : 주민우", style: TextStyle(fontSize: 12),)
              ],
            )

          ],
        ),
        Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                    child: Image.asset(
                      "assets/img/img12.jpg",
                      fit: BoxFit.fill,
                      width: 120,
                      height: 160,

                    )),
                Text("Algorithm 담당 : 권헌진", style: TextStyle(fontSize: 12),)
              ],
            ),
            Gap(10),

            Column(
              children: [
                Center(
                    child: Image.asset(
                      "assets/img/img13.png",
                      fit: BoxFit.fill,
                      width: 120,
                      height: 160,

                    )),
                Text("Server 담당 : 김재희", style: TextStyle(fontSize: 12),)
              ],
            ),
            Gap(10),
            Column(
              children: [
                Center(
                    child: Image.asset(
                      "assets/img/img14.jpg",
                      fit: BoxFit.fill,
                      width: 120,
                      height: 160,
                    )),
                Text("Database 담당 : 박준우", style: TextStyle(fontSize: 12),)
              ],
            )

          ],
        ),
      ],
    );
  }
}

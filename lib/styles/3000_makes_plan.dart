import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled/styles/app_styles.dart';

import '../3200_Add_Region.dart';
import '../3100_make_plan_calendar.dart';
import '../main.dart';

class makes_plan extends StatefulWidget {
  const makes_plan({Key? key}) : super(key: key);

  @override
  State<makes_plan> createState() => _makes_planState();
}

class _makes_planState extends State<makes_plan> {
   static TextStyle basic_ts = TextStyle(fontSize: 20,fontFamily: "NotoSans", fontWeight: FontWeight.w500);
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
        iconTheme: IconThemeData(),

        title: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("일정 만들기",
                style: TextStyle(fontFamily: "NotoSans",
                    fontSize: 23,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Styles.bgColor,
        elevation: 0,

      ), // 상
      body: ListView(shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50),
                Text("일정 코스 추가하기",style: basic_ts),
                Stack(
                  children : [ Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey,
                    child:
                    Container(
                      alignment: Alignment(0.0,0.0),

                      child: ElevatedButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  dacal(), fullscreenDialog: true),
                        );
                      },

                        child: Text("지금 추가하세요"),
                      ),

                    ),
                  ),

                ],),

                Gap(100),
                Text("일정 코스 추가하기", style: basic_ts),
                Stack(
                  children: [
                    Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                    Text("예정된 계획이 없습니다.",style: basic_ts)
          ],
          ),
                
              ],
            ),
          ),  
      ],
      ),
      bottomNavigationBar: navi_bar(), //하단 네비게이션
          );
  }
}

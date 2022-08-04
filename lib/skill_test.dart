import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/skill_test.dart';

import 'styles/app_styles.dart';

String _prc_text = "이동준 flutter 연습중";

class honny_tip extends StatelessWidget {
  const honny_tip({Key? key}) : super(key: key);

  final bool showItem = true;

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



        // //스낵바
        // actions: [
        //   IconButton(onPressed: (){
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text("이게 스낵바"))
        //     );
        //   }, icon: Icon(Icons.add_alert))
        // ],
        //
        // // 팝업 메뉴 버튼
        //   PopupMenuButton(itemBuilder: (context) => [
        //     PopupMenuItem(child: IconButton(onPressed: (){
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text("Scaffold => context => show snackbar")));
        //     }, icon: const Icon(Icons.add_alert),color: Colors.cyan,))        ]),
        //
        //   IconButton(onPressed: (){
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text("Scaffold => context => show snackbar")));
        //   }, icon: Icon(Icons.add_alert)),
        // ],
        // actions: [

      ),
      body: ListView(
        children: [


          //Stack
          // Stack(
          //     fit : StackFit.expand,
          //     children : [
          //       //커버 이미지
          //       Image.asset(
          //         "assets/location.webp",
          //         fit : BoxFit.cover,),
          //       //blur 및 font 추가
          //       Center(
          //         child: ClipRRect(
          //           child: BackdropFilter(
          //             filter: ImageFilter.blur(
          //               sigmaX: 5,
          //               sigmaY: 5,
          //             ),
          //             child: Container(
          //               alignment: Alignment.center,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(16),
          //                   shape: BoxShape.rectangle,
          //                   color: Colors.white24),
          //               width: 200,
          //               height: 100,
          //               child: const Text("this is beautiful"),
          //             ),
          //           ),
          //         ),
          //       )
          //     ]
          //
          // ),
          Image.network(
            'https://picsum.photos/id/421/300/300',
          ),
          //list_sepead
          Container(
            child: Center(
              //column or row
              child: Column(
                children: [
                  //컨테이너 효과
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),),
                  //list_spead (...)은 list안에 list를 넣을 수 있음
                  if (showItem) ...[
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),),
                  ],
                  Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),),

                ],

              ),
            ),

          ),

          //이미지 fittedbox
          Container(
            height: 400,
            width: 300,
            color: Colors.redAccent,
            child : FittedBox(
              // cover, fill
              fit : BoxFit.cover,
              //비율을 초과하지 않음
              clipBehavior: Clip.hardEdge,
              child: Image.asset("assets/food1.jpg"),
            )

          ),

          //text 그림자
          Center(
            child: Text(_prc_text,
            style: TextStyle(
              fontSize: 35,
              color: Color(0Xff000000),
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(color: Colors.black38, offset: Offset(2, 2),blurRadius: 6)
              ]
            ),),
          ),

          //text overFlow
          Center(
            child: Text(
              "이동준 flutter 연습중? 이동준 flutter 연습중? 이동준 flutter 연습중? 이동준 flutter 연습중? 이동준 flutter 연습중? ",
              //fade = 마지막줄 fade, ellipsis = 한줄 끝나고 ...
              overflow: TextOverflow.ellipsis,
              //라인 몇줄로 할지 정하기 [Review글 쓸때 사용]
              maxLines: 1,
              //text Scale 조절 0~
              textScaleFactor: 3,
            ),
          ),

          //사람 카드 Wrap으로 감싸기
          Wrap(
            children: [
              Chip(
                avatar: CircleAvatar(
                  // backgroundColor: Colors.blue.shade900,
                  radius: 60,
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(50),
                      child: Image.network("https://www.greenpeace.org/static/planet4-korea-stateless/2019/07/dd857c05-dd857c05-137665_246426.jpg",height: 60,width: 60, fit: BoxFit.cover,),
                    )
                ),
                label: Text("박준우"),
              ),
              Chip(
                avatar: CircleAvatar(
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(50),
                      child: Image.asset("assets/img1.jpg",height: 60,width: 60, fit: BoxFit.cover,),
                    )
                ),
                label: Text("이동준"),
              ),
              Chip(
                avatar: CircleAvatar(
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(50),
                      child: Image.asset("assets/panda_hun.png",height: 60,width: 60, fit: BoxFit.cover,),
                    )
                ),
                label: Text("권헌진"),
              ),
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Text("Ah"),
                ),
                label: Text("hanmilton"),
              ),
              Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Text("Ah"),
                ),
                label: Text("hanmilton"),
              )
            ],
          ),

          //SafeArea 이거만 있으면 범위 안넘어감
          SafeArea(child: Text("이거만 있으면 공간 안넘어감")),

        ],
      ),

      bottomNavigationBar: navi_bar(),
    );
  }
}

//on tap 기능 statefulWidget이여만 가능

class AnimatedCrossFadeEx extends StatefulWidget{
  const AnimatedCrossFadeEx({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeEx> createState() => _AnimatedCrossFadeExState();
}

class _AnimatedCrossFadeExState extends State<AnimatedCrossFadeEx>{
  bool _first = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          setState((){
            _first =!_first;
          });
        },
        child: Center(
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 1),
            firstChild: Image.asset("assets/food1.jpg"),
            secondChild: Image.asset("assets/food2.jpg"),
            crossFadeState:
            _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}




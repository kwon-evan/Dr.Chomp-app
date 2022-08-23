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
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),

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
      
      body: Container(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
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
                    colorFilter: ColorFilter.mode(Colors.grey.withOpacity(1), BlendMode.modulate,),
                    fit: BoxFit.cover
                ),
                // color: Color(0xffffd73c),
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(40),
                //   bottomRight: Radius.circular(40),
                // )
              ),
            ),
            Gap(30),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card("리뷰 관리"),
                card("방문 내역"),

              ],
            ),
            Gap(20),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                card("포인트"),
                card("쿠폰함"),

              ],
            ),

            Gap(20),
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 350,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 1),
                    spreadRadius: 2.0,
                    blurRadius: 3.0)
              ], borderRadius: BorderRadius.circular(15), color: Color(0xffffffff)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("친구 관리함",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

                ],
              ),
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
    return Container(
      child: Row(

        children: [
          ClipRRect(

      borderRadius:BorderRadius.circular(50),
            child: Image.asset(
              "assets/img1.jpg",
              fit: BoxFit.cover,
              height: 80,width: 80,
            ),
          ),

        ],
      ),
    );
  }
}

class card extends StatelessWidget {
  String? s;
  card(this.s, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            spreadRadius: 1.0,
            blurRadius: 3.0)
      ], borderRadius: BorderRadius.circular(15), color: Color(0xffffffff)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(s!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          
              ],
            ),
          );
  }
}

import 'package:flutter/material.dart';

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
              IconButton(icon : Icon(Icons.message),onPressed: (){},padding: EdgeInsets.zero,),
              IconButton(icon : Icon(Icons.notifications),onPressed: (){},padding: EdgeInsets.zero,)],
            iconTheme: IconThemeData(), // color black
            leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},padding: EdgeInsets.zero),
            title: Text("쩝접박사", style: TextStyle(fontSize: 20,color: Color(0xff000000))),
            backgroundColor: Color(0xffffffff),
            elevation: 6, // 그림자 효과
          ), // 상단 바

          body: Container(
            height: 150,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset("assets/img1.jpg", width: 150,),
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
            ),

          ),

          bottomNavigationBar: BottomAppBar(
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      icon : Icon(Icons.home,
                          color: Colors.black,
                          size: 40.0),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      icon : Icon(Icons.search,
                          color: Colors.black,
                          size: 40.0),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      icon : Icon(Icons.mode_of_travel,
                          color: Colors.black,
                          size: 40.0),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      icon : Icon(Icons.favorite,
                          color: Colors.black,
                          size: 40.0),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      icon : Icon(Icons.account_circle,
                          color: Colors.black,
                          size: 40.0),
                    )
                  ],
                ),
              )), //하단 네비게이션
        ));
  }
}



class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

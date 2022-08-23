import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'http/8000_store_info_app_http.dart';
import 'styles/app_styles.dart';
import 'dart:convert';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/styles/app_styles.dart';

import '../0000_received_text.dart';


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
            Text("나의 맛집",
                style: TextStyle(fontFamily: "NotoSans",
                    fontSize: 23,
                    color: Color(0xff000000),
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
        shrinkWrap: true,
        children: [

          favorite_app_http(),

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





class favorite_app_http extends StatefulWidget {
  const favorite_app_http({Key? key}) : super(key: key);

  @override
  _app_http createState() => _app_http();
}

class _app_http extends State<favorite_app_http> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  // String _Store_name = "효자곱 영일대 직영점";
  // String _Store_cateroty = "곱창";
  String _username = "junu0804";
  String _user_num = "50만";
  String _store_comment = "※쩝쩝박사가 추천하는 맛집 !※";
  bool clicked = false;

  //유저 좋아요 이미지
  List<String> _images = [
    "http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg",
    "https://post-phinf.pstatic.net/MjAxOTExMjZfMTE3/MDAxNTc0NzU4MDg3NDEw.CggSQDsdhfe1Ikuw1pcxdwFLGtkatpSpcXe3ao2v9L0g.qasezGYP6qHINA3il8QZWyue5k8DBumiDedcVwMqH7og.JPEG/EHJNBOiUwAUAeQX.jpg?type=w1200",
    "https://img1.daumcdn.net/thumb/R300x0/?fname=https://k.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Column(
        children: [
          Container(
            child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                shrinkWrap: true, physics: ScrollPhysics(),
                // itemCount: posts?.length,  //950개 뽑으려니가 렉 오지게걸림
                itemCount: 30,
                itemBuilder: (context, index) {
                  // String result = posts![index].img_url.replaceAll("[", "").replaceAll("]", "").replaceAll('"', "");
                  final splitted = posts![index].img_url.split("'");
                  // print(splitted);
                  final menu_splitted = posts![index].signature.split("'");

                  return Column(
                    children: [
                      Container(
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
                            ClipRRect(
                              //이미지 border도 해줘야함
                              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                              child: Image.network(
                                splitted[1].toString(),
                                // fit: BoxFit.fill,
                                // width: double.infinity,
                                alignment: Alignment.topCenter,
                                height: 250,
                                width: 400,
                                fit: BoxFit.fill,
                              ),
                            ),

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
                                        posts![index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "NotoSans"),
                                      ),
                                      Spacer(flex: 1),
                                      Text(
                                        posts![index].category,
                                        style: TextStyle(
                                            fontFamily: "NotoSans",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: Colors.grey),
                                      ),
                                      Spacer(flex: 10),
                                      IconButton(
                                        onPressed: () {
                                          setState((){clicked = !clicked;});
                                        },
                                        icon: Icon(Icons.favorite_border), color: clicked ? Colors.red : Colors.black,  padding: EdgeInsets.symmetric(horizontal: 5),constraints: BoxConstraints(),
                                        // padding: EdgeInsets.symmetric(horizontal: 5),
                                        // // 패딩 설정
                                        // constraints: BoxConstraints(),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          print(index);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => http_Store_detail(
                                                    posts![index].id, posts![index].name, posts![index].day_off,
                                                    posts![index].category, posts![index].phone, posts![index].address,
                                                    posts![index].atmosphere, posts![index].break_time, posts![index].last_order,
                                                    posts![index].like, posts![index].opening_hours, posts![index].parking,
                                                    posts![index].price, posts![index].service, posts![index].signature,posts![index].taste, splitted,menu_splitted),
                                                fullscreenDialog: true),
                                          );},
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
                                              fontSize: 17,
                                              color: Colors.black)),
                                      //total favorit
                                      Text(
                                        "님 외 ",
                                        style: TextStyle(
                                            fontFamily: "NotoSans",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "$_user_num",
                                        style: TextStyle(
                                            fontFamily: "NotoSans",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        " 명이 수강중입니다.",
                                        style: TextStyle(
                                            fontFamily: "NotoSans",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
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
                      ),
                      Gap(20)
                    ],
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('http://141.223.122.72:8000/stores');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.category,
    required this.signature,
    required this.parking,
    required this.taste,
    required this.service,
    required this.atmosphere,
    required this.price,
    // required this.star_rating,
    required this.img_url,
    required this.like,
    required this.opening_hours,
    required this.break_time,
    required this.last_order,
    required this.day_off,

  });


  final int id;
  final String name;
  final String address;
  final String phone;
  final String category;
  final String signature;
  final String parking;
  final double taste;
  final double service;
  final double atmosphere;
  final double price;
  // final double star_rating;
  final String img_url;
  final String like;
  final String opening_hours;
  final String break_time;
  final String last_order;
  final String day_off;


  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id : json["id"],
      name : json["name"],
      address : json["address"],
      phone : json["phone"],
      category : json["category"],
      signature : json["signature"],
      parking : json["parking"],
      taste : json["taste"],
      service : json["service"],
      atmosphere : json["atmosphere"],
      price : json["price"],
      // star_rating : json["star_rating"],
      img_url : json["img_url"],
      like : json["like"],
      opening_hours : json["opening_hours"],
      break_time : json["break_time"],
      last_order : json["last_order"],
      day_off : json["day_off"]

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "category":category,
    "signature": signature,
    "parking": parking,
    "taste": taste,
    "service": service,
    "atmosphere": atmosphere,
    "price": price,
    // "star_rating": star_rating,
    "img_url": img_url,
    "like": like,
    "opening_hours": opening_hours,
    "break_time":break_time,
    "last_order": last_order,
    "day_off": day_off
  };
}
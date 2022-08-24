import 'dart:convert';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/styles/app_styles.dart';

import '../0000_received_text.dart';
import '8100_store_review_app_http_post.dart';
import '8000_store_reviews.dart';


class app_http extends StatefulWidget {
  const app_http({Key? key}) : super(key: key);

  @override
  _app_http createState() => _app_http();
}

class _app_http extends State<app_http> {
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
                                          print(posts![index].id);
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

    var uri = Uri.parse('http://141.223.122.72:8000/stores/recommend/2');
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


//상세 페이지
class http_Store_detail extends StatefulWidget {
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
  final String like;
  final String opening_hours;
  final String break_time;
  final String last_order;
  final String day_off;
  List<String> splitted;
  List<String> menu_splitted;

  http_Store_detail(
      this.id, this.name, this.day_off, this.category, this.phone, this.address,
      this.atmosphere, this.break_time, this.last_order, this.like,
      this.opening_hours, this.parking, this.price, this.service,
      this.signature, this.taste, this.splitted, this.menu_splitted,
      {Key? key,}) : super(key: key);

  @override
  State<http_Store_detail> createState() => _http_Store_detailState();
}

class _http_Store_detailState extends State<http_Store_detail> {


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title : Text("가게 상세정보")
      ),
      body: ListView(shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.white54, offset: Offset(1, 1))
                ]),
              height: 250,
              width: double.infinity,
                child: ListView(
                  // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,

                  //오버스크롤을 막아줌
                  physics: BouncingScrollPhysics(),
                  children: [ClipRRect(
                    //이미지 border도 해줘야함
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom:Radius.circular(10) ),
                    child: Image.network(
                      widget.splitted[1].toString(),
                      // fit: BoxFit.fill,
                      // width: double.infinity,
                      alignment: Alignment.topCenter,
                      width: 333,
                      fit: BoxFit.fill,
                    ),
                  ),
                    ClipRRect(
                      //이미지 border도 해줘야함
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom:Radius.circular(10)),
                      child: Image.network(
                        widget.splitted[3].toString(),
                        // fit: BoxFit.fill,
                        // width: double.infinity,
                        alignment: Alignment.topCenter,
                        width: 400,
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      //이미지 border도 해줘야함
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom:Radius.circular(10)),
                      child: Image.network(
                        widget.splitted[5].toString(),
                        // fit: BoxFit.fill,
                        // width: double.infinity,
                        alignment: Alignment.topCenter,
                        width: 400,
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      //이미지 border도 해줘야함
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom:Radius.circular(10)),
                      child: Image.network(
                        widget.splitted[7].toString(),
                        // fit: BoxFit.fill,
                        // width: double.infinity,
                        alignment: Alignment.topCenter,
                        width: 400,
                        fit: BoxFit.fill,
                      ),
                    ),],
                )

            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,

                  children: [
                    Text(widget.name.toString(),
                        style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontFamily: "NotoSans")),
                    Gap(gap_m),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("가게 번호",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.id.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("음식 종류",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.category.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          // alignment: Alignment.topLeft,
                          child: Text("주소",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Expanded(
                          child: Text(widget.address.toString(),
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSans")),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("전화번호",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.phone.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("주차 유무",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.parking.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("영업 시간",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.opening_hours.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("Break time",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.break_time.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("마지막 주문",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.last_order.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          width: 100,

                          child: Text("휴일",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.day_off.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          width: 100,
                          child: Text("먹켓 리스트",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Text(widget.like.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSans")),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(top: 3),

                          child: Text("메뉴 ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "NotoSans")),
                        ),
                        Expanded(
                          child: Text(
                              widget.menu_splitted.length > 19 ?
                              widget.menu_splitted[1] + " : " + widget.menu_splitted[3] + "\n" +
                              widget.menu_splitted[5] + " : " + widget.menu_splitted[7] + "\n"+
                              widget.menu_splitted[9] + " : " + widget.menu_splitted[11] + "\n"+
                              widget.menu_splitted[13] + " : " + widget.menu_splitted[15] + "\n" +
                              widget.menu_splitted[17] + " : " + widget.menu_splitted[19] + "\n"
                              : widget.signature
                              ,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NotoSans")),
                        ),
                      ],
                    ),
                    Container(alignment:Alignment.topCenter,child: Text("NLP를 통한 분석",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)),
                    nutrient_bar(widget.price, widget.atmosphere, widget.service, widget.taste),
                    //text 막음
                    // Text("가격 대 : " + widget.price.toString(),
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400,
                    //         fontFamily: "NotoSans")),
                    // Text("가게 분위기 : " + widget.atmosphere.toString(),
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400,
                    //         fontFamily: "NotoSans")),
                    // Text("서비스 : " + widget.service.toString(),
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400,
                    //         fontFamily: "NotoSans")),
                    // Text("맛 : " + widget.taste.toString(),
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400,
                    //         fontFamily: "NotoSans")),
                  ]

          ),
            ),
            Gap(30),


            Container(alignment: Alignment.topCenter,
                child: Text("리뷰 모아보기", style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),)),

            Container(
              height: 2,
              decoration: BoxDecoration(color: Colors.grey),
            ),

            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => http_post(widget.id),
                      fullscreenDialog: true),
                );
              }, child: Text("리뷰 쓰기")),
            ),
            Store_review_get(widget.id),

      ]),
    );
  }
}

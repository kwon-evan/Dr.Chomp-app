import 'dart:convert';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'dart:async';
import '0000_received_text.dart';

Future<Post> fetchPost() async {
  var client = http.Client();

  var uri = Uri.parse('http://141.223.122.72:8000/user/2');
  var response = await client.get(uri);

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int id;
  final String email;
  final String birth;
  final int age;
  final String sex;
  final String mucket;
  final String friend;
  final double taste;
  final double service;
  final double atmosphere;
  final double price;

  Post({
  required this.id,
  required this.email,
  required this.birth,
  required this.age,
  required this.sex,
  required this.mucket,
  required this.friend,
  required this.taste,
  required this.service,
  required this.atmosphere,
  required this.price,


  });

  factory Post.fromJson(Map<dynamic, dynamic> json) {
    return Post(
    id : json["id"],
    email : json["email"],
    birth : json["birth"],
    age : json["age"],
    sex : json["sex"],
    mucket : json["mucket"],
    friend : json["friend"],
    taste : json["taste"],
    service : json["service"],
    atmosphere : json["atmosphere"],
    price : json["price"],

  );
  }
}


class user_rating extends StatefulWidget {
  user_rating({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<user_rating> {
  late Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('이동준님의 맛집 성향은?'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(alignment:Alignment.topCenter,child: Text("NLP를 이동준님의 맛집 분석",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)),
                    nutrient_bar(snapshot.data!.price, snapshot.data!.atmosphere, snapshot.data!.service, snapshot.data!.taste),
                    Gap(250),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // 기본적으로 로딩 Spinner를 보여줍니다.
              return CircularProgressIndicator();
            },
          ),
        ),
      );
  }
}

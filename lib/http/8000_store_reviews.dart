import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../styles/app_styles.dart';



class Store_review_get extends StatefulWidget {
  final int id;

  Store_review_get(this.id, {Key? key}) : super(key: key);

  @override
  State<Store_review_get> createState() => _StoreState();
}

class _StoreState extends State<Store_review_get> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts(widget.id);
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: gap_m),
      child: Container(
        child: Visibility(
            visible: isLoaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                String review_content = jsonEncode(posts![index].content);
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300],
                          image : DecorationImage(
                              image : NetworkImage("https://img1.daumcdn.net/thumb/R300x0/?fname=https://k.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg"),
                              fit: BoxFit.cover
                          )
                        ),
                        ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("user : " +
                              posts![index].id.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Text(
                            //   posts![index].store_id.toString(),
                            //   maxLines: 3,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                            Gap(5),
                            Text(
                              // style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                              review_content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(3),
                            Text("작성일 : " +
                              posts![index].create_date.toString(),
                              style: TextStyle(color: Colors.grey),
                            ),


                            // Text("맛 : "  + posts![index].taste.toString(),
                            //   maxLines: 3,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                            // Text("서비스 : " + posts![index].service.toString(),
                            //   maxLines: 3,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                            // Text("가성비 : " + posts![index].price.toString(),
                            //   maxLines: 3,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                            // Text("분위기 : " + posts![index].atmosphere.toString(),
                            //   maxLines: 3,
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                            // TextButton(onPressed: (){
                            //   print("check");
                            //   print(index);
                            //   // posts![index].id
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Store(posts![index].id),
                            //         fullscreenDialog: true),
                            //   );
                            // }, child: Text('버튼'))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}

class RemoteService {


  Future<List<Post>?> getPosts(int id) async {


    String url= 'http://141.223.122.72:8000/store/'+ id.toString() +'/reviews';
    print(url);

    var client = http.Client();

    var uri = Uri.parse(url);
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
    required this.user_id,
    required this.store_id,
    required this.create_date,
    required this.content,
    required this.taste,
    required this.service,
    required this.atmosphere,
    required this.price,


  });


  final int id;
  final int user_id;
  final int store_id;
  final String create_date;
  final String content;
  final double taste;
  final double service;
  final double atmosphere;
  final double price;



  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id : json["id"],
    user_id : json["user_id"],
    store_id : json["store_id"],
    create_date : json["create_date"],
    content : json["content"],

    taste : json["taste"],
    service : json["service"],
    atmosphere : json["atmosphere"],
    price : json["price"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": user_id,
    "store_id": store_id,
    "create_date": create_date,
    "content":content,

    "taste": taste,
    "service": service,
    "atmosphere": atmosphere,
    "price": price,

  };
}





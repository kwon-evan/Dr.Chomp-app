import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class Store_info extends StatefulWidget {
  int id;
  Store_info(this.id, {Key? key}) : super(key: key);

  @override
  State<Store_info> createState() => _StoreState(id);
}

class _StoreState extends State<Store_info> {
  _StoreState(int id);
  List<store_post>? posts;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            String img_cv = jsonEncode(posts![index].img_url);
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          posts![index].category,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          // style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                          img_cv,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
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
        ),
      ),
    );
  }
}

class RemoteService {

  Future<List<store_post>?> getPosts(int id) async {

    String url= 'http://141.223.122.72:8000/store/' + id.toString();
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



List<store_post> postFromJson(String str) => List<store_post>.from(json.decode(str).map((x) => store_post.fromJson(x)));

String postToJson(List<store_post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class store_post {
  store_post({
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
    required this.star_rating,
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
  final double star_rating;
  final String img_url;
  final String like;
  final String opening_hours;
  final String break_time;
  final String last_order;
  final String day_off;


  factory store_post.fromJson(Map<String, dynamic> json) => store_post(
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
      star_rating : json["star_rating"],
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
    "star_rating": star_rating,
    "img_url": img_url,
    "like": like,
    "opening_hours": opening_hours,
    "break_time":break_time,
    "last_order": last_order,
    "day_off": day_off
  };
}





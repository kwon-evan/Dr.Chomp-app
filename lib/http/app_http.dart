import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


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
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
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
                          posts![index].phone,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
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
    required this.taste,
    required this.feeling,
    required this.service,
    required this.waiting,
    required this.price,
    required this.name,
    required this.phone,
    required this.category,
    required this.schedule,
    required this.signiture,
    required this.address,
  });

  final double taste;
  final double feeling;
  final double service;
  final double waiting;
  final double price;
  final String name;
  final String address;
  final String phone;
  final String category;
  final String schedule;
  final String signiture;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name : json["name"],
    address : json["address"],
    phone : json["phone"],
    category : json["category"],
    schedule : json["schedule"],
    signiture : json["signiture"],
    taste : json["taste"],
    feeling : json["feeling"],
    service : json["service"],
    waiting : json["waiting"],
    price : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "phone": phone,
    "category": category,
    "schedule":schedule,
    "signiture": signiture,
    "taste": taste,
    "feeling": feeling,
    "service": service,
    "waiting": waiting,
    "price": price
  };
}

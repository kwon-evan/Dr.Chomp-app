import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<Album> createAlbum(String content, int id) async {
  int user_id = 2;
  DateTime now = DateTime.now();
  int currentMilliSeconds = now.millisecondsSinceEpoch;
  DateTime date = DateTime.fromMillisecondsSinceEpoch(currentMilliSeconds);
  String? create_date = date.toString();

  final response = await http.post(
    Uri.parse('http://141.223.122.72:8000/store/'+ id.toString() +'/reviews'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<dynamic, dynamic>{
      'content': content,
      'store_id' : id,
      'user_id' : user_id,
      'create_date' : create_date
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int store_id;
  final int user_id;
  final String create_date;
  final String content;

  const Album({required this.store_id, required this.content, required this.user_id,required this.create_date});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      user_id : json['user_id'],
      store_id: json['store_id'],
      create_date : json['create_date'],
      content: json['content'],
    );
  }
}

class http_post extends StatefulWidget {
  final int id;

  http_post(this.id, {Key? key,}) : super(key: key);

  @override
  State<http_post> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<http_post> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('리뷰를 작성해 주세요'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      );

  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: '리뷰 작성란'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {

              _futureAlbum = createAlbum(_controller.text, widget.id);
            });
          },
          child: const Text('리뷰 보내고 / 확인하기'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.content);
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:untitled/styles/app_styles.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //검색기능 체크
  final TextEditingController _filter = TextEditingController();

  //현재 검색 위젯 커서가 있는지 체크
  FocusNode focusNode = FocusNode();

  //검색단어 저장
  String _searchText = "";

  //검색어 변화에 맞춰 상태 변화화
  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

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
        iconTheme: IconThemeData(),

        title: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("쩝쩝박사",
                style: TextStyle(fontFamily: "NotoSans",
                    fontSize: 23,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Styles.bgColor,
        elevation: 0,

      ), // 상
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                    //검색창 배경
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Row(children: [
                      Expanded(
                          //비율
                          flex: 6,
                          child: TextField(
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              prefixIcon: Icon(Icons.search, color: Color(0xFFBFC205),size: 20),
                              hintText: "오늘은 무엇을 먹을까요?",
                              hintStyle: Styles.headLineStyle4,
                              suffixIcon: focusNode.hasFocus ? IconButton(
                                  icon: Icon(Icons.cancel,size:20),
                                  onPressed: (){
                                    setState((){
                                      _filter.clear();
                                      _searchText = "";
                                });
                              }, )
                                  :Container(),
                              labelStyle:  TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              )

                            ),
                            autofocus: true,
                            controller: _filter,
                      )),
                      focusNode.hasFocus ?
                      Expanded(child: TextButton(
                          child : Text("취소"),
                          onPressed: (){
                            setState((){
                              _filter.clear();
                              _searchText = "";
                              focusNode.unfocus();
                            });
                      })
                      ) : Expanded(flex: 0,child: Container(),)


                    ],),
                  ),
          ],
        ),
      ),
    );

  }
}

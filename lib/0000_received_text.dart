import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';

class received extends StatelessWidget {
  String rt ='';
  received(this.rt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" 정보 받기"),
      ),
      body: Container(
        child: Text(rt),
      ),
    );
  }
}


//막대 바
//reference : https://pub.dev/packages/vertical_barchart
//  "" : https://dkswnkk.tistory.com/329
class nutrient_bar extends StatefulWidget {
  double? price;
  double? atmosphere;
  double? service;
  double? taste;

  nutrient_bar(this.taste, this.service, this.atmosphere, this.price, {Key? key}) : super(key: key);

  @override
  State<nutrient_bar> createState() => _nutrient_barState();
}

class _nutrient_barState extends State<nutrient_bar> {
  @override
  Widget build(BuildContext context) {
    List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: "가격대",
        colors: [Colors.amberAccent, Colors.amber],
        jumlah: widget.price!.toDouble(),
        //자릿수 고정
        tooltip: widget.price!.toStringAsFixed(3),
        description: Text(
          "가격대가 싼지, 비싼지 판단합니다.",
          style: TextStyle(fontSize: 10),
        ),
      ),
      VBarChartModel(
        index: 1,
        label: "분위기",
        colors: [Colors.redAccent, Colors.red],
        jumlah: widget.atmosphere!.toDouble(),
        //자릿수 고정
        tooltip: widget.atmosphere!.toStringAsFixed(3),
        description: Text(
          "분위기가 좋은지 나쁜지 판단합니다.",
          style: TextStyle(fontSize: 10),
        ),
      ),
      VBarChartModel(
        index: 2,
        label: "서비스",
        colors: [Colors.lightBlueAccent, Colors.lightBlue],
        jumlah: widget.service!.toDouble(),
        //자릿수 고정
        tooltip: widget.service!.toStringAsFixed(3),
        description: Text(
          "서비스의 양질 유무를 판단합니다",
          style: TextStyle(fontSize: 10),
        ),
      ),
      VBarChartModel(
        index: 3,
        label: "맛",
        colors: [Colors.greenAccent, Colors.green],
        jumlah: widget.taste!.toDouble(),
        //자릿수 고정
        tooltip: widget.taste!.toStringAsFixed(3),
        description: Text(
          "맛의 좋고, 나쁘고 여부를 판단합니다.",
          style: TextStyle(fontSize: 10),
        ),
      ),
    ];

    return Container(
      child: _buildGrafik(bardata),

    );
  }
  Widget _buildGrafik(List<VBarChartModel> bardata) {
    return     VerticalBarchart(
      labelColor: Colors.black,
      tooltipSize: 33,
      barSize: 20,
      backdropColor: Colors.white,
      maxX: 1,
      data: bardata,
      showLegend: true,
      legend: [
        Vlegend(
          isSquare: false,
          color: Colors.amberAccent,
          text: "가격대 클릭",
        ),
        Vlegend(
          isSquare: false,
          color: Colors.redAccent,
          text: "분위기 클릭",
        ),
        Vlegend(
          isSquare: false,
          color: Colors.lightBlueAccent,
          text: "서비스 클릭",
        ),
        Vlegend(
          isSquare: false,
          color: Colors.greenAccent,
          text: "맛 클릭",
        ),
      ],
    );
  }
}

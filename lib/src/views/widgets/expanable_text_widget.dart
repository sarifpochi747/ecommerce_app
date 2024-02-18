
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ExpanableTextWidget extends StatefulWidget {


  final String text;
  const ExpanableTextWidget({super.key, required this.text});

  @override
  State<ExpanableTextWidget> createState() => _ExpanableTextWidgetState();
}

class _ExpanableTextWidgetState extends State<ExpanableTextWidget> {

  late String firstHalf;
  late String secondHalf;
  int textLenghtHeigth = 200;
  bool hiddenText = true;

  String showMore = "Show more";
  String unshow = "Show less";
  @override
  void initState() {
    super.initState();
    if(widget.text.length > textLenghtHeigth){
      firstHalf = widget.text.substring(0,textLenghtHeigth);
      secondHalf= widget.text.substring(textLenghtHeigth+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";

    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?Text(firstHalf,style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal)
          ):Column(
            children: <Widget>[
              smallText(hiddenText?("$firstHalf..."):(firstHalf+secondHalf)),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Text(hiddenText?(showMore):(unshow),style: TextStyle(color:Colors.green),),
                    Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up_outlined,color: Colors.green,)
                  ],
                ),
              )
            ],
          )
    );
  }


  Widget smallText(String text){
    return Text(text,style: TextStyle(
      fontSize: 15,color: Colors.grey
    ),);
  }
}

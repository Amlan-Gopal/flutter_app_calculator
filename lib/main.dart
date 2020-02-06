import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstNum;
  int secondNum;
  String displayText = "0";
  String res;
  String operator;
   void buttonPressed(String btnVal){
        if(btnVal == "C"){
          displayText = "0";
          firstNum = 0;
          secondNum = 0;
          res = "0";
          operator = "";
        }else if(btnVal == "+" || btnVal == "-" || btnVal == "*" || btnVal == "/"){
          firstNum = int.parse(displayText);
          res = "";
          operator = btnVal;
        }else if(btnVal == "="){
          secondNum = int.parse(displayText);
          if(operator == "+"){
            res = (firstNum + secondNum).toString();
          }
          if(operator == "-"){
            res = (firstNum - secondNum).toString();
          }
          if(operator == "*"){
            res = (firstNum * secondNum).toString();
          }
          if(operator == "/"){
            res = (firstNum ~/ secondNum).toString();
          }
        }else{
          res = int.parse(displayText + btnVal).toString();
        }
        setState(() {
          displayText = res;
        });
  }
  Widget customButton(String btnVal){
    return Expanded(
      child: OutlineButton(
        onPressed: ()=> buttonPressed(btnVal),
        padding: EdgeInsets.all(15.0),
        child: Text(
            "$btnVal",
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.blue
        ),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "$displayText",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("7"),
                customButton("8"),
                customButton("9"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4"),
                customButton("5"),
                customButton("6"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("1"),
                customButton("2"),
                customButton("3"),
                customButton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

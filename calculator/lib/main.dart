import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple,
        backgroundColor: Colors.black,
        buttonColor: Colors.black,
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String preOutput = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  bool equalled = false;

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      preOutput = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      output  = preOutput;
      print("y");
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      preOutput = "0";
    } else if (buttonText == ".") {
      if (preOutput.contains(".")) {
        print("Already contains a dec");
        return;
      } else {
        preOutput = preOutput + buttonText;
      }
    } else if (buttonText == "=") {
      equalled = true;
      num2 = double.parse(output);

      if (operand == "+") {
        preOutput = (num1 + num2).toString();
      }
      if (operand == "-") {
        preOutput = (num1 - num2).toString();
      }
      if (operand == "/") {
        preOutput = (num1 / num2).toString();
      }
      if (operand == "X") {
        preOutput = (num1 * num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      if (equalled) {
        equalled = false;
        preOutput = buttonText;
      } else {
        preOutput += buttonText;
      }
      print(preOutput + " is preOutput");
    }
    setState(() {
      output = double.parse(preOutput).toStringAsFixed(2);
    });
  }


  Widget buildbutton(String buttontext) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(40.0),
        child: new Text(buttontext,
          style: TextStyle(fontSize: 18)
        ),
        onPressed: () =>
            buttonPressed(buttontext)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0,
                  ),
                  child: new Text(output, style: new TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ))),
              new Expanded(
                child: new Divider(),
              ),
              new Column(children: [
                new Row(
                  children: [
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("/")

                  ],
                ),
                new Row(
                  children: [
                    buildbutton("4"),
                    buildbutton("5"),
                    buildbutton("6"),
                    buildbutton("X")
                  ],
                ),
                new Row(
                  children: [
                    buildbutton("1"),
                    buildbutton("2"),
                    buildbutton("3"),
                    buildbutton("-")
                  ],
                ),
                new Row(
                  children: [
                    buildbutton("."),
                    buildbutton("0"),
                    buildbutton(""),
                    buildbutton("+")
                  ],
                ),
                new Row(
                  children: [
                    buildbutton("CLEAR"),
                    buildbutton("="),
                  ],
                )
              ],
            )
          ]
        )
      )
    );
  }
}
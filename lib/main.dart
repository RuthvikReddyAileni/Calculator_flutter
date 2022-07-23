import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext build) => MaterialApp(
        title: "Calculator App",
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.black,
        ),
        home: const HomeScreen(),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String title = "Calculator";

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(HomeScreen.title),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Welcome to Calculator App",
                      style: TextStyle(fontSize: 25)),
                  ElevatedButton(
                    child:
                        const Text('Start', style: TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalcScreen()),
                      );
                    },
                  ),
                ]),
          ),
        ),
      );
}

class CalcScreen extends StatelessWidget {
  CalcScreen({super.key});

  List<bool> isSelected = [true];
  List<bool> isSelected1 = [false, false, false, false, false];
  static String expression = "";
  static int result = 0;
  static String part1 = "";
  static String part2 = "";
  static bool expressionclick = false;
  static String resulttext = "Result : ";

  static number_click(int x) {
    if (expressionclick) {
      part2 = part2 + x.toString();
    } else {
      part1 = part1 + x.toString();
    }
  }

  static submit_click() {

      if(expression == "+") {
        result = int.parse(part1) + int.parse(part2);
        resulttext = "Result : " + result.toString();
        Fluttertoast.showToast(msg: resulttext.toString());
        print(result);
      }if(expression == "-") {
        result = int.parse(part1) - int.parse(part2);
        resulttext = "Result : " + result.toString();
        Fluttertoast.showToast(msg: resulttext.toString());
        print(result);
      }
      if(expression == "x") {
        result = int.parse(part1) * int.parse(part2);
        resulttext = "Result : " + result.toString();
        Fluttertoast.showToast(msg: resulttext.toString());
        print(result);
      }
      if(expression == "%") {
        result = int.parse(part1) % int.parse(part2);
        resulttext = "Result : " + result.toString();
        Fluttertoast.showToast(msg: resulttext.toString());
        print(result);
      }
  }

  static clear() {
    result = 0;
    part1 = "";
    part2 = "";
    expressionclick = false;
    resulttext = "Result :";
    print(result);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Calc Screen"),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0)),
                      isSelected: isSelected1,
                      children: const <Widget>[
                        Text("1", style: TextStyle(fontSize: 25.0)),
                        Text("2", style: TextStyle(fontSize: 25.0)),
                        Text("3", style: TextStyle(fontSize: 25.0)),
                        SizedBox(height: 5),
                        Icon(Icons.add),
                      ],
                      color: Colors.black,
                      borderColor: Colors.black,
                      fillColor: Colors.blue,
                      selectedColor: Colors.red,
                      onPressed: (int index) {
                        if (index >= 0 && index <= 2) {
                          number_click(index + 1);
                        }
                        if (index == 4) {
                          CalcScreen.expression = "+";
                          expressionclick = true;
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: isSelected1,
                      children: const <Widget>[
                        Text("4", style: TextStyle(fontSize: 25.0)),
                        Text("5", style: TextStyle(fontSize: 25.0)),
                        Text("6", style: TextStyle(fontSize: 25.0)),
                        SizedBox(height: 5),
                        Icon(Icons.remove),
                      ],
                      color: Colors.black,
                      borderColor: Colors.black,
                      fillColor: Colors.blue,
                      selectedColor: Colors.red,
                      onPressed: (int index) {
                        if (index >= 0 && index <= 2) {
                          number_click(index + 1 + 3);
                        }
                        if (index == 4) {
                          CalcScreen.expression = "-";
                          expressionclick = true;
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: isSelected1,
                      children: const <Widget>[
                        Text("7", style: TextStyle(fontSize: 25.0)),
                        Text("8", style: TextStyle(fontSize: 25.0)),
                        Text("9", style: TextStyle(fontSize: 25.0)),
                        SizedBox(height: 5),
                        Text("X", style: TextStyle(fontSize: 25.0)),
                      ],
                      color: Colors.black,
                      borderColor: Colors.black,
                      fillColor: Colors.blue,
                      selectedColor: Colors.red,
                      onPressed: (int index) {
                        if (index >= 0 && index <= 2) {
                          number_click(index + 1 + 6);
                        }
                        if (index == 4) {
                          CalcScreen.expression = "x";
                          expressionclick = true;
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      borderColor: Colors.black,
                      fillColor: Colors.blue,
                      selectedColor: Colors.red,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15.0)),
                      children: <Widget>[
                        Icon(Icons.clear_all),
                        Text("=", style: TextStyle(fontSize: 25.0)),
                        Text("0", style: TextStyle(fontSize: 25.0)),
                        SizedBox(height: 5),
                        Text("%", style: TextStyle(fontSize: 25.0))
                      ],
                      isSelected: isSelected1,
                      onPressed: (int index) {
                        if (index == 0) {
                          clear();
                        } else if (index == 1) {
                          submit_click();
                        } else if (index == 2) {
                          number_click(0);
                        } else if (index == 4) {
                          CalcScreen.expression = "%";
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

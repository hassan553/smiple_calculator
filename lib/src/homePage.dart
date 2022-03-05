import 'package:flutter/material.dart';
import 'package:smiple_calculator/widget/Widget.dart';
import 'package:math_expressions/math_expressions.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = '0';
  String result = '0';
  var expression;


  void onpressedButton({text}){
    setState(() {
      if(text == "C"){
        equation = "0";
        result = "0";

      }

      else if(text == "⌫"){

        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(text == "="){

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }

      else{

        if(equation == "0"){
          equation = text;
        }else {
          equation = equation + text;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Column(
          children: [
            Container(

              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(
                right: 15,
              ),
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 15,
                right: 3,
                left: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      result.toString(),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child:SingleChildScrollView(
                    child: Text(
                      equation.toString(),
                      textAlign: TextAlign.right,
                      
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        designButton(
                            text: 'C',
                            onpressed: () {
                              onpressedButton(text: 'C');
                            }),
                        designButton(
                            text: '⌫',
                            onpressed: () {
                              onpressedButton(text: '⌫');
                            }),
                        designButton(
                            text: '÷',
                            onpressed: () {
                              onpressedButton(text: '÷');
                            }),
                        designButton(
                            text: '%',
                            onpressed: () {
                              onpressedButton(text: '%');
                            }),
                      ],
                    ),
                  ),
                 Expanded(child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      designButton(
                        text: '1',
                        onpressed: () {
                          onpressedButton(text: '1');
                        },
                      ),
                      designButton(
                        text: '2',
                        onpressed: () {
                          onpressedButton(text: '2');
                        },
                      ),
                      designButton(
                        text: '3',
                        onpressed: () {
                          onpressedButton(text: '3');
                        },
                      ),
                      designButton(
                        text: '*',
                        onpressed: () {
                          onpressedButton(text: '*');
                        },
                      ),
                    ],
                  )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        designButton(
                          text: '4',
                          onpressed: () {
                            onpressedButton(text: '4');
                          },
                        ),
                        designButton(
                          text: '5',
                          onpressed: () {
                            onpressedButton(text: '5');
                          },
                        ),
                        designButton(
                          text: '6',
                          onpressed: () {
                            onpressedButton(text: '6');
                          },
                        ),
                        designButton(
                          text: '+',
                          onpressed: () {
                            onpressedButton(text: '+');
                          },
                        ),
                      ],
                    ),
                  ),
                 Expanded(child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      designButton(
                        text: '7',
                        onpressed: () {
                          onpressedButton(text: '7');
                        },
                      ),
                      designButton(
                        text: '8',
                        onpressed: () {
                          onpressedButton(text: '8');
                        },
                      ),
                      designButton(
                        text: '9',
                        onpressed: () {
                          onpressedButton(text: '9');
                        },
                      ),
                      designButton(
                        text: '-',
                        onpressed: () {
                          onpressedButton(text: '-');
                        },
                      ),
                    ],
                  ),),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        designButton(
                          text: '.',
                          onpressed: () {
                            onpressedButton(text: '.');
                          },
                        ),
                        designButton(
                          text: '0',
                          onpressed: () {
                            onpressedButton(text: '0');
                          },
                        ),
                        designButton(
                          text: '00',
                          onpressed: () {
                            onpressedButton(text: '0');
                          },
                        ),
                        designButton(
                          text: '=',
                          onpressed: () {
                            onpressedButton(text: '=');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

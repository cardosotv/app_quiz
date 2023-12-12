import 'package:flutter/material.dart';
import 'package:app_quiz/core/data/repositories/global_var.dart';



class widgetOptions extends StatefulWidget {
  final List<String> options;
  final String optionCorret;

  const widgetOptions(this.options, this.optionCorret, {super.key});

  @override
  State<widgetOptions> createState() => _widgetOptionsState();
}

class _widgetOptionsState extends State<widgetOptions> {
  String? _optionSelect = " ";

  @override
  Widget build(BuildContext context) {
    bool isCorrect = false;
    List<String> options = widget.options;
    String optionCorret = widget.optionCorret;

    return Column(
      children: <Widget>[
        ListTile(
          title: Text(options[0]),
          leading: Radio<String>(
            value: options[0],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(options[1]),
          leading: Radio<String>(
            value: options[1],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(options[2]),
          leading: Radio<String>(
            value: options[2],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(options[3]),
          leading: Radio<String>(
            value: options[3],
            groupValue: _optionSelect,
            onChanged: (String? value) {
              setState(() {
                _optionSelect = value;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: _optionSelect == " " ? null : (){ 
                setState(() {
                  print('Correct: $optionCorret');
                  print('Selected: $_optionSelect');
                  if(optionCorret == _optionSelect) { 
                    isCorrect = true;
                    answer['answer'] = optionSelected;
                   } 
                   else { 
                     answer['answer'] = " ";
                     isCorrect = false;
                   }
                  functionBottomSheet(context, isCorrect);
                });
                },
              child: const Text(">> Next"),
            ),
          ],
        ),
      ],
    );
  }
}

void functionBottomSheet(BuildContext context, bool isCorrect){
  double maxheight = MediaQuery.of(context).size.height;
//  var indexRandomQuestion = Random().nextInt(9)+1;
//  Question question = Question().getId(indexRandomQuestion);
  showModalBottomSheet<void>(
                        context: context,
                        //isDismissible: false,   
                        builder: (BuildContext context) {
                          return Container(
                            height: maxheight,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    isCorrect
                                        ? 'Correct Answer. =D'
                                        : 'Wrong Answer. =/',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     Navigator.pushNamed(context, Home.routeName);
                                  //     //Navigator.pushNamed(context, QuestionOptions.routeName, arguments: question);
                                  //     //Navigator.of(context).pushNamed(QuestionOptions.routeName, arguments: question);
                                  //   },
                                  //   child: const Text('> Next Question'),
                                  // ),
                                ],
                              ),
                            ),
                           );
                        });
}
import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:app_quiz/features/quiz_answer/view/pages/quiz_result.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/view/widgets/question.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuestionOptions extends StatelessWidget {
  QuestionOptions({super.key});
  //Question question = QuestionCubit().question;
  //final String _optionSelect = "";
  bool isfristLoad = true;
  var questionCubit = QuestionCubit(); 

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    
    if(isfristLoad) {
      questionCubit = context.read<QuestionCubit>();
      questionCubit.getNextQuestion();
      isfristLoad = false;
    } 

    return Container(
      height: maxHeight,
      alignment: Alignment.topLeft,
      child: BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  widgetQuestion(questionCubit.question.question,
                      myWidht: maxWidth - 50, myHeight: 150),
                ],
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child:
                      _widgetOptions(context, questionCubit.question.options)),
              Container(
                margin: const EdgeInsets.only(bottom: 80),
                child: ElevatedButton(
                  onPressed: questionCubit.userAnswer == ""
                      ? null
                      : () => {
                            questionCubit.setAnswerQuestion(),
                            if (questionCubit.randomList.isNotEmpty){
                              questionCubit.getNextQuestion(),
                            } else {
                              Navigator.pushNamed(context, 
                                                  '/questionResult',
                                                  arguments: questionCubit.listAnswers),
                            }
                          },
                  child: const Text("Next"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _widgetOptions(BuildContext context, List<String> options) {
    final questionCubit = context.read<QuestionCubit>();
    options = questionCubit.question.options;
    return BlocConsumer<QuestionCubit, QuestionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width-50,
          margin: EdgeInsets.only(left: 20),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
                   shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: options[index] == questionCubit.userAnswer ?
                                    2 : 0.5,
                        color: options[index] == questionCubit.userAnswer ?
                             const Color.fromARGB(255, 223, 241, 250): 
                             const Color.fromARGB(255, 254, 254, 254), 
                        child: ListTile( 
                          title: Text(options[index]),
                          onTap: (){
                            questionCubit.setOptionSelected(options[index]);
                            print(options[index]);
                          },
                        ),
                      );
                    } 
          ),
        );
      },
    );
  }
}

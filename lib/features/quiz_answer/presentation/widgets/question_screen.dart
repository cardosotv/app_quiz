import 'package:app_quiz/features/quiz_answer/domain/usecases/question_usecase.dart';
import 'package:app_quiz/features/quiz_answer/domain/cubit/question_cubit.dart';
import 'package:app_quiz/features/quiz_answer/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/quiz_answer/presentation/widgets/question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuestionOptions extends StatelessWidget {

  final Map<String?, dynamic> game;
  QuestionOptions(this.game, {super.key});
  //Question question = QuestionCubit().question;
  //final String _optionSelect = "";
  final QuestionUseCase questionUseCase = QuestionUseCase();
  bool isfristLoad = true;
  var questionCubit = QuestionCubit(); 
  var parameters;

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    if(isfristLoad) {
      // parameters = ModalRoute.of(context)!.settings.arguments as Future<List<Question>?>;
      questionCubit = context.read<QuestionCubit>();

      List<Question> questions = questionUseCase.extractQuestionListFromGame(game);

      questionCubit.getNextQuestion(context, questions: questions);
      isfristLoad = false;
    } 
    return Container(
      height: maxHeight,
      alignment: Alignment.center,
      child: BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child:  widgetQuestion(questionCubit.question.question!,
                        myWidht: maxWidth - 50, myHeight: 180),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child:
                      _widgetOptions(context, questionCubit.question.options)),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: questionCubit.userAnswer == ""
                        ? null : () => questionCubit.answerTheQuesion(context),
                    child: const Text("Next"),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _widgetOptions(BuildContext context, List<String>? options) {
    final questionCubit = context.read<QuestionCubit>();
    options = questionCubit.question.options;
    return BlocConsumer<QuestionCubit, QuestionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width-50,
          margin: const EdgeInsets.only(top: 40, left: 20),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
                   shrinkWrap: true,
                    itemCount: options!.length,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: options![index] == questionCubit.userAnswer ?
                                    2 : 0.5,
                        color: options[index] == questionCubit.userAnswer ?
                             const Color.fromARGB(255, 223, 241, 250): 
                             const Color.fromARGB(255, 254, 254, 254), 
                        child: ListTile( 
                          title: Text(options[index]),
                          onTap: (){
                            questionCubit.setOptionSelected(options![index]);
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

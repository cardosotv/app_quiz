import '../../data/repositories/quiz.dart';

class Quiz {
  final int id;
  final String name;
  final String about;

  Quiz({this.id = 0, this.name = " ", this.about = " "});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(id:json['id'], name:json['subject'], about:json['about']);
  }

  Map<String, dynamic> toJson() => {
    "id": this.id,
    "subject": this.name,
    "about": this.about,
  };



  List<Quiz> getList() {

    List<Map<String, dynamic>> list = repositorieQuiz;

    List<Quiz> result = [];

    for(var item in list) {
      result.add(Quiz(id: int.parse(item['id']), 
                      name:item['subject'],
                      about:item['about']) );
    }

    return result;
  }

Quiz getId(int id){

  List<Quiz> list = getList();

  Quiz result = list.where((filter) => filter.id == id).first;
  
  return result;  
  
}


}

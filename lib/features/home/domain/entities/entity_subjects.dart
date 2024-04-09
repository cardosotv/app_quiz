import 'package:equatable/equatable.dart';

class Subject extends Equatable {
    int id;
    String subject;
    String about;
    int icon;

    Subject({
      this.id = 0,
      this.subject = " ",
      this.about = " ",
      this.icon = 0,
  });

  @override
  List<Object> get props => [id, subject, about, icon];

  fromJson(Map<String, dynamic> item){
    this.id = item['id'];
    this.subject = item['name'];
    this.about = item['about'];
    this.icon = item['icon'];
  }
}
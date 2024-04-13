import 'package:equatable/equatable.dart';

class Subject extends Equatable {
    String id;
    String subject;
    String about;
    String icon;

    Subject({
      this.id = "",
      this.subject = " ",
      this.about = " ",
      this.icon = "",
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
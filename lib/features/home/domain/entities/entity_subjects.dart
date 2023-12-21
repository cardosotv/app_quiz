import 'package:equatable/equatable.dart';

class Subject extends Equatable {
    final int id;
    final String subject;
    final String about;
    final int icon;

    Subject({
      this.id = 0,
      this.subject = " ",
      this.about = " ",
      this.icon = 0,
  });

  @override
  List<Object> get props => [id, subject, about, icon];
}
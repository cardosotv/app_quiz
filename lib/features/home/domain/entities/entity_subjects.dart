import 'package:equatable/equatable.dart';
//import 'package:meta/meta.dart';


class Subject extends Equatable {
    final int id;
    final String subject;
    final String about;

    Subject({
      this.id = 0,
      this.subject = " ",
      this.about = " ",
  });

  @override
  List<Object> get props => [id, subject, about];
}
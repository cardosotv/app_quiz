import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? _name;
  String? _id;
  String? _phone;
  String? _birthday;
  String? _address;
  int? _score;

  User();

  String? get name => _name;
  String? get id => _id;
  String? get phone => _phone;
  String? get birthday => _birthday;
  String? get address => _address;
  int? get score => _score;

  void setScore(int score) {
    _score = score;
  }

  void fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _birthday = json['birthday'];
    _address = json['address'];
    _score = json['score'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, phone, birthday, address, score];
}

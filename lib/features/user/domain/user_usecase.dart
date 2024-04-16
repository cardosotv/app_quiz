
import 'dart:async';

import 'package:app_quiz/features/user/domain/user_entity.dart';
import 'package:app_quiz/features/user/data/user_repository.dart';

class UserUseCase{
  
  Future<User?> getUserByID(String id, String token) async{
    // Initiate the User for return 
    User user = User();

    // Request the user to repository 
    UserRepository userRepository = UserRepository();
    user = await userRepository.getUserByIDfromAPI(id, token)
    
    // Treat the error if exists
    .catchError((error) {
      throw Exception('The get user has failed! ${error.toString()}');
    });
    return user;
  }
}
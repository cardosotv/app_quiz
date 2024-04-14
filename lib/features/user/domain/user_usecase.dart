

import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';
import 'package:app_quiz/features/user/domain/user_entity.dart';
import 'package:app_quiz/features/user/data/user_repository.dart';


class UserUseCase{
  User getUserByID(String id, String token){
    // Initiate the User for return 
    User user = User();

    // Request the user to repository 
    UserRepository userRepository = UserRepository();
    userRepository.getUserByIDfromAPI(id, token).whenComplete(() => user);

    // Check if the result is not null or valid
    if (user == null) {
      throw Exception('User requested has beer returned null!');
    }
    
    // Return the result for the requeste
    return user;
  }
}
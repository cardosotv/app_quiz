import 'package:app_quiz/features/login/data/usecases/authentication.dart';
import 'package:app_quiz/features/login/domain/usecases/login_uc_interface.dart';

class LoginUseCase implements LoginUseCaseInterface {

  // final AuthenticationRepository authenticationRepository;
  final Authentication authenticationRepository;

  LoginUseCase(this.authenticationRepository);

  @override
  Future<Map<String?, dynamic>> execute(String user){
    return authenticationRepository.authenticate(user);
  }


}

import 'package:hiring_app/models/employer/employer_register_model.dart';
import 'package:hiring_app/models/login_model.dart';

abstract class AppRegisterStates {}

class AppRegisterInitialState extends AppRegisterStates {}

class AppRegisterLoadingState extends AppRegisterStates {}

class AppRegisterSuccessState extends AppRegisterStates {
  final EmployerRegisterModel employerRegisterModel;

  AppRegisterSuccessState(this.employerRegisterModel);
}

class AppRegisterErrorState extends AppRegisterStates {
  final String error;

  AppRegisterErrorState(this.error);
}

class AppRegisterPassVisibilityState extends AppRegisterStates {}



class ChooseVideoSuccess extends AppRegisterStates {}

class ChooseVideoError extends AppRegisterStates {}

class SignInWithGoogleLoading extends AppRegisterStates {}
class SignInWithGoogleSuccess extends AppRegisterStates {}
class SignInWithGoogleError extends AppRegisterStates {}


class SignOutWithGoogleLoading extends AppRegisterStates {}
class SignOutWithGoogleSuccess extends AppRegisterStates {}
class SignOutWithGoogleError extends AppRegisterStates {}

class SignInLoadingState extends AppRegisterStates {}
class SignInSuccessState extends AppRegisterStates {}
class SignInErrorState extends AppRegisterStates {}


class ChooseProfileImageSuccessState extends AppRegisterStates {}
class ChooseProfileImageErrorState extends AppRegisterStates {}

class RegisterEmployerLoadingState extends AppRegisterStates {}
class RegisterEmployerSuccessState extends AppRegisterStates {}
class RegisterEmployerErrorState extends AppRegisterStates {}

class SignInEmployeeLoadingState extends AppRegisterStates {}
class SignInEmployeeSuccessState extends AppRegisterStates {}
class SignInEmployeeErrorState extends AppRegisterStates {}

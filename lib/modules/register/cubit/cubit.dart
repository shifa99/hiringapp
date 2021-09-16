import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hiring_app/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/models/category_model.dart';
import 'package:hiring_app/models/employee/employee_login_model.dart';
import 'package:hiring_app/models/employer/employer_register_model.dart';
import 'package:hiring_app/models/login_model.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';
import 'package:hiring_app/modules/register/cubit/states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;

  File logoFile;
  String fileLogo;

  chooseLogo() async {
    final getImage2 =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (getImage2 != null) {
      logoFile = File(getImage2.path);
      fileLogo = logoFile.path.split('/').last;
    } else {
      print('No Image Selected ...');
    }
  }

  EmployerRegisterModel employerRegisterModel = EmployerRegisterModel();
  Response responseEmployer;

  /// Employer Register
  void registerEmployer({
    @required String fullName,
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required String title,
    @required String mobile_number1,
    @required String mobile_number2,
    @required String company_name,
    @required String business,
    @required String established_at,
    @required String website,
    @required String country,
    @required String city,
  }) async {
    emit(AppRegisterLoadingState());

    FormData formData = new FormData.fromMap({
      'email': email,
      'password': password,
      'fullName': fullName,
      'confirmPassword': confirmPassword,
      'title': title,
      'mobile_number1': mobile_number1,
      'mobile_number2': mobile_number2,
      'company_name': company_name,
      'business': business,
      'established_at': established_at,
      'website': website,
      'country': country,
      'city': city,
      "image": await MultipartFile.fromFile(
        logoFile.path,
        filename: fileLogo,
        contentType: new MediaType('image', 'jpg'),
      ),
      "type": "image/jpg"
    });
    try {
      responseEmployer = await DioHelper.dio
          .post(
        'http://algorithm.demo.carmartapp.com/Hiring-application/public/api/employer/register',
        data: formData,
        options: Options(
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      )
          .then((value) {
        employerRegisterModel = EmployerRegisterModel.fromJson(value.data);
        tokenEmployer = employerRegisterModel.token;
        employerId = employerRegisterModel.employer.id;
        print('Employer ID in register $employerId');
        print('Employer token :$tokenEmployer');
        print('model msg : ${employerRegisterModel.message}');
        emit(AppRegisterSuccessState(employerRegisterModel));
      }).catchError((error) {
        print('lol 3 Error : ${responseEmployer}');
        print('Error : $error');
        emit(AppRegisterErrorState(error.toString()));
      });
    } catch (e) {
      print('error $e');
    }
  }

  /// Employer Login
  loginEmployer({String email, String pass}) async {
    emit(SignInLoadingState());
    await DioHelper.postData(
        url: EMPLOYERLOGIN,
        data: {'email': email, 'password': pass}).then((value) {
      if (value.data['status']) {
        print(value.data);
        tokenEmployer = value.data['token'];
        employerId = value.data['employer']['id'];
        CacheHelper.saveDate(key: 'employerId', value: employeeId);
        print('EmployerId inside emprrr $employerId');
        CacheHelper.saveDate(key: 'tokenEmployer', value: tokenEmployer);
        emit(SignInSuccessState());
      } else {
        print(value.data);
        emit(SignInErrorState());
      }
    }).catchError((e) {
      print('Err $e');
      if (e == 'DioError [DioErrorType.response]: Http status error [400]') {
        print('passwored or email is wrong');
      } else {
        print('E lol');
      }
      emit(SignInErrorState());
    });
  }

  IconData suffix = Icons.remove_red_eye;
  bool isPassword = true;

  void changePassVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.remove_red_eye : Icons.visibility_off_outlined;
    emit(AppRegisterPassVisibilityState());
  }

  File cameraVideo;
  File videoFile;
  String fileVideoName;

  /// pick video
  chooseVideo() async {
    final getVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (getVideo != null) {
      videoFile = File(getVideo.path);

      fileVideoName = videoFile.path.split('/').last;
      print('videoFile : $videoFile');
      print('fileVideoName : $fileVideoName');
    } else {
      print('No Video Selected ...');
    }
  }

  /// Firebase Initialization
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }

  /// Google SignIn
  Future<User> signInWithGoogle({BuildContext context}) async {
    emit(SignInWithGoogleLoading());

    FirebaseAuth auth = FirebaseAuth.instance;
    User user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      // if (kIsWeb) {
      //   GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential).then((value) {
          print('lolDone');
          loginModel = LoginModel.fromJson({
            'name': value.user.displayName,
            'id': value.user.uid,
            'phone': value.user.phoneNumber,
            'photo': value.user.photoURL,
            'token': value.user.refreshToken,
          });
          print('lolDone EE');

          print('Google signIn User data : ${value.user}');

          print('Google signIn displayName : ${value.user.displayName}');
          print('Google signIn email : ${value.user.email}');
          print('Google signIn phoneNumber : ${value.user.phoneNumber}');
          print('Google signIn uID : ${value.user.uid}');

          print('Google signIn photoURL : ${value.user.photoURL}');

          print(
              'Google signIn additionalUserInfo : ${value.additionalUserInfo}');

          DioHelper.postData(
              url:
                  'http://smartgroup-demo.com/moro/Hiring-application/public/api/login/socialite',
              data: {
                'email': value.user.email,
                'email_id': value.user.uid,
                'fullName': value.user.displayName,
              }).then((value) {
            print(value.data);
            tokenEmployee = value.data['token'];

            emit(SignInWithGoogleSuccess());
          }).catchError((e) {
            print('Error Google :$e');
          });
        }).catchError((e) {
          print('Google signIn Error : $e');
          emit(SignInWithGoogleError());
        });

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print('Error Code : ${e.code}');
          print('Error msg : ${e.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
          emit(SignInWithGoogleError());
        } else if (e.code == 'invalid-credential') {
          print('Error Code : ${e.code}');
          print('Error msg : ${e.message}');

          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
          emit(SignInWithGoogleError());
        }
      } catch (e) {
        print('Error msg container : $e');
      }
    }
    // }
    return user;
  }

  /// Google SignOut
  Future<void> signOut({BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    emit(SignOutWithGoogleLoading());

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut().then((value) {}).catchError((e) {
          print('Error : $e');
        });
      }
      await FirebaseAuth.instance.signOut();
      navigateTo(context, EmployerLoginScreen());
      emit(SignOutWithGoogleSuccess());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
      emit(SignOutWithGoogleError());
    }
  }

  File profileFile;
  String profileFileTx;

  chooseProfileImage() async {
    final getImage2 = await ImagePicker().getImage(source: ImageSource.gallery);

    if (getImage2 != null) {
      profileFile = File(getImage2.path);
      profileFileTx = profileFile.path.split('/').last;
      emit(ChooseProfileImageSuccessState());
    } else {
      print('No Image Selected ...');
      emit(ChooseProfileImageErrorState());
    }
  }

  /// Employee Register
  Response responseEmployee;
  EmployeeLoginModel employeeLoginModel = EmployeeLoginModel();

  Future<bool> registerEmployee({
    @required String fullName,
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required String country,
    @required String city,
    @required String title,
    @required String qualification,
    @required String university,
    @required String graduation_year,
    @required String study_field,
    @required int deriving_licence,
    @required String birth,
    @required String gender,
    @required String skills,
    @required String languages,
    @required String cv,
    @required String audio,
    @required String video,
    @required String industry,
  }) async {
    emit(RegisterEmployerLoadingState());
    String tokenFCM = await FirebaseMessaging.instance.getToken();

    FormData formData = new FormData.fromMap({
      'email': email,
      'password': password,
      'fullName': fullName,
      'confirmPassword': confirmPassword,
      'title': title,
      'qualification': qualification,
      'university': university,
      'graduation_year': graduation_year,
      'study_field': study_field,
      'deriving_licence': deriving_licence,
      'experience': 2,
      //'skills': 's',
      //'languages':'l',
      'cv': await MultipartFile.fromFile(cv,
          filename: cv.split('/').last, contentType: MediaType('file', 'pdf')),
      'audio': audio,
      'video': video,
      'birth': birth,
      'gender': gender,
      'country': country,
      'token_firebase': tokenFCM,
      'city': city,
      'industry': industry,
      "image": await MultipartFile.fromFile(
        profileFile.path,
        filename: profileFileTx,
        contentType: new MediaType('image', 'jpg'),
      ),
      //  "type": "image/jpg",
    });
    try {
      responseEmployee = await DioHelper.dio.post(
        'http://algorithm.demo.carmartapp.com/Hiring-application/public/api/register',
        data: formData,
        options: Options(
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status) 
          {
            return status < 500;
          },
        ),
      );
      if (responseEmployee.data['status']) 
      {
        print('All data : ${responseEmployee.data}');
        employeeLoginModel = EmployeeLoginModel.fromJson(responseEmployee.data);
        tokenEmployee = employeeLoginModel.token;
        print('Employer token :$tokenEmployee');
        print('Employer token :$tokenEmployee');

        CacheHelper.saveDate(key: 'tokenEmployee', value: tokenEmployee);
        emit(RegisterEmployerSuccessState());
        return true;
      }
    } catch (eee) {
      print('EEEEEEEEEEEEE $eee');
      emit(RegisterEmployerErrorState());
      return false;
    }
  }

  /// Employee Login
  Future<void> loginEmployee({String email, String pass}) async {
    emit(SignInEmployeeLoadingState());
    String tokenFCM = await FirebaseMessaging.instance.getToken();
    await DioHelper.postData(url: EMPLOYEELOGIN, data: {
      'email': email,
      'password': pass,
      'token_firebase': tokenFCM
    }).then((value) {
      print(' lo data :${value.data}');
      if (value.data['status']) {
        tokenEmployee = value.data['token'];
        emit(SignInEmployeeSuccessState());
      } else {
        print('Err lo E :${employeeLoginModel.message}');
        emit(SignInEmployeeErrorState());
      }
    }).catchError((e) {
      print('Err $e');

      emit(SignInEmployeeErrorState());
    });
  }

  CategoryModel categoryModel = CategoryModel();

  getCategory() {
    DioHelper.getData(
      url:
          'http://smartgroup-demo.com/moro/Hiring-application/public/api/guest/categories',
    ).then((value) {
      print(value.data);
      categoryModel = CategoryModel.fromJson(value.data);
      print('Cat Model = ${categoryModel.name}');
    }).catchError((e) {
      print('e :$e');
    });
  }
}

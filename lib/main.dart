import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/helpers/firebase_helper.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employee/home/home_layout.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/employer_cubit/employer_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/home_employer_layout.dart';
import 'package:hiring_app/modules/onboarding/onboarding.dart';
import 'package:hiring_app/modules/register/cubit/cubit.dart';
import 'package:hiring_app/modules/who_are_you_screen.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';
import 'package:hiring_app/shared/bloc_observer.dart';
import 'components/constants.dart';
import 'modules/Employee/home/cubit/accept_meeting_time_cubit/accept_meeting_time_cubit.dart';
import 'modules/Employee/home/cubit/get_confirmed_meetings_cubit/get_confirmed_meetings_cubit.dart';
import 'modules/Employer/home_employee/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await FirebaseHelper.firebaseInit();
  DioHelper.init();
  // SharedPreferences.setMockInitialValues({});
  await CacheHelper.init();
  onBoarding = CacheHelper.getDate(key: 'onBoarding');
  tokenEmployer = CacheHelper.getDate(key: 'tokenEmployer');
  tokenEmployee = CacheHelper.getDate(key: 'tokenEmployee');
  String tokenFCM = await FirebaseMessaging.instance.getToken();
  print('Fcm $tokenFCM');

  // employerId = CacheHelper.getDate(key: 'employerId');
  employerId = 1;
  print('tokenEmployer :$tokenEmployer');
  print('tokenEmployee :$tokenEmployee');

  Widget widget;
  if (onBoarding == null || onBoarding == false) {
    widget = OnBoardingScreen();
  } else {
    if ((tokenEmployer == '' || tokenEmployer == null) &&
        (tokenEmployee == '' || tokenEmployee == null)) {
      widget = WhoAreYouScreen();
    } else if (tokenEmployer != null &&
        (tokenEmployee == null || tokenEmployee == '')) {
      widget = HomeEmployerLayout();
    } else if (tokenEmployee != null &&
        tokenEmployee.isNotEmpty &&
        (tokenEmployer != '' || tokenEmployer == null)) {
      widget = HomeLayout();
    } else {
      widget = WhoAreYouScreen();
    }
  }

  print('MainWidget :$widget');

  runApp(
    MultiBlocProvider(
      providers: [
        /// Employee
        BlocProvider<AppCubit>(create: (context) => AppCubit()),

        /// Employer
        BlocProvider<AppEmployerCubit>(create: (context) => AppEmployerCubit()),

        /// Login & Register
        BlocProvider<AppRegisterCubit>(create: (context) => AppRegisterCubit()),
        BlocProvider(create: (context) => AcceptMeetingTimeCubit()),
        //
        BlocProvider(create: (context) => GetMyScheduleEmployeeMeetingsCubit()),
      ],
      child: MyApp(
        mainWidget: widget,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget mainWidget;

  const MyApp({this.mainWidget});

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
      // navigateTo(context, ChatScreen(1));
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print(event.data);
      print('opened');
    });
    return BlocProvider(
      create: (BuildContext context) {
        AppRegisterCubit();
        AppCubit();
        AppEmployerCubit();
        //  GetMyScheduleEmployeeMeetingsCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hiring',
        theme: ThemeData(
          primaryColor: defaultColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            titleSpacing: 20,
            // backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black26,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
            backgroundColor: defaultColor,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: secondColor,
              fontSize: 24,
              // fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: secondColor),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: defaultColor,
            unselectedItemColor: Colors.black,
            elevation: 10,
            backgroundColor: Colors.white,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: defaultColor),
            headline1: TextStyle(
              fontSize: 24,
              color: secondColor,
              // fontFamily: 'Janna',
            ),
          ),
          // fontFamily: 'Janna',
        ),
        home: mainWidget,
      ),
    );
  }
}

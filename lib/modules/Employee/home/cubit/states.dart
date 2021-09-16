abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppLoadingHomeDataState extends AppStates {}

class AppSuccessHomeDataState extends AppStates {}


class AppErrorHomeDataState extends AppStates {
  final String error;

  AppErrorHomeDataState(this.error);
}
class AppLoadingAddCarState extends AppStates {}


class AppSuccessAddCarState extends AppStates {}


class AppErrorAddCarState extends AppStates {
  final String error;

  AppErrorAddCarState(this.error);
}

class AppLoadingAddCarImageState extends AppStates {}


class AppSuccessAddCarImageState extends AppStates {}


class AppErrorAddCarImageState extends AppStates {
}

class GetEmployeeProfileLoadingState extends AppStates {}

class GetEmployeeProfileSuccessState extends AppStates {}

class GetEmployeeProfileErrorState extends AppStates {}

class UpdateEmployeeProfileLoadingState extends AppStates {}

class UpdateEmployeeProfileSuccessState extends AppStates {}

class UpdateEmployeeProfileErrorState extends AppStates {}

class GetEmployeeHomeDataLoadingState extends AppStates {}

class GetEmployeeHomeDataSuccessState extends AppStates {}

class GetEmployeeHomeDataErrorState extends AppStates {}


class GetJobDetailsEmployeeHomeDataLoadingState extends AppStates {}

class GetJobDetailsEmployeeHomeDataSuccessState extends AppStates {}

class GetJobDetailsEmployeeHomeDataErrorState extends AppStates {}

class JobApplyEmployeeHomeDataLoadingState extends AppStates {}

class JobApplyEmployeeHomeDataSuccessState extends AppStates {}

class JobApplyEmployeeHomeDataErrorState extends AppStates {}

class GetGuestHomeDataLoadingState extends AppStates {}

class GetGuestHomeDataSuccessState extends AppStates {}

class GetGuestHomeDataErrorState extends AppStates {}



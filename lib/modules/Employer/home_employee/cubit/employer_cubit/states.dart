abstract class AppEmployerStates {}

class AppEmployeeInitialState extends AppEmployerStates {}

class AppEmployeeChangeBottomNavBarState extends AppEmployerStates {}



class AppEmployeeLoadingHomeDataState extends AppEmployerStates {}


class AppEmployeeSuccessHomeDataState extends AppEmployerStates {}


class AppEmployeeErrorHomeDataState extends AppEmployerStates {
  final String error;

  AppEmployeeErrorHomeDataState(this.error);
}

class EmployerLogoPickedSuccessState extends AppEmployerStates {}

class EmployerLogoPickedErrorState extends AppEmployerStates {}

class GetEmployerProfileLoadingState extends AppEmployerStates {}
class GetEmployerProfileSuccessState extends AppEmployerStates {}
class GetEmployerProfileErrorState extends AppEmployerStates {}

class GetCandidatesLoadingState extends AppEmployerStates {}
class GetCandidatesSuccessState extends AppEmployerStates {}
class GetCandidatesErrorState extends AppEmployerStates {}

class ShowEmployeeProfileLoadingState extends AppEmployerStates {}
class ShowEmployeeProfileSuccessState extends AppEmployerStates {}
class ShowEmployeeProfileErrorState extends AppEmployerStates {}

class GetEmployerHomeDataLoadingState extends AppEmployerStates {}
class GetEmployerHomeDataSuccessState extends AppEmployerStates {}
class GetEmployerHomeDataErrorState extends AppEmployerStates {}

class GetMuScheduleDataLoadingState extends AppEmployerStates {}
class GetMuScheduleDataSuccessState extends AppEmployerStates {}
class GetMuScheduleDataErrorState extends AppEmployerStates {}
//Create Job
class LoadingCreateJobState extends AppEmployerStates {}
class SuccessCreateJobState extends AppEmployerStates {}
class ErrorCreateJobState extends AppEmployerStates {}
//delete Job
class LoadingDeleteJobState extends AppEmployerStates {}
class SuccessDeleteJobState extends AppEmployerStates {}
//Edit Job
class LoadingEditJobState extends AppEmployerStates {}
class SuccessEditJobState extends AppEmployerStates {}
class ErrorEditJobState extends AppEmployerStates {}
class ErrorDeleteJobState extends AppEmployerStates {}
//acceptOrRejectEmployee
class LoadingAcceptOrRejectJobState extends AppEmployerStates {}
class SuccessAcceptOrRejectJobState extends AppEmployerStates {}
class ErrorAcceptOrRejectJobState extends AppEmployerStates {}





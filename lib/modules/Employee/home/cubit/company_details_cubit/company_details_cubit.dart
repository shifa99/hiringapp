import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/models/employee/company_details_model.dart';
import 'package:hiring_app/modules/Employee/home/cubit/company_details_cubit/company_details_states.dart';
import 'package:hiring_app/network/end_points.dart';
import 'package:hiring_app/network/remote/dio_helper.dart';

class CompanyDetailsCubit extends Cubit<CompanyDetailsStates> {
  CompanyDetailsCubit() : super(CompanyDetailsLoadingState());
  static CompanyDetailsCubit get(context) => BlocProvider.of(context);
  CompanyDetailsModel companyDetailsModel;
  Future<void> getCompanyDetails(int employerId) async {
    emit(CompanyDetailsLoadingState());
    try {
      final response = await DioHelper.getData(
        url: '$companyDetaials$employerId',
      );
      companyDetailsModel = CompanyDetailsModel.fromJson(response.data);
      emit(CompanyDetailsSuccessState());
    } catch (e) {
      emit(CompanyDetailsErrorState());
    }
  }
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data_layer/datasource_contract/auth_datasource.dart' as _i219;
import '../../data_layer/datasource_contract/dr_datasource.dart' as _i310;
import '../../data_layer/datasource_contract/dr_datasource_contract.dart'
    as _i563;
import '../../data_layer/datasource_contract/hospital_datasource.dart' as _i484;
import '../../data_layer/datasource_contract/pharmacy_datasource.dart' as _i700;
import '../../data_layer/datasource_impl/auth_datasource_impl.dart' as _i147;
import '../../data_layer/datasource_impl/doctor-datasource_impl.dart' as _i578;
import '../../data_layer/datasource_impl/dr_datasource_impl.dart' as _i1006;
import '../../data_layer/datasource_impl/hospital_datasource_impl.dart'
    as _i355;
import '../../data_layer/datasource_impl/pharmacy_datasource_impl.dart'
    as _i1040;
import '../../data_layer/repo_impl/auth_repo_impl.dart' as _i654;
import '../../data_layer/repo_impl/DoctorRepoImpl.dart' as _i580;
import '../../data_layer/repo_impl/hospital-datasource_impl.dart' as _i990;
import '../../Domain/repo_contract/auth_repo.dart' as _i765;
import '../../Domain/repo_contract/dr_repo.dart' as _i578;
import '../../Domain/repo_contract/hospital_repo.dart' as _i680;
import '../../Domain/usecase/auth_usecase/confirm_email.dart' as _i584;
import '../../Domain/usecase/auth_usecase/login_usecase.dart' as _i970;
import '../../Domain/usecase/auth_usecase/register_usecase.dart' as _i757;
import '../../Domain/usecase/auth_usecase/reqResetPasswordUsecase.dart'
    as _i349;
import '../../Domain/usecase/auth_usecase/reset_password_usecase.dart' as _i289;
import '../../Domain/usecase/available_time_usecase.dart' as _i198;
import '../../Domain/usecase/doctor_usecase.dart' as _i820;
import '../../Domain/usecase/dr_usecase.dart' as _i176;
import '../../Domain/usecase/get_dr_by_id_usecase.dart' as _i179;
import '../../Domain/usecase/hospital_usecase.dart' as _i181;
import '../../Domain/usecase/pharmcy_usecase.dart' as _i118;
import '../../presentation/authentication/view_model/cubit/auth_cubit.dart'
    as _i358;
import '../../presentation/home/tabs/2-Pharmacy_tab/ViewModel/pharmcy_view_model_cubit.dart'
    as _i145;
import '../../presentation/home/tabs/4-hospital_tab/ViewModel/hospital_view_model_cubit.dart'
    as _i684;
import '../../presentation/home/tabs/5-doctor-tab/ViewModel/dr_view_model_cubit.dart'
    as _i93;
import '../../presentation/home/tabs/5-doctor-tab/Widgets/dr_info/view_model/specific_doctor_cubit.dart'
    as _i993;
import '../../presentation/home/tabs/5-doctor-tab/Widgets/dr_info/widget/available_time_cubit.dart'
    as _i80;
import '../api/api_manager.dart' as _i1047;
import '../cache/shared_pref.dart' as _i299;
import '../ModelService.dart' as _i594;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i299.CacheHelper>(() => _i299.CacheHelper());
    gh.singleton<_i594.ModelService>(() => _i594.ModelService());
    gh.factory<_i484.HospitalDatasource>(() => _i355.HospitalDatasourceImpl(
          gh<_i1047.ApiManager>(),
          gh<_i299.CacheHelper>(),
        ));
    gh.factory<_i700.PharmacyDatasource>(
        () => _i1040.PharmacyDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i310.DrDatasource>(
        () => _i578.DrDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i563.DoctorDatasourceContract>(
        () => _i1006.DoctorDatasourceImpl(gh<_i594.ModelService>()));
    gh.factory<_i219.AuthDatasource>(
        () => _i147.AuthDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i198.AvailableTimeUsecase>(
        () => _i198.AvailableTimeUsecase(gh<_i310.DrDatasource>()));
    gh.factory<_i820.DrUsecase>(
        () => _i820.DrUsecase(gh<_i310.DrDatasource>()));
    gh.factory<_i179.SpecificDoctorUsecase>(
        () => _i179.SpecificDoctorUsecase(gh<_i310.DrDatasource>()));
    gh.factory<_i765.AuthRepo>(
        () => _i654.AuthRepoImpl(gh<_i219.AuthDatasource>()));
    gh.factory<_i80.AvailableTimeCubit>(
        () => _i80.AvailableTimeCubit(gh<_i198.AvailableTimeUsecase>()));
    gh.factory<_i118.PharmcyUsecase>(
        () => _i118.PharmcyUsecase(gh<_i700.PharmacyDatasource>()));
    gh.factory<_i145.PharmcyViewModelCubit>(
        () => _i145.PharmcyViewModelCubit(gh<_i118.PharmcyUsecase>()));
    gh.factory<_i680.HospitalRepo>(
        () => _i990.HospitalRepoImpl(gh<_i484.HospitalDatasource>()));
    gh.factory<_i584.ConfirmEmailUsecase>(
        () => _i584.ConfirmEmailUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i970.LoginUsecase>(
        () => _i970.LoginUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i757.RegisterUsecase>(
        () => _i757.RegisterUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i349.ReqResetPasswordUsecase>(
        () => _i349.ReqResetPasswordUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i289.ResetPasswordUsecase>(
        () => _i289.ResetPasswordUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i993.SpecificDoctorCubit>(() => _i993.SpecificDoctorCubit(
          gh<_i179.SpecificDoctorUsecase>(),
          gh<_i198.AvailableTimeUsecase>(),
        ));
    gh.factory<_i358.AuthCubit>(() => _i358.AuthCubit(
          gh<_i757.RegisterUsecase>(),
          gh<_i584.ConfirmEmailUsecase>(),
          gh<_i970.LoginUsecase>(),
          gh<_i349.ReqResetPasswordUsecase>(),
          gh<_i289.ResetPasswordUsecase>(),
        ));
    gh.factory<_i93.DrViewModelCubit>(
        () => _i93.DrViewModelCubit(gh<_i820.DrUsecase>()));
    gh.factory<_i578.DoctorRepo>(() => _i580.DoctorRepoImpl(
        dummyDatasource: gh<_i563.DoctorDatasourceContract>()));
    gh.factory<_i181.HospitalUsecase>(
        () => _i181.HospitalUsecase(gh<_i680.HospitalRepo>()));
    gh.factory<_i684.HospitalViewModelCubit>(
        () => _i684.HospitalViewModelCubit(gh<_i181.HospitalUsecase>()));
    gh.factory<_i176.DoctorUsecase>(
        () => _i176.DoctorUsecase(gh<_i578.DoctorRepo>()));
    return this;
  }
}

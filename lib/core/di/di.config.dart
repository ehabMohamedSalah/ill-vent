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
import '../../data_layer/datasource_contract/dr_datasource_contract.dart'
    as _i563;
import '../../data_layer/datasource_impl/auth_datasource_impl.dart' as _i147;
import '../../data_layer/datasource_impl/dr_datasource_impl.dart' as _i1006;
import '../../data_layer/repo_impl/auth_repo_impl.dart' as _i654;
import '../../data_layer/repo_impl/DoctorRepoImpl.dart' as _i580;
import '../../Domain/repo_contract/auth_repo.dart' as _i765;
import '../../Domain/repo_contract/dr_repo.dart' as _i578;
import '../../Domain/usecase/auth_usecase/confirm_email.dart' as _i584;
import '../../Domain/usecase/auth_usecase/login_usecase.dart' as _i970;
import '../../Domain/usecase/auth_usecase/register_usecase.dart' as _i757;
import '../../Domain/usecase/auth_usecase/reqResetPasswordUsecase.dart'
    as _i349;
import '../../Domain/usecase/auth_usecase/reset_password_usecase.dart' as _i289;
import '../../Domain/usecase/dr_usecase.dart' as _i176;
import '../../presentation/authentication/view_model/cubit/auth_cubit.dart'
    as _i358;
import '../../presentation/home/tabs/5-doctor-tab/ViewModel/dr_view_model_cubit.dart'
    as _i93;
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
    gh.factory<_i563.DoctorDatasourceContract>(
        () => _i1006.DoctorDatasourceImpl(gh<_i594.ModelService>()));
    gh.factory<_i219.AuthDatasource>(
        () => _i147.AuthDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i765.AuthRepo>(
        () => _i654.AuthRepoImpl(gh<_i219.AuthDatasource>()));
    gh.factory<_i757.RegisterUsecase>(
        () => _i757.RegisterUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i584.ConfirmEmailUsecase>(
        () => _i584.ConfirmEmailUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i970.LoginUsecase>(
        () => _i970.LoginUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i349.ReqResetPasswordUsecase>(
        () => _i349.ReqResetPasswordUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i289.ResetPasswordUsecase>(
        () => _i289.ResetPasswordUsecase(gh<_i765.AuthRepo>()));
    gh.factory<_i358.AuthCubit>(() => _i358.AuthCubit(
          gh<_i757.RegisterUsecase>(),
          gh<_i584.ConfirmEmailUsecase>(),
          gh<_i970.LoginUsecase>(),
          gh<_i349.ReqResetPasswordUsecase>(),
          gh<_i289.ResetPasswordUsecase>(),
        ));
    gh.factory<_i578.DoctorRepo>(() => _i580.DoctorRepoImpl(
        dummyDatasource: gh<_i563.DoctorDatasourceContract>()));
    gh.factory<_i176.DoctorUsecase>(
        () => _i176.DoctorUsecase(gh<_i578.DoctorRepo>()));
    gh.factory<_i93.DrViewModelCubit>(
        () => _i93.DrViewModelCubit(gh<_i176.DoctorUsecase>()));
    return this;
  }
}

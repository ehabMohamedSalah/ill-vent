// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data_layer/datasource_contract/dr_datasource_contract.dart'
    as _i4;
import '../../data_layer/datasource_impl/dr_datasource_impl.dart' as _i5;
import '../../data_layer/repo_impl/DoctorRepoImpl.dart' as _i7;
import '../../Domain/repo_contract/dr_repo.dart' as _i6;
import '../../Domain/usecase/dr_usecase.dart' as _i8;
import '../../presentation/home/tabs/5-doctor-tab/ViewModel/dr_view_model_cubit.dart'
    as _i9;
import '../ModelService.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ModelService>(() => _i3.ModelService());
    gh.factory<_i4.DoctorDatasourceContract>(
        () => _i5.DoctorDatasourceImpl(gh<_i3.ModelService>()));
    gh.factory<_i6.DoctorRepo>(() => _i7.DoctorRepoImpl(
        dummyDatasource: gh<_i4.DoctorDatasourceContract>()));
    gh.factory<_i8.DoctorUsecase>(
        () => _i8.DoctorUsecase(gh<_i6.DoctorRepo>()));
    gh.factory<_i9.DrViewModelCubit>(
        () => _i9.DrViewModelCubit(gh<_i8.DoctorUsecase>()));
    return this;
  }
}

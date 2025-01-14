import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:injectable/injectable.dart';

import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.login(loginEntity);
  Future<GetStatistisResponseModell> superAdminStats() async =>
      await _api.superAdminStatistic();
  Future<GetAdminUserResponseModel> superAmdinUsers() async =>
      await _api.getSuperAdminUser();
}

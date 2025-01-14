import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    final response = await _contract.login(loginEntity);
    _session.isLoggedIn = true;
    _chache(response.data);
    return response;
  }

  Future<GetStatistisResponseModell> superAdminStats() async {
    final response = await _contract.superAdminStats();
    return response;
  }

  Future<GetAdminUserResponseModel> superAdminUsers() async {
    final response = await _contract.superAmdinUsers();
    return response;
  }

  void _chache(data) {
    print("object::::::${data.toJson()}");
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}

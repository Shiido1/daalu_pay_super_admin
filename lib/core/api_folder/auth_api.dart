import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:injectable/injectable.dart';

import '../connect_end/model/login_entity_model.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    try {
      final response = await _service.call(UrlConfig.login, RequestMethod.post,
          data: loginEntity.toJson());
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetStatistisResponseModell> superAdminStatistic() async {
    try {
      final response = await _service.call(UrlConfig.stats, RequestMethod.get);
      logger.d(response.data);
      return GetStatistisResponseModell.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAdminUserResponseModel> getSuperAdminUser() async {
    try {
      final response = await _service.call(UrlConfig.admins, RequestMethod.get);
      logger.d(response.data);
      return GetAdminUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}

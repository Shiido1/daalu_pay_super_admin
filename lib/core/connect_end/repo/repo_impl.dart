import 'package:daalu_pay_super_admin/core/connect_end/model/disable_payment_response_model/disable_payment_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_currencies_response_model/get_currencies_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_exchange_rates/get_exchange_rates.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/suspend_admin_response_model/suspend_admin_response_model.dart';
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

  Future<GetAdminUserResponseModel> superAdminUsers({String? page}) async {
    final response = await _contract.superAmdinUsers(page: page);
    return response;
  }

  Future<GetCurrenciesResponseModel> getCurrencies() async {
    final response = await _contract.getCurrencies();
    return response;
  }

  Future<GetExchangeRates> getExchangeRate() async {
    final response = await _contract.getExchangeRates();
    return response;
  }

  Future<DisablePaymentResponseModel> disablePayment(String id) async {
    final response = await _contract.disablePayment(id);
    return response;
  }

  Future<DisablePaymentResponseModel> enablePayment(String id) async {
    final response = await _contract.enablePayment(id);
    return response;
  }

  Future<SuspendAdminResponseModel> suspendAdmin(
      {String? id, String? reason}) async {
    final response = await _contract.suspendAdmin(id: id, reason: reason);
    return response;
  }

  Future<SuspendAdminResponseModel> unsuspendAdmin(
      {String? id, String? reason}) async {
    final response = await _contract.unSuspendAdmin(id: id, reason: reason);
    return response;
  }

  Future<dynamic> deleteAdimn(String? id) async {
    final response = await _contract.deleteAdmin(id!);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}

import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_response_model/create_admin_response_model.dart';
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
import '../model/add_exchange_rate_entity_model.dart';
import '../model/disable_currency_response_model/disable_currency_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/transfer_fee_entity_model.dart';

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

  Future<CreateAdminResponseModel> createAdminUsers(
      CreateAdminEntityModel createAdmin) async {
    final response = await _contract.createAdmin(createAdmin);
    return response;
  }

  Future<GetCurrenciesResponseModel> getCurrencies() async {
    final response = await _contract.getCurrencies();
    return response;
  }

  Future<DisableCurrencyResponseModel> enableCurrencies(String id) async {
    final response = await _contract.enableCurrencies(id);
    return response;
  }

  Future<DisableCurrencyResponseModel> disableCurrencies(String id) async {
    final response = await _contract.disableCurrencies(id);
    return response;
  }

  Future<GetExchangeRates> getExchangeRate() async {
    final response = await _contract.getExchangeRates();
    return response;
  }

  Future<dynamic> addExchangeRate(
      AddExchangeRateEntityModel addExchangeEntity) async {
    final response = await _contract.addExchangeRate(addExchangeEntity);
    return response;
  }

  Future<dynamic> updateExchangeRate(
      AddExchangeRateEntityModel addExchangeEntity, String id) async {
    final response = await _contract.updateExchangeRate(addExchangeEntity, id);
    return response;
  }

  Future<dynamic> deleteExchangeRate(String id) async {
    final response = await _contract.deleteExchangeRate(id);
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

  Future<dynamic> deleteAdmin(String? id) async {
    final response = await _contract.deleteAdmin(id!);
    return response;
  }

  Future<dynamic> getTransferFee() async {
    final response = await _contract.getTransferFee();
    return response;
  }

  Future<dynamic> makeTransferFees(TransferFeeEntityModel transfer) async {
    final response = await _contract.makeTransferFees(transfer);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}

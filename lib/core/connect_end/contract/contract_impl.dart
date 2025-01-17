import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_response_model/create_admin_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/disable_payment_response_model/disable_payment_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_currencies_response_model/get_currencies_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_exchange_rates/get_exchange_rates.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/suspend_admin_response_model/suspend_admin_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/add_exchange_rate_entity_model.dart';
import '../model/disable_currency_response_model/disable_currency_response_model.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/get_all_user_response_model/get_all_user_response_model.dart';
import '../model/get_payment_method/get_payment_method.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/transfer_fee_entity_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.login(loginEntity);
  Future<GetStatistisResponseModell> superAdminStats() async =>
      await _api.superAdminStatistic();
  Future<GetAdminUserResponseModel> superAmdinUsers({String? page}) async =>
      await _api.getSuperAdminUser(page: page);
  Future<CreateAdminResponseModel> createAdmin(
          CreateAdminEntityModel createAdmin) async =>
      await _api.createAdminUser(createAdmin);
  Future<GetCurrenciesResponseModel> getCurrencies() async =>
      await _api.getCurrencies();
  Future<DisableCurrencyResponseModel> enableCurrencies(String id) async =>
      await _api.enableCurrencies(id);
  Future<DisableCurrencyResponseModel> disableCurrencies(String id) async =>
      await _api.disableCurrencies(id);
  Future<GetExchangeRates> getExchangeRates() async =>
      await _api.getExchangeRate();
  Future<dynamic> addExchangeRate(
          AddExchangeRateEntityModel addExchangeEntity) async =>
      await _api.addExchangeRate(addExchangeEntity);
  Future<dynamic> updateExchangeRate(
          AddExchangeRateEntityModel addExchangeEntity, String id) async =>
      await _api.updateExchangeRate(addExchangeEntity, id);
  Future<dynamic> deleteExchangeRate(String id) async =>
      await _api.deleteExchangeRate(id);
  Future<DisablePaymentResponseModel> disablePayment(String id) async =>
      await _api.disablePayment(id);
  Future<GetPaymentMethod> getPaymentMethod() async => await _api.getPayment();
  Future<DisablePaymentResponseModel> enablePayment(String id) async =>
      await _api.enablePayment(id);
  Future<SuspendAdminResponseModel> suspendAdmin(
          {String? id, String? reason}) async =>
      await _api.suspendAdmin(id: id, reason: reason);
  Future<SuspendAdminResponseModel> unSuspendAdmin(
          {String? id, String? reason}) async =>
      await _api.unsuspendAdmin(id: id, reason: reason);
  Future<dynamic> deleteAdmin(String id) async => await _api.deleteAdmin(id);
  Future<dynamic> getTransferFee() async => await _api.getTransferFees();
  Future<dynamic> makeTransferFees(TransferFeeEntityModel transfer) async =>
      await _api.makeTransferFees(transfer);
  Future<GetAllUserResponseModel> getAllUsers() async => await _api.allUsers();
  Future<GetAdminTransactionsResponseModel> adminTransactions() async =>
      await _api.adminTransactions();
  Future<dynamic> approveUser(String id) async => await _api.approveUser(id);
  Future<dynamic> denyUser(String id) async => await _api.denyUser(id);
  Future<dynamic> suspendUser({String? id, String? text}) async =>
      await _api.suspendUser(id: id, text: text);
  Future<dynamic> unsuspendUser({String? id, String? text}) async =>
      await _api.unsuspendUser(id: id, text: text);
  Future<dynamic> delete(String id) async => await _api.delete(id);
  Future<dynamic> approveTransaction(String id) async =>
      await _api.approveTransactions(id);
  Future<dynamic> denyTransaction({String? id, String? text}) async =>
      await _api.denyTransactions(id: id, text: text);
}

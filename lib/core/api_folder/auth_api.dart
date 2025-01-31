import 'package:daalu_pay_super_admin/core/connect_end/model/add_exchange_rate_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_transfer_fees_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_transfer_fees_response_model/create_transfer_fees_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/disable_currency_response_model/disable_currency_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/disable_payment_response_model/disable_payment_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_currencies_response_model/get_currencies_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_exchange_rates/get_exchange_rates.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_transfer_fees_model_response/get_transfer_fees_model_response.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/suspend_admin_response_model/suspend_admin_response_model.dart';
import 'package:injectable/injectable.dart';
import '../connect_end/model/create_admin_response_model/create_admin_response_model.dart';
import '../connect_end/model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../connect_end/model/get_all_user_response_model/get_all_user_response_model.dart';
import '../connect_end/model/get_payment_method/get_payment_method.dart';
import '../connect_end/model/get_users_receipt_response_model/get_users_receipt_response_model.dart';
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

  Future<GetAdminUserResponseModel> getSuperAdminUser({String? page}) async {
    try {
      final response = await _service
          .call(UrlConfig.admins, RequestMethod.get, data: {"page": page});
      logger.d(response.data);
      return GetAdminUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<CreateAdminResponseModel> createAdminUser(
      CreateAdminEntityModel createAdminEntity) async {
    try {
      final response = await _service.call(UrlConfig.admins, RequestMethod.post,
          data: createAdminEntity.toJson());
      logger.d(response.data);
      return CreateAdminResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetCurrenciesResponseModel> getCurrencies() async {
    try {
      final response =
          await _service.call(UrlConfig.currencies, RequestMethod.get);
      logger.d(response.data);
      return GetCurrenciesResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<DisableCurrencyResponseModel> enableCurrencies(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.currencies}/$id/enable', RequestMethod.post);
      logger.d(response.data);
      return DisableCurrencyResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<DisableCurrencyResponseModel> disableCurrencies(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.currencies}/$id/disable', RequestMethod.post);
      logger.d(response.data);
      return DisableCurrencyResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetExchangeRates> getExchangeRate() async {
    try {
      final response =
          await _service.call(UrlConfig.exchange_rates, RequestMethod.get);
      logger.d(response.data);
      return GetExchangeRates.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addExchangeRate(
      AddExchangeRateEntityModel addExchangeEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.exchange_rates, RequestMethod.post,
          data: addExchangeEntity.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateExchangeRate(
      AddExchangeRateEntityModel addExchangeEntity, String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.exchange_rates}/$id', RequestMethod.post,
          data: addExchangeEntity.toJson());
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteExchangeRate(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.exchange_rates}/$id', RequestMethod.delete);
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<DisablePaymentResponseModel> disablePayment(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.disable_payment}/$id/disable', RequestMethod.post);
      logger.d(response.data);
      return DisablePaymentResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<DisablePaymentResponseModel> enablePayment(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.disable_payment}/$id/enable', RequestMethod.post);
      logger.d(response.data);
      return DisablePaymentResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPaymentMethod> getPayment() async {
    try {
      final response =
          await _service.call(UrlConfig.disable_payment, RequestMethod.get);
      logger.d(response.data);
      return GetPaymentMethod.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SuspendAdminResponseModel> suspendAdmin(
      {String? id, String? reason}) async {
    try {
      final response = await _service.call(
          '${UrlConfig.admins}/$id/suspend', RequestMethod.post,
          data: {'reason': reason});
      logger.d(response.data);
      return SuspendAdminResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SuspendAdminResponseModel> unsuspendAdmin(
      {String? id, String? reason}) async {
    try {
      final response = await _service.call(
          '${UrlConfig.admins}/$id/unsuspend', RequestMethod.post,
          data: {'reason': reason});
      logger.d(response.data);
      return SuspendAdminResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteAdmin(String id) async {
    try {
      final response = await _service.call(
          '${UrlConfig.admins}/$id/delete', RequestMethod.post);
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllUserResponseModel> allUsers() async {
    try {
      final response = await _service.call(UrlConfig.users, RequestMethod.get);
      logger.d(response.data);
      return GetAllUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAdminTransactionsResponseModel> adminTransactions() async {
    try {
      final response =
          await _service.call(UrlConfig.transactions, RequestMethod.get);
      logger.d('response.data${response.data}');
      return GetAdminTransactionsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> approveUser(String? id) async {
    try {
      final response = await _service.call(
          'admin/users/$id/approve', RequestMethod.post,
          data: {"status": "approved"});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> denyUser(
    String? id,
  ) async {
    try {
      final response = await _service.call(
          'admin/users/$id/deny', RequestMethod.post,
          data: {"status": "rejected"});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> suspendUser({String? id, String? text}) async {
    try {
      final response = await _service.call(
          'admin/users/$id/suspend', RequestMethod.post,
          data: {"reason": text});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> unsuspendUser({String? id, String? text}) async {
    try {
      final response = await _service.call(
          'admin/users/$id/unsuspend', RequestMethod.post,
          data: {"reason": text});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> delete(
    String? id,
  ) async {
    try {
      final response = await _service.call(
        'admin/users/$id/delete',
        RequestMethod.post,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> approveTransactions(String? id) async {
    try {
      final response = await _service.call(
          'admin/transactions/$id/approve', RequestMethod.post);
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> denyTransactions({String? id, String? text}) async {
    try {
      final response = await _service.call(
          'admin/transactions/$id/deny', RequestMethod.post,
          data: {"reason": text});
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<GetTransferFeesModelResponse> getAllTransferFees() async {
    try {
      final response = await _service.call(
        UrlConfig.transfer_fees,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetTransferFeesModelResponse.fromJson(response.data);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<CreateTransferFeesResponseModel> createTransferFees(
      CreateTransferFeesEntityModel createTransaferEntity) async {
    try {
      final response = await _service.call(
          UrlConfig.transfer_fees, RequestMethod.put,
          data: createTransaferEntity.toJson());
      logger.d(response.data);
      return CreateTransferFeesResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<GetUsersReceiptResponseModel> getUsersReceipts() async {
    try {
      final response = await _service.call('admin/receipts', RequestMethod.get);
      logger.d(response.data);
      return GetUsersReceiptResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> approveReceipts(String? id) async {
    try {
      final response =
          await _service.call('admin/receipts/$id/approve', RequestMethod.post);
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  Future<dynamic> denyReceipts(String? id) async {
    try {
      final response = await _service.call(
        'admin/receipts/$id/deny',
        RequestMethod.post,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }
}

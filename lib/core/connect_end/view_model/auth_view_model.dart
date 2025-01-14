import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../repo/repo_impl.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  // final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  LoginResponseModel? _loginResponse;
  LoginResponseModel? get loginResponse => _loginResponse;
  GetAdminUserResponseModel? _adminUserResponseModel;
  GetAdminUserResponseModel? get adminUserResponseModel =>
      _adminUserResponseModel;
  GetStatistisResponseModell? _getStatistisResponseModell;
  GetStatistisResponseModell? get getStatistisResponseModell =>
      _getStatistisResponseModell;

  // login flow so api call for method can be called here

  Future<void> loginUser(LoginEntityModel loginEntity, contxt) async {
    try {
      _isLoading = true;
      _loginResponse = await runBusyFuture(repositoryImply.login(loginEntity),
          throwException: true);

      if (_loginResponse?.status == 'success') {
        _isLoading = false;
        await AppUtils.snackbar(contxt,
            message: _loginResponse?.message!.toString());
        navigate.navigateTo(Routes.superAdminDashboard);
      }
    } catch (e) {
      _isLoading = false;
      // logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> superAdminStats(contxt) async {
    try {
      _isLoading = true;
      _getStatistisResponseModell = await runBusyFuture(
          repositoryImply.superAdminStats(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> superAdminUsers(contxt) async {
    try {
      _isLoading = true;
      _adminUserResponseModel = await runBusyFuture(
          repositoryImply.superAdminUsers(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}

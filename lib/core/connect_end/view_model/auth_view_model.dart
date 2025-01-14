import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../model/login_response_model/login_response_model.dart';
import '../repo/repo_impl.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  // final logger = getLogger('AuthViewModel');

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

  // login flow so api call for method can be called here

  // Future<void> loginUser(LoginEntityModel loginEntity, contxt) async {
  //   try {
  //     _isLoading = true;
  //     _loginResponse = await runBusyFuture(repositoryImply.login(loginEntity),
  //         throwException: true);

  //     if (_loginResponse?.status == 'success') {
  //       _isLoading = false;
  //       await AppUtils.snackbar(contxt,
  //           message: _loginResponse?.message!.toString());
  //       // navigate.navigateTo(Routes.adminDashboard);
  //     }
  //   } catch (e) {
  //     _isLoading = false;
  //     // logger.d(e);
  //     AppUtils.snackbar(contxt, message: e.toString(), error: true);
  //   }
  //   notifyListeners();
  // }
}

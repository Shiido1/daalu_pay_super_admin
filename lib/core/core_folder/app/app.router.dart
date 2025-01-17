// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daalu_pay_super_admin/ui/screen/create_account_screen.dart'
    as _i4;
import 'package:daalu_pay_super_admin/ui/screen/onboarding/onboarding_screen.dart'
    as _i2;
import 'package:daalu_pay_super_admin/ui/screen/super_admin_dashboard/payment_method_screen.dart'
    as _i5;
import 'package:daalu_pay_super_admin/ui/screen/super_admin_dashboard/super_admin_dashboard.dart'
    as _i3;
import 'package:daalu_pay_super_admin/ui/screen/super_admin_dashboard/transactions/super_admin_transaction_screen.dart'
    as _i6;
import 'package:daalu_pay_super_admin/ui/screen/super_admin_dashboard/transfer_fee_screen.dart'
    as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const onboardingScreen = '/';

  static const superAdminDashboard = '/super-admin-dashboard';

  static const createAccountScreen = '/create-account-screen';

  static const superAdminPaymentMethodScreen =
      '/super-admin-payment-method-screen';

  static const superAdminTransactionScreen = '/super-admin-transaction-screen';

  static const transferFeeScreen = '/transfer-fee-screen';

  static const all = <String>{
    onboardingScreen,
    superAdminDashboard,
    createAccountScreen,
    superAdminPaymentMethodScreen,
    superAdminTransactionScreen,
    transferFeeScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.onboardingScreen,
      page: _i2.OnboardingScreen,
    ),
    _i1.RouteDef(
      Routes.superAdminDashboard,
      page: _i3.SuperAdminDashboard,
    ),
    _i1.RouteDef(
      Routes.createAccountScreen,
      page: _i4.CreateAccountScreen,
    ),
    _i1.RouteDef(
      Routes.superAdminPaymentMethodScreen,
      page: _i5.SuperAdminPaymentMethodScreen,
    ),
    _i1.RouteDef(
      Routes.superAdminTransactionScreen,
      page: _i6.SuperAdminTransactionScreen,
    ),
    _i1.RouteDef(
      Routes.transferFeeScreen,
      page: _i7.TransferFeeScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingScreen: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.OnboardingScreen(),
        settings: data,
      );
    },
    _i3.SuperAdminDashboard: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SuperAdminDashboard(),
        settings: data,
      );
    },
    _i4.CreateAccountScreen: (data) {
      final args = data.getArgs<CreateAccountScreenArguments>(
        orElse: () => const CreateAccountScreenArguments(),
      );
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.CreateAccountScreen(key: args.key),
        settings: data,
      );
    },
    _i5.SuperAdminPaymentMethodScreen: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SuperAdminPaymentMethodScreen(),
        settings: data,
      );
    },
    _i6.SuperAdminTransactionScreen: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SuperAdminTransactionScreen(),
        settings: data,
      );
    },
    _i7.TransferFeeScreen: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.TransferFeeScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CreateAccountScreenArguments {
  const CreateAccountScreenArguments({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CreateAccountScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToOnboardingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuperAdminDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.superAdminDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountScreen({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createAccountScreen,
        arguments: CreateAccountScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuperAdminPaymentMethodScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.superAdminPaymentMethodScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuperAdminTransactionScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.superAdminTransactionScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransferFeeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.transferFeeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuperAdminDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.superAdminDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateAccountScreen({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createAccountScreen,
        arguments: CreateAccountScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuperAdminPaymentMethodScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.superAdminPaymentMethodScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuperAdminTransactionScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.superAdminTransactionScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransferFeeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.transferFeeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

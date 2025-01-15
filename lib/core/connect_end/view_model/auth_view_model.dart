import "package:collection/collection.dart";
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_currencies_response_model/get_currencies_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_exchange_rates/get_exchange_rates.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:daalu_pay_super_admin/ui/app_assets/country_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_image.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/contant.dart';
import '../../../ui/screen/widget/text_form_widget.dart';
import '../../../ui/screen/widget/text_widget.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../model/get_currencies_response_model/datum.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../repo/repo_impl.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/datum.dart'
    as d;

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
  List<d.Datum> get adminUserResponseListModel => _adminUserResponseListModel;
  List<d.Datum> _adminUserResponseListModel = [];
  List<d.Datum> _adminUserResponseListCopyModel = [];
  List<d.Datum> userGroupList = [];

  GetCurrenciesResponseModel? _currenciesResponseModel;
  GetCurrenciesResponseModel? get currenciesResponseModel =>
      _currenciesResponseModel;
  GetExchangeRates? get getExchangeRates => _getExchangeRates;
  GetExchangeRates? _getExchangeRates;

  TextEditingController controller = TextEditingController();

  String userStats = 'all';
  String query = '';

  int page = 1;
  bool isLoadNoMore = false;

  paddWing({child}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: child,
      );

  usergroupStatus() {
    var groupedValue;

    groupedValue = groupBy(_adminUserResponseListModel, (obj) => obj.status);
    userGroupList.clear();
    if (userStats == 'active') {
      if (groupedValue['active'] != null) {
        userGroupList.addAll(groupedValue['active']);
      } else {
        userGroupList.clear();
      }
    } else if (userStats == 'suspended') {
      if (groupedValue['suspended'] != null) {
        userGroupList.addAll(groupedValue['suspended']);
      } else {
        userGroupList.clear();
      }
    } else if (userStats == 'band') {
      if (groupedValue['band'] != null) {
        userGroupList.addAll(groupedValue['band']);
      } else {
        userGroupList.clear();
      }
    } else if (userStats == 'unverified') {
      if (groupedValue['unverified'] != null) {
        userGroupList.addAll(groupedValue['unverified']);
      } else {
        userGroupList.clear();
      }
    } else {
      userGroupList.clear();
    }
    notifyListeners();
  }

  Future openDialog({required BuildContext context, required d.Datum data}) =>
      showDialog(
        context: context,
        builder: (context) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 100.w),
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          child: Scaffold(
            backgroundColor: AppColor.transparent,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 33.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paddedWing(
                    value: 20,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.navyBlueGrey),
                      child: TextView(
                        text: getInitials('${data.firstName} ${data.lastName}'),
                        fontSize: 16.4.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: '${data.status}'.capitalize(),
                      fontSize: 14.4.sp,
                      color: AppColor.deeperGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: 'Last Active - 2 secs ago',
                      fontSize: 14.4.sp,
                      color: AppColor.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: '${data.firstName} ${data.lastName}',
                      fontSize: 15.4.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: '${data.email}'.toLowerCase(),
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: 'ID-: ${data.id}'.toUpperCase(),
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 12.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextFormWidget(
                      label: 'Add Notes',
                      hint: null,
                      border: 10,
                      maxline: 4,
                      isFilled: true,
                      fillColor: AppColor.white,
                      alignLabelWithHint: true,
                      controller: controller,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          // onTap: () => approveUser(context, id: data.id),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.w, horizontal: 22.w),
                            decoration: BoxDecoration(
                                color: AppColor.green.withOpacity(.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.flag,
                                  color: AppColor.green,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Approve',
                                  fontSize: 14.sp,
                                  color: AppColor.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          // onTap: () => denyUser(context, id: data.id),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.w, horizontal: 22.w),
                            decoration: BoxDecoration(
                                color: AppColor.red.withOpacity(.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.pause_circle_outline,
                                  color: AppColor.red,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Reject',
                                  fontSize: 14.sp,
                                  color: AppColor.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

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

  Future<void> getCurrencies(context) async {
    try {
      _isLoading = true;
      _currenciesResponseModel = await runBusyFuture(
          repositoryImply.getCurrencies(),
          throwException: true);
      _isLoading = false;
      getProperCurrencies();
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Set<String> seenCodes = {};
  List<Datum> filteredData = [];

  getProperCurrencies() {
    // Filter the list to include only one entry per `code`
    filteredData = _currenciesResponseModel!.data!.where((item) {
      if (seenCodes.contains(item.code)) {
        return false;
      } else {
        seenCodes.add(item.code!);
        return true;
      }
    }).toList();
  }

  String getFlagIcon(Datum d) {
    String flag = '';
    // ignore: unnecessary_null_comparison
    if (d != null) {
      for (int i = 0; i < countryConst.length; i++) {
        if (d.code == countryConst[i]['code']) {
          flag = countryConst[i]['flag']!;
        }
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
    return flag;
  }

  currencyManWidget(Datum d) => Column(
        children: [
          paddWing(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        getFlagIcon(d) == ''
                            ? SizedBox(
                                width: 20.w,
                              )
                            : SvgPicture.asset(
                                getFlagIcon(d),
                                height: 26.0.h,
                              ),
                        SizedBox(
                          width: 6.w,
                        ),
                        SizedBox(
                          width: 60.w,
                          child: TextView(
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            text: d.name ?? '',
                            color: AppColor.greyKind,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                TextView(
                  text: d.code ?? '',
                  color: AppColor.greyKind,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                  decoration: BoxDecoration(
                      color: d.status == 'enabled'
                          ? AppColor.green.withOpacity(.17)
                          : AppColor.grey.withOpacity(.17),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextView(
                    text: d.status ?? '',
                    fontSize: d.status == 'enabled' ? 12.4.sp : 11.4.sp,
                    color: d.status == 'enabled'
                        ? AppColor.deeperGreen
                        : AppColor.grey,
                    fontWeight: d.status == 'enabled'
                        ? FontWeight.w600
                        : FontWeight.w900,
                  ),
                ),
                Switch(
                  value: d.status == 'enabled' ? true : false,
                  onChanged: (v) {
                    if (d.status == 'enabled') {
                      d.status = 'disabled';
                    } else {
                      d.status = 'enabled';
                    }
                    notifyListeners();
                  },
                  activeTrackColor: d.status == 'enabled'
                      ? AppColor.deeperGreen
                      : AppColor.inGrey,
                  activeColor:
                      d.status == 'enabled' ? Colors.white : AppColor.inGrey,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColor.grey,
            thickness: .4.sp,
          )
        ],
      );

  Future<void> getExchanges(context) async {
    try {
      _isLoading = true;
      _getExchangeRates = await runBusyFuture(repositoryImply.getExchangeRate(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> superAdminUsers(contxt) async {
    try {
      _isLoading = true;
      _adminUserResponseModel = await runBusyFuture(
          repositoryImply.superAdminUsers(page: page.toString()),
          throwException: true);
      _adminUserResponseListModel = _adminUserResponseModel!.data!.data!;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    notifyListeners();
  }

  Future<void> onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (_adminUserResponseModel!.data!.data!.length <
        _adminUserResponseModel!.data!.total!) {
      page++;
      try {
        _adminUserResponseModel = await runBusyFuture(
            repositoryImply.superAdminUsers(page: page.toString()));
        _adminUserResponseListCopyModel
            .addAll(_adminUserResponseModel!.data!.data!);
        _adminUserResponseListModel.addAll(_adminUserResponseListCopyModel);
        _adminUserResponseListCopyModel.clear();
      } catch (e) {
        rethrow;
      }
    } else {
      isLoadNoMore = true;
      null;
    }
    notifyListeners();
  }
}

import "package:collection/collection.dart";
import 'package:daalu_pay_super_admin/core/connect_end/model/add_exchange_rate_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_response_model/create_admin_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_currencies_response_model/get_currencies_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_exchange_rates/get_exchange_rates.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/suspend_admin_response_model/suspend_admin_response_model.dart';
import 'package:daalu_pay_super_admin/ui/app_assets/country_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_image.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/contant.dart';
import '../../../ui/screen/widget/button_widget.dart';
import '../../../ui/screen/widget/text_form_widget.dart';
import '../../../ui/screen/widget/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../model/disable_currency_response_model/disable_currency_response_model.dart';
import '../model/get_currencies_response_model/datum.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../repo/repo_impl.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/datum.dart'
    as d;
import '../model/get_exchange_rates/datum.dart' as ex;

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  // final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  GlobalKey<FormState> susFormkey = GlobalKey<FormState>();

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
  TextEditingController deleteController = TextEditingController();

  GetCurrenciesResponseModel? _currenciesResponseModel;
  GetCurrenciesResponseModel? get currenciesResponseModel =>
      _currenciesResponseModel;
  GetExchangeRates? get getExchangeRates => _getExchangeRates;
  GetExchangeRates? _getExchangeRates;
  CreateAdminResponseModel? get createAdminResponseModel =>
      _createAdminResponseModel;
  CreateAdminResponseModel? _createAdminResponseModel;
  SuspendAdminResponseModel? get suspendAdminResponse =>
      _suspendAdminResponseModel;
  SuspendAdminResponseModel? _suspendAdminResponseModel;
  DisableCurrencyResponseModel? _disableCurrencyResponseModel;
  DisableCurrencyResponseModel? get disableCurrencyResponseModel =>
      _disableCurrencyResponseModel;

  TextEditingController controller = TextEditingController();
  TextEditingController rateController = TextEditingController();

  String userStats = 'all';
  String query = '';
  String queryCurrency = '';

  String qFromCur = '';
  String qToCur = '';

  Set<String> seenCodes = {};
  List<Datum> filteredData = [];

  int page = 1;
  bool isLoadNoMore = false;

  String? gender;
  String? role;

  TextEditingController genderController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  TextEditingController reasonController = TextEditingController();
  TextEditingController fromCurrencyController = TextEditingController();
  TextEditingController toCurrencyController = TextEditingController();

  DateTime selectedDOB = DateTime.now();

  String? _formattedDob = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());
  paddWingEx({child}) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
        child: child,
      );

  exchangeConWidget(context, ex.Datum e) => Column(
        children: [
          paddWingEx(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: e.fromCurrency ?? '',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: '-',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: e.toCurrency ?? '',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    TextView(
                      text: DateFormat('yyyy-MM-dd hh:mm a')
                          .format(DateTime.parse(e.createdAt.toString())),
                      color: AppColor.greyKind,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: e.rate ?? '',
                      color: AppColor.greyKind,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    TextView(
                      text: 'Exchange Rate',
                      color: AppColor.greyKind,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => modalBottomExchangeSheet(context: context, d: e),
                  child: SvgPicture.asset(
                    AppImage.pen,
                    color: AppColor.darkGrey,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: AppColor.grey,
            thickness: .4.sp,
          ),
        ],
      );

  void modalBottomDeleteUserSheet(context, {String? id}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 300.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Center(
                                child: TextView(
                                  text: 'Delete Admin',
                                  fontSize: 15.4.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextView(
                                text:
                                    'Kindly provide a reason for deleting this admin.',
                                fontSize: 13.8.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextFormWidget(
                                label: 'Reason',
                                alignLabelWithHint: true,
                                border: 10,
                                isFilled: true,
                                maxline: 3,
                                fillColor: AppColor.white,
                                controller: deleteController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                                value: 20.w,
                                child: ButtonWidget(
                                    buttonText: 'Delete Admin',
                                    color: AppColor.white,
                                    border: 8,
                                    isLoading: isLoading,
                                    buttonColor: AppColor.red,
                                    buttonBorderColor: Colors.transparent,
                                    onPressed: () =>
                                        deleteAdmin(context, id: id)))
                          ],
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomSuspendAndUnsuspendSheet(
      {context, String? id, String? status}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 300.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Form(
                          key: susFormkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: Center(
                                  child: TextView(
                                    text: status?.toLowerCase() == 'active'
                                        ? 'Suspend Admin'
                                        : 'Unsuspend Admin',
                                    fontSize: 15.4.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Divider(
                                color: AppColor.inGrey,
                                thickness: .5.r,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: TextView(
                                  text: status?.toLowerCase() == 'active'
                                      ? 'Kindly provide a reason for suspending this admin.'
                                      : 'Kindly provide a reason for unsuspending this admin.',
                                  fontSize: 13.8.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: TextFormWidget(
                                  label: 'Reason',
                                  alignLabelWithHint: true,
                                  border: 10,
                                  isFilled: true,
                                  maxline: 3,
                                  fillColor: AppColor.white,
                                  controller: reasonController,
                                  validator: AppValidator.validateString(),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: ButtonWidget(
                                    buttonText:
                                        status?.toLowerCase() == 'active'
                                            ? 'Suspend Admin'
                                            : 'Unsuspend Admin',
                                    color: AppColor.white,
                                    border: 8,
                                    isLoading: model.isLoading,
                                    buttonColor: AppColor.red,
                                    buttonBorderColor: Colors.transparent,
                                    onPressed: () {
                                      if (susFormkey.currentState!.validate()) {
                                        status?.toLowerCase() == 'active'
                                            ? suspendAdmin(context,
                                                id: id,
                                                text: reasonController.text)
                                            : unSuspendAdmin(context,
                                                id: id,
                                                text: reasonController.text);
                                        model.notifyListeners();
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomExchangeSheet({context, ex.Datum? d}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {
                if (d != null) {
                  fromCurrencyController.text = d.fromCurrency!;
                  toCurrencyController.text = d.toCurrency!;
                  rateController.text = d.rate!;
                }
              },
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 400.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Center(
                                child: TextView(
                                  text: d == null
                                      ? 'Add Exchange Rate'
                                      : 'Update Exchange Rate',
                                  fontSize: 16.4.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextView(
                                text: d == null
                                    ? 'Kindly select currencies to add exchange rates'
                                    : 'Kindly select currencies to update exchange rates',
                                fontSize: 14.8.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextFormWidget(
                                      label: 'From Currency',
                                      hint: 'Exchange rate from',
                                      border: 10,
                                      isFilled: true,
                                      readOnly: true,
                                      fillColor: AppColor.white,
                                      controller: fromCurrencyController,
                                      validator: AppValidator.validateString(),
                                      suffixWidget: IconButton(
                                          onPressed: () =>
                                              shwFromCurrencyDialog(context),
                                          icon: const Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: AppColor.black,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  Expanded(
                                    child: TextFormWidget(
                                      label: 'To Currency',
                                      hint: 'Exchange rate to',
                                      border: 10,
                                      isFilled: true,
                                      readOnly: true,
                                      fillColor: AppColor.white,
                                      controller: toCurrencyController,
                                      validator: AppValidator.validateString(),
                                      suffixWidget: IconButton(
                                          onPressed: () => model
                                              .shwToCurrencyDialog(context),
                                          icon: const Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: AppColor.black,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextFormWidget(
                                label: 'Add Rate',
                                alignLabelWithHint: true,
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: rateController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: ButtonWidget(
                                  buttonText: d == null
                                      ? 'Add Exchange Rate'
                                      : 'Update Exchange Rate',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: model.isLoading,
                                  buttonColor: AppColor.red,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () {
                                    if (d == null) {
                                      addExchanges(
                                          context,
                                          AddExchangeRateEntityModel(
                                              fromCurrency:
                                                  fromCurrencyController.text,
                                              toCurrency:
                                                  toCurrencyController.text,
                                              rate: rateController.text));
                                    } else {
                                      updateExchanges(
                                          context,
                                          AddExchangeRateEntityModel(
                                              fromCurrency:
                                                  fromCurrencyController.text,
                                              toCurrency:
                                                  toCurrencyController.text,
                                              rate: rateController.text),
                                          d.id.toString());
                                    }
                                  }),
                            ),
                          ],
                        ),
                      )),
                );
              });
        });
  }

  shwRoleDialog(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextView(
              text: 'Select Role',
              color: AppColor.black,
              textAlign: TextAlign.center,
              fontSize: 19.2.sp,
            ),
            titleTextStyle: const TextStyle(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      roleController.text = 'Processor';
                      role = 'processor';
                      Navigator.of(context).pop();
                      notifyListeners();
                    },
                    child: TextView(
                      text: 'Processor',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Divider(thickness: .3),
                  GestureDetector(
                    onTap: () {
                      roleController.text = 'Blogger';
                      role = 'blogger';
                      Navigator.of(context).pop();
                    },
                    child: TextView(
                      text: 'Blogger',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  shwFromCurrencyDialog(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              builder: (_, AuthViewModel model, __) {
                return AlertDialog(
                  title: TextView(
                    text: 'Select Currency',
                    color: AppColor.black,
                    textAlign: TextAlign.center,
                    fontSize: 19.2.sp,
                  ),
                  titleTextStyle: const TextStyle(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextFormWidget(
                          label: 'Search',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          onChange: (p0) {
                            qFromCur = p0;
                            model.notifyListeners();
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        qFromCur != ''
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...countryConst
                                        .where((o) => o['code']!
                                            .toLowerCase()
                                            .contains(qFromCur.toLowerCase()))
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              fromCurrencyController.text =
                                                  e['code']!;
                                              Navigator.of(context).pop();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(4.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text: e['code'] ?? '',
                                                    color: AppColor.black,
                                                    fontSize: 16.2.sp,
                                                  ),
                                                  Divider(
                                                      color: AppColor.greyNice,
                                                      thickness: .3.sp)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...countryConst.map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          fromCurrencyController.text =
                                              e['code']!;
                                          Navigator.of(context).pop();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: e['code'] ?? '',
                                                color: AppColor.black,
                                                fontSize: 16.2.sp,
                                              ),
                                              Divider(
                                                  color: AppColor.greyNice,
                                                  thickness: .3.sp)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                );
              });
        },
      );

  shwToCurrencyDialog(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              builder: (_, AuthViewModel model, __) {
                return AlertDialog(
                  title: TextView(
                    text: 'Select Currency',
                    color: AppColor.black,
                    textAlign: TextAlign.center,
                    fontSize: 19.2.sp,
                  ),
                  titleTextStyle: const TextStyle(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextFormWidget(
                          label: 'Search',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          onChange: (p0) {
                            qToCur = p0;
                            model.notifyListeners();
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        qToCur != ''
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...countryConst
                                        .where((o) => o['code']!
                                            .toLowerCase()
                                            .contains(qToCur.toLowerCase()))
                                        .map(
                                          (e) => GestureDetector(
                                            onTap: () {
                                              toCurrencyController.text =
                                                  e['code']!;
                                              Navigator.of(context).pop();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(4.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextView(
                                                    text: e['code'] ?? '',
                                                    color: AppColor.black,
                                                    fontSize: 16.2.sp,
                                                  ),
                                                  Divider(
                                                      color: AppColor.greyNice,
                                                      thickness: .3.sp)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...countryConst.map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          toCurrencyController.text =
                                              e['code']!;
                                          Navigator.of(context).pop();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(4.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: e['code'] ?? '',
                                                color: AppColor.black,
                                                fontSize: 16.2.sp,
                                              ),
                                              Divider(
                                                  color: AppColor.greyNice,
                                                  thickness: .3.sp)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                );
              });
        },
      );

  Future<void> selectDateOfBirth(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedDOB,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDOB) {
      selectedDOB = picked;
      _formattedDob = DateFormat('dd-MM-yyyy').format(selectedDOB);

      dobController.text = _formattedDob!;
      notifyListeners();
    }
  }

  shwGenderDialog(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextView(
              text: 'Gender',
              color: AppColor.black,
              textAlign: TextAlign.center,
              fontSize: 19.2.sp,
            ),
            titleTextStyle: const TextStyle(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      genderController.text = 'Male';
                      gender = 'male';
                      Navigator.of(context).pop();
                      notifyListeners();
                    },
                    child: TextView(
                      text: 'Male',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Divider(thickness: .3),
                  GestureDetector(
                    onTap: () {
                      genderController.text = 'Female';
                      gender = 'female';
                      Navigator.of(context).pop();
                      notifyListeners();
                    },
                    child: TextView(
                      text: 'Female',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
          );
        },
      );

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

  Future<void> enableCurrencies(context, String id) async {
    try {
      _disableCurrencyResponseModel = await runBusyFuture(
          repositoryImply.enableCurrencies(id),
          throwException: true);
    } catch (e) {
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> disableCurrencies(context, String id) async {
    try {
      _disableCurrencyResponseModel = await runBusyFuture(
          repositoryImply.disableCurrencies(id),
          throwException: true);
    } catch (e) {
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

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
                            text: d.name?.capitalize() ?? '',
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
                    text: d.status?.capitalize() ?? '',
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
                      disableCurrencies(context, d.id.toString());
                    } else {
                      d.status = 'enabled';
                      enableCurrencies(context, d.id.toString());
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

  Future<void> addExchanges(
      context, AddExchangeRateEntityModel addExchangeRates) async {
    try {
      _isLoading = true;
      await runBusyFuture(repositoryImply.addExchangeRate(addExchangeRates),
          throwException: true);
      getExchanges(context);
      fromCurrencyController.text = '';
      toCurrencyController.text = '';
      rateController.text = '';
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateExchanges(
      context, AddExchangeRateEntityModel addExchangeRates, String id) async {
    try {
      _isLoading = true;
      await runBusyFuture(
          repositoryImply.updateExchangeRate(addExchangeRates, id),
          throwException: true);
      getExchanges(context);

      fromCurrencyController.text = '';
      toCurrencyController.text = '';
      rateController.text = '';
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteExchanges(context, String id) async {
    try {
      _isLoading = true;
      await runBusyFuture(repositoryImply.deleteExchangeRate(id),
          throwException: true);
      getExchanges(context);
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

  Future<void> createAdmin(contxt,
      {CreateAdminEntityModel? createAdmin}) async {
    try {
      _isLoading = true;
      _createAdminResponseModel = await runBusyFuture(
          repositoryImply.createAdminUsers(createAdmin!),
          throwException: true);

      if (_createAdminResponseModel?.status == 'success') {
        _isLoading = false;
        superAdminUsers(contxt);
        AppUtils.snackbar(contxt,
            message: _createAdminResponseModel!.message!.toString());
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> suspendAdmin(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      _suspendAdminResponseModel = await runBusyFuture(
          repositoryImply.suspendAdmin(id: id, reason: text),
          throwException: true);
      reasonController.text = '';
      _isLoading = false;
      superAdminUsers(contxt);
      AppUtils.snackbar(contxt,
          message: _suspendAdminResponseModel?.message ?? '');
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> unSuspendAdmin(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      _suspendAdminResponseModel = await runBusyFuture(
          repositoryImply.unsuspendAdmin(id: id, reason: text),
          throwException: true);
      _isLoading = false;
      superAdminUsers(contxt);
      AppUtils.snackbar(
        contxt,
        message: _suspendAdminResponseModel?.message ?? '',
      );

      reasonController.text = '';
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteAdmin(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.deleteAdmin(id),
          throwException: true);
      logger.d(res);

      AppUtils.snackbar(contxt, message: res['message'].toString());
      superAdminUsers(contxt);
      deleteController.text = '';
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}

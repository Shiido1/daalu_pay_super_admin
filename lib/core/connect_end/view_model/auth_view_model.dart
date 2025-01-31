import "package:collection/collection.dart";
import 'package:daalu_pay_super_admin/core/connect_end/model/add_exchange_rate_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_response_model/create_admin_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_transfer_fees_entity_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/create_transfer_fees_response_model/create_transfer_fees_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/disable_payment_response_model/disable_payment_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/get_admin_user_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_currencies_response_model/get_currencies_response_model.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_exchange_rates/get_exchange_rates.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_statistis_response_modell/get_statistis_response_modell.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_transfer_fees_model_response/get_transfer_fees_model_response.dart';
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
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/get_admin_transactions_response_model/datum.dart' as ts;
import '../model/get_all_user_response_model/get_all_user_response_model.dart';
import '../model/get_currencies_response_model/datum.dart';
import '../model/get_payment_method/get_payment_method.dart';
import '../model/get_users_receipt_response_model/get_users_receipt_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../repo/repo_impl.dart';
import 'package:daalu_pay_super_admin/core/connect_end/model/get_admin_user_response_model/datum.dart'
    as d;
import '../model/get_exchange_rates/datum.dart' as ex;
import '../model/get_all_user_response_model/datum.dart' as user;

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  // final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  GlobalKey<FormState> susFormkey = GlobalKey<FormState>();

  bool get isLoading => _isLoading;
  bool _isLoading = false;
  bool get isLoadingTr => _isLoadingTr;
  bool _isLoadingTr = false;

  bool get isLoadingReceipts => _isLoadingReceipts;
  bool _isLoadingReceipts = false;

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
  List<ts.Datum>? pendingTransactons = [];
  DisablePaymentResponseModel? _disablePaymentResponseModel;
  DisablePaymentResponseModel? get disablePaymentResponseModel =>
      _disablePaymentResponseModel;

  TextEditingController controller = TextEditingController();
  TextEditingController rateController = TextEditingController();
  GetAllUserResponseModel? _allUserResponseModel;
  GetAllUserResponseModel? get allUserResponseModel => _allUserResponseModel;

  GetAdminTransactionsResponseModel? _adminTransactionsResponseModel;
  GetAdminTransactionsResponseModel? get adminTransactionsResponseModel =>
      _adminTransactionsResponseModel;

  GetTransferFeesModelResponse? _getTransferFeesModelResponse;
  GetTransferFeesModelResponse? get getTransferFeesModelResponse =>
      _getTransferFeesModelResponse;
  CreateTransferFeesResponseModel? _createTransferFeesResponseModel;
  CreateTransferFeesResponseModel? get createTransferFeesResponseModel =>
      _createTransferFeesResponseModel;

  GetUsersReceiptResponseModel? _getUsersReceiptResponseModel;
  GetUsersReceiptResponseModel? get getUsersReceiptResponseMode =>
      _getUsersReceiptResponseModel;

  String userStats = 'all';
  String userStats1 = 'all';
  String query = '';
  String queryCurrency = '';

  String qFromCur = '';
  String qToCur = '';

  Set<String> seenCodes = {};
  List<Datum> filteredData = [];

  List<user.Datum>? userListData = [];

  int page = 1;
  bool isLoadNoMore = false;

  String? gender;
  String? role;

  TextEditingController genderController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  TextEditingController usernameController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController rejectController = TextEditingController();
  TextEditingController fromCurrencyController = TextEditingController();
  TextEditingController toCurrencyController = TextEditingController();

  GetPaymentMethod? get getPaymentMethod => _getPaymentMethod;
  GetPaymentMethod? _getPaymentMethod;
  DateTime selectedDOB = DateTime.now();

  String? _formattedDob = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());
  paddWingEx({child}) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
        child: child,
      );

  void modalBottomDeleteExchangeSheet({context, String? id}) {
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
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Center(
                                child: TextView(
                                  text: 'Delete Exchange Rate',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: TextView(
                                text:
                                    'Are you sure you want to delete this exchange rate?',
                                fontSize: 12.8.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: ButtonWidget(
                                  buttonText: 'Delete Rate',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: isLoading,
                                  buttonColor: AppColor.red,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () =>
                                      deleteExchanges(context, id!)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColor.yellow,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  TextView(
                                    text:
                                        'This action will credit the user’s wallet',
                                    fontSize: 14.2.sp,
                                    color: AppColor.yellow,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        });
  }

  exchangeConWidget(context, ex.Datum e) => Column(
        children: [
          paddWingEx(
            child: GestureDetector(
              onLongPress: () => modalBottomDeleteExchangeSheet(
                  context: context, id: e.id.toString()),
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
                    onTap: () =>
                        modalBottomExchangeSheet(context: context, d: e),
                    child: SvgPicture.asset(
                      AppImage.pen,
                      color: AppColor.darkGrey,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: AppColor.grey,
            thickness: .4.sp,
          ),
        ],
      );

  void modalBottomDeleteAdminSheet(context, {String? id}) {
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

  Future openUserDialog(
          {required BuildContext context, required user.Datum data}) =>
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
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: 'file-: ${data.kyc?.documentImage}'.capitalize(),
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  // paddedWing(
                  //   value: 20,
                  //   child: TextView(
                  //     text: 'Recent Transactions',
                  //     fontSize: 15.4.sp,
                  //     color: AppColor.black,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 4.2.h,
                  // ),
                  // Divider(
                  //   color: AppColor.grey,
                  //   thickness: .3.sp,
                  // ),
                  // SizedBox(
                  //   height: 4.2.h,
                  // ),
                  // paddedWing(
                  //   value: 20,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       TextView(
                  //         text: 'Txn ID',
                  //         fontSize: 14.sp,
                  //         color: AppColor.black,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //       TextView(
                  //         text: 'Amount',
                  //         fontSize: 14.sp,
                  //         color: AppColor.black,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //       TextView(
                  //         text: 'Status',
                  //         fontSize: 14.sp,
                  //         color: AppColor.black,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //       TextView(
                  //         text: 'Date',
                  //         fontSize: 14.sp,
                  //         color: AppColor.black,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 4.2.h,
                  // ),
                  // contRecentTranWidget(),
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
                          onTap: () => approveUser(context, id: data.id),
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
                          onTap: () => denyUser(context, id: data.id),
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

  Future<void> paymentMethod(context) async {
    try {
      _isLoading = true;
      _getPaymentMethod = await runBusyFuture(
          repositoryImply.getPaymentMethod(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> enablePaymentMethod(context, String id) async {
    try {
      _disablePaymentResponseModel = await runBusyFuture(
          repositoryImply.enablePayment(id),
          throwException: true);
      paymentMethod(context);
    } catch (e) {
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> disablePaymentMethod(context, String id) async {
    try {
      _disablePaymentResponseModel = await runBusyFuture(
          repositoryImply.disablePayment(id),
          throwException: true);
      paymentMethod(context);
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
  // get all users flow api

  Future<void> getAllUser(contxt) async {
    try {
      _isLoading = true;
      _allUserResponseModel = await runBusyFuture(repositoryImply.getAllUsers(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAdminTransactions(contxt) async {
    var groupValue;
    pendingTransactons?.clear();
    try {
      _isLoading = true;
      _adminTransactionsResponseModel = await runBusyFuture(
          repositoryImply.getTransactions(),
          throwException: true);
      groupValue =
          groupBy(_adminTransactionsResponseModel!.data!, (obj) => obj.status);
      if (groupValue['pending'] != null) {
        pendingTransactons?.addAll(groupValue['pending']);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void modalBottomApproveSheet({context, String? id}) {
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
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Center(
                                child: TextView(
                                  text: 'Accept Transaction',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: TextView(
                                text:
                                    'Are you sure you want to approve this transaction? The user will receive the funds in their wallet.',
                                fontSize: 12.8.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: ButtonWidget(
                                  buttonText: 'Approve Transaction',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: isLoading,
                                  buttonColor: AppColor.primary,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () =>
                                      approveTransaction(context, id: id)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColor.yellow,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  TextView(
                                    text:
                                        'This action will credit the user’s wallet',
                                    fontSize: 14.2.sp,
                                    color: AppColor.yellow,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomSuspendAndUnsuspendUserSheet(
      {context, String? id, String? status}) {
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
                                        ? 'Suspend User'
                                        : 'Unsuspend User',
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
                                      ? 'Kindly provide a reason for suspending this user.'
                                      : 'Kindly provide a reason for unsuspending this user.',
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
                                            ? 'Suspend User'
                                            : 'Unsuspend User',
                                    color: AppColor.white,
                                    border: 8,
                                    isLoading: isLoading,
                                    buttonColor: AppColor.red,
                                    buttonBorderColor: Colors.transparent,
                                    onPressed: () {
                                      if (susFormkey.currentState!.validate()) {
                                        status?.toLowerCase() == 'active'
                                            ? suspendUser(context,
                                                id: id,
                                                text: reasonController.text)
                                            : unSuspendUser(context,
                                                id: id,
                                                text: reasonController.text);
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
                                  text: 'Delete User',
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
                                    'Kindly provide a reason for deleting this user.',
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
                                  buttonText: 'Delete User',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: isLoading,
                                  buttonColor: AppColor.red,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () => deleteUser(context, id: id)),
                            ),
                          ],
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomRejectSheet({context, String? id}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
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
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Center(
                                child: TextView(
                                  text: 'Reject Transaction',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
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
                                    'Are you sure you want to reject this transaction? The user will be notified.',
                                fontSize: 12.8.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextFormWidget(
                                label:
                                    'Provide a reason for rejection (Option)',
                                alignLabelWithHint: true,
                                isFilled: true,
                                maxline: 5,
                                fillColor: AppColor.white,
                                controller: rejectController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: ButtonWidget(
                                  buttonText: 'Reject Transaction',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: _isLoading,
                                  buttonColor: AppColor.red,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () =>
                                      denyTransaction(context, id: id)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColor.yellow,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  TextView(
                                    text: 'This action connot be undone',
                                    fontSize: 14.2.sp,
                                    color: AppColor.yellow,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        });
  }

  Future<void> approveUser(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.approveUser(id!),
          throwException: true);
      logger.d(res);
      _isLoading = false;

      getAllUser(context);
      AppUtils.snackbar(contxt, message: res['message'].toString());
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> denyUser(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.denyUser(id!),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      rejectController.text = '';

      AppUtils.snackbar(contxt, message: res['message'].toString());
      getAllUser(context);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> suspendUser(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(
          repositoryImply.suspendUser(id: id, text: text),
          throwException: true);
      logger.d(res);
      reasonController.text = '';
      _isLoading = false;
      getAllUser(contxt);

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> unSuspendUser(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(
          repositoryImply.unsuspendUser(id: id, text: text),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      getAllUser(contxt);
      reasonController.text = '';

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteUser(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.delete(id!),
          throwException: true);
      logger.d(res);
      getAllUser(contxt);
      _isLoading = false;

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> approveTransaction(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.approveTransaction(id!),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      getAdminTransactions(contxt);

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> denyTransaction(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      await runBusyFuture(repositoryImply.denyTransaction(id: id, text: text),
          throwException: true);
      _isLoading = false;
      rejectController.text = '';
      getAdminTransactions(contxt);
      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getTransferFees(contxt) async {
    try {
      _isLoading = true;
      _getTransferFeesModelResponse = await runBusyFuture(
          repositoryImply.getTransferFees(),
          throwException: true);
      AppUtils.snackbar(contxt,
          message: _getTransferFeesModelResponse?.message ?? '');
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> createTransferFees(
      contxt, CreateTransferFeesEntityModel createTransferEntity) async {
    try {
      _isLoadingTr = true;
      _createTransferFeesResponseModel = await runBusyFuture(
          repositoryImply.createTransferFees(createTransferEntity),
          throwException: true);
      AppUtils.snackbar(contxt,
          message: _createTransferFeesResponseModel?.message ?? '');
      getTransferFees(contxt);
      _isLoadingTr = false;
    } catch (e) {
      _isLoadingTr = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  usergroupTransationStatus() {
    var groupedValue;

    groupedValue = groupBy(_allUserResponseModel!.data!, (obj) => obj.status);
    userListData!.clear();
    if (userStats == 'active') {
      if (groupedValue['active'] != null) {
        userListData!.addAll(groupedValue['active']);
      } else {
        userListData!.clear();
      }
    } else if (userStats == 'suspended') {
      if (groupedValue['suspended'] != null) {
        userListData!.addAll(groupedValue['suspended']);
      } else {
        userListData!.clear();
      }
    } else if (userStats == 'band') {
      if (groupedValue['band'] != null) {
        userListData!.addAll(groupedValue['band']);
      } else {
        userListData!.clear();
      }
    } else if (userStats == 'unverified') {
      if (groupedValue['unverified'] != null) {
        userListData!.addAll(groupedValue['unverified']);
      } else {
        userListData!.clear();
      }
    } else {
      userListData!.clear();
    }
    notifyListeners();
  }

  Future<void> getUsersReceipt(contxt) async {
    try {
      _isLoading = true;
      _getUsersReceiptResponseModel = await runBusyFuture(
          repositoryImply.getUsersReceipts(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> approveReceipts(contxt, {String? id}) async {
    try {
      _isLoadingReceipts = true;
      var res = await runBusyFuture(repositoryImply.approveReceipts(id!),
          throwException: true);
      if (res['status'] == 'success') {
        AppUtils.snackbar(
          contxt,
          message: 'Users receipts has been approved.',
        );

        getUsersReceipt(contxt);
      }

      _isLoadingReceipts = false;
    } catch (e) {
      _isLoadingReceipts = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> denyReceipts(contxt, {String? id}) async {
    try {
      _isLoadingReceipts = true;
      var v = await runBusyFuture(
          repositoryImply.denyReceipts(
            id,
          ),
          throwException: true);
      if (v['status'] == 'success') {
        AppUtils.snackbar(
          contxt,
          message: 'Users receipts has been denied.',
        );
        getUsersReceipt(contxt);
      }
      _isLoadingReceipts = false;
    } catch (e) {
      _isLoadingReceipts = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}

import 'package:daalu_pay_super_admin/core/core_folder/app/app.router.dart';
import 'package:daalu_pay_super_admin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/contant.dart';
import '../../widget/text_form_widget.dart';
import '../../widget/text_widget.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  bool isTapped = false;
  bool? isSwitched;
  bool? isCurrency = false;
  bool? isCurrencyRate = false;

  paddWing({child}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: child,
      );

  // List currentManagement = [
  //   {
  //     'currency': 'CNY',
  //     'country': 'China',
  //     'flag': AppImage.china,
  //     'status': 'Active',
  //     'status_value': true,
  //   },
  //   {
  //     'currency': 'NGN',
  //     'country': 'Nigeria',
  //     'flag': AppImage.nigeria,
  //     'status': 'Active',
  //     'status_value': true,
  //   },
  //   {
  //     'currency': 'GBP',
  //     'country': 'UK',
  //     'flag': AppImage.uk,
  //     'status': 'Active',
  //     'status_value': true,
  //   },
  //   {
  //     'currency': 'CAD',
  //     'country': 'Canada',
  //     'flag': AppImage.canada,
  //     'status': 'Disabled',
  //     'status_value': false,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await model.superAdminStats(context);
            model.getCurrencies(context);
            model.getExchanges(context);
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 36.0.w,
                        height: 50.h,
                      ),
                      TextView(
                        text: 'Overview',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      PopupMenuButton(
                        onSelected: (value) {
                          // your logic
                        },
                        color: AppColor.white,
                        icon: Icon(
                          Icons.more_vert_rounded,
                          size: 24.sp,
                          color: AppColor.primary,
                        ),
                        itemBuilder: (BuildContext bc) {
                          return [
                            PopupMenuItem(
                              value: '/receipt',
                              onTap: () => navigate
                                  .navigateTo(Routes.viewUsersReceiptScreen),
                              child: TextView(
                                text: 'View Receipts',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ];
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 26.w, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              AppImage.wallet,
                              color: AppColor.grey,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            TextView(
                              text: 'Wallet',
                              fontSize: 16.sp,
                              color: AppColor.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 120.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(14)),
                          child: paddedWing(
                            value: 16.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextView(
                                      text: 'Available Balance',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.white,
                                    ),
                                    TextView(
                                      text: isTapped
                                          ? '${getCurrency()}${oCcy.format(double.parse(model.getStatistisResponseModell?.data?.nairaBalance?.toString() ?? '0'))}'
                                          : '********',
                                      textStyle: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () =>
                                        setState(() => isTapped = !isTapped),
                                    child: SvgPicture.asset(isTapped
                                        ? AppImage.openEye
                                        : AppImage.eye))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () =>
                              navigate.navigateTo(Routes.transferFeeScreen),
                          child: Container(
                            width: 140.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 6.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.inGrey,
                                ),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Row(
                              children: [
                                TextView(
                                  text: 'Transfer Fee',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: SvgPicture.asset(
                                    AppImage.arrowDown,
                                    height: 12.h,
                                    width: 12.w,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 34.w, vertical: 6.w),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(
                        //         color: AppColor.inGrey,
                        //       ),
                        //       borderRadius: BorderRadius.circular(8.r)),
                        //   child: Row(
                        //     children: [
                        //       TextView(
                        //         text: 'Deposit',
                        //         fontSize: 14.sp,
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //       SizedBox(
                        //         width: 16.w,
                        //       ),
                        //       SvgPicture.asset(AppImage.arrowDown)
                        //     ],
                        //   ),
                        // ),
                        //     Container(
                        //       padding: EdgeInsets.symmetric(
                        //           horizontal: 34.w, vertical: 6.w),
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //             color: AppColor.inGrey,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8.r)),
                        //       child: Row(
                        //         children: [
                        //           TextView(
                        //             text: 'Withdraw',
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.w400,
                        //           ),
                        //           SizedBox(
                        //             width: 16.w,
                        //           ),
                        //           SvgPicture.asset(AppImage.arrowUp)
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 6.w, bottom: 10.w, right: 54.w, left: 10.w),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(
                          color: AppColor.inGrey,
                        ),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              '${model.getStatistisResponseModell?.data?.userStats?.active ?? 0}',
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        model.getStatistisResponseModell != null
                            ? TextView(
                                text: model.getStatistisResponseModell!.data!
                                            .userStats!.active! >
                                        1
                                    ? 'Active Users'
                                    : 'Active User',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      overviewTransWidget(
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: AppColor.yellow,
                            size: 32.sp,
                          ),
                          text: TextView(
                            text:
                                '${model.getStatistisResponseModell?.data?.transactionStats?.pending ?? 0}',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          text1: 'Pending Transactions'),
                      SizedBox(
                        width: 10.w,
                      ),
                      overviewTransWidget(
                          icon: Icon(
                            Icons.check_circle_outline,
                            color: AppColor.green,
                            size: 32.sp,
                          ),
                          text: TextView(
                            text:
                                '${model.getStatistisResponseModell?.data?.transactionStats?.approved ?? 0}',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          text1: 'Approved Transactions'),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      overviewTransWidget(
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: AppColor.red,
                            size: 30.sp,
                          ),
                          text: TextView(
                            text:
                                '${model.getStatistisResponseModell?.data?.transactionStats?.rejected ?? 0}',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          text1: 'Rejected Transactions'),
                      SizedBox(
                        width: 10.w,
                      ),
                      overviewTransWidget(
                          icon: Icon(
                            Icons.pause,
                            color: AppColor.grey,
                            size: 30.sp,
                          ),
                          text: TextView(
                            text:
                                '${model.getStatistisResponseModell?.data?.transactionStats?.total ?? 0}',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          text1: 'Total Transactions'),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  model.getStatistisResponseModell != null &&
                          model.getStatistisResponseModell!.data!.swaps!.isEmpty
                      ? const SizedBox.shrink()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Transaction',
                              color: AppColor.greyKind,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            GestureDetector(
                              onTap: () => navigate.navigateTo(
                                  Routes.superAdminTransactionScreen),
                              child: TextView(
                                text: 'View All',
                                color: AppColor.grey,
                                fontSize: 13.2.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 30.h,
                  ),
                  if (model.isLoading ||
                      model.getStatistisResponseModell == null)
                    SpinKitPouringHourGlassRefined(
                      color: AppColor.primary,
                      size: 43.0.sp,
                    )
                  else if (model.getStatistisResponseModell != null &&
                      model.getStatistisResponseModell!.data!.swaps!.isEmpty)
                    Center(
                      child: TextView(
                        text: 'No Transations',
                        fontSize: 20.sp,
                      ),
                    )
                  else if (model.getStatistisResponseModell != null ||
                      model.getStatistisResponseModell!.data!.swaps!.isNotEmpty)
                    ...model.getStatistisResponseModell!.data!.swaps!
                        .getRange(0, 10)
                        .map((o) => Container(
                              padding: EdgeInsets.all(10.w),
                              margin: EdgeInsets.only(bottom: 16.w),
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  border: Border.all(color: AppColor.inGrey),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: 'ID:- ${o.transactionId}',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      TextView(
                                        text: DateFormat('yyyy-MM-dd hh:mm a')
                                            .format(DateTime.parse(
                                                o.createdAt.toString())),
                                        fontSize: 14.sp,
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextView(
                                        text:
                                            '${getAllCurrency(o.fromCurrency)}${oCcy.format(double.parse(o.fromAmount!))} -> ${oCcy.format(double.parse(o.toAmount!))}${getAllCurrency(o.toCurrency)}',
                                        textStyle: TextStyle(
                                          color: o.status == 'approved'
                                              ? AppColor.green
                                              : o.status == 'rejected'
                                                  ? AppColor.red
                                                  : AppColor.yellow,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 6.w),
                                        decoration: BoxDecoration(
                                            color: o.status == 'approved'
                                                ? AppColor.green
                                                    .withOpacity(.17)
                                                : o.status == 'rejected'
                                                    ? AppColor.red
                                                        .withOpacity(.17)
                                                    : AppColor.yellow
                                                        .withOpacity(.17),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: TextView(
                                          text: o.status!.capitalize(),
                                          fontSize: 12.4.sp,
                                          color: o.status == 'approved'
                                              ? AppColor.deeperGreen
                                              : o.status == 'rejected'
                                                  ? AppColor.red
                                                  : AppColor.yellow,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Currency Management',
                        color: AppColor.greyKind,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isCurrency = !isCurrency!;
                            });
                          },
                          icon: Icon(isCurrency == false
                              ? Icons.arrow_drop_down_sharp
                              : Icons.arrow_drop_up_sharp))
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),



                 isCurrency==false?const SizedBox.shrink(): Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.inGrey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        paddWing(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 230.w,
                                child: TextFormWidget(
                                  label: 'Search',
                                  labelColor: AppColor.grey,
                                  hint: null,
                                  border: 10,
                                  borderColor: AppColor.transparent,
                                  isFilled: true,
                                  fillColor: AppColor.inGreyOut,
                                  prefixWidget: Padding(
                                    padding: EdgeInsets.all(12.w),
                                    child: SvgPicture.asset(
                                      AppImage.search,
                                    ),
                                  ),
                                  onChange: (p0) {
                                    model.queryCurrency = p0;
                                    model.notifyListeners();
                                  },
                                  // controller: emailController,
                                  // validator: AppValidator.validateEmail(),
                                ),
                              ),
                              SizedBox(
                                width: 22.w,
                              )
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(
                              //       Icons.add_circle_outline,
                              //       size: 26.sp,
                              //       color: AppColor.grey,
                              //     ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        paddWing(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextView(
                                text: 'Currency',
                                color: AppColor.greyKind,
                                fontSize: 16.sp,
                              ),
                              TextView(
                                text: 'Symbol',
                                color: AppColor.greyKind,
                                fontSize: 16.sp,
                              ),
                              TextView(
                                text: 'Status',
                                color: AppColor.greyKind,
                                fontSize: 16.sp,
                              ),
                              SizedBox(
                                height: 50.h,
                                width: 50.w,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        if (model.filteredData.isEmpty)
                          const SizedBox.shrink()
                        else if (model.filteredData.isNotEmpty)
                          model.queryCurrency != ''
                              ? Column(
                                  children: [
                                    ...model.filteredData
                                        .where((o) => o.name!
                                            .toLowerCase()
                                            .contains(model.queryCurrency
                                                .toLowerCase()))
                                        .map((e) => model.currencyManWidget(e)),
                                  ],
                                )
                              : Column(
                                  children: [
                                    ...model.filteredData
                                        .map((e) => model.currencyManWidget(e)),
                                  ],
                                )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.inGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Exchange rates',
                              color: AppColor.greyKind,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            IconButton(
                                onPressed: () => model.modalBottomExchangeSheet(
                                    context: context),
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  size: 20.sp,
                                  color: AppColor.grey,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.inGrey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (model.getExchangeRates != null)
                                ...model.getExchangeRates!.data!.reversed.map(
                                    (e) => model.exchangeConWidget(context, e))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextView(
                          text:
                              'Last Updated at Tuesday, 3 December 2024 08:12 AM(UTC +01:00)',
                          color: AppColor.primary,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  overviewTransWidget(
          {required Widget icon,
          required Widget text,
          required String text1}) =>
      Expanded(
        child: Container(
          padding:
              EdgeInsets.only(top: 10.w, bottom: 10.w, right: 54.w, left: 10.w),
          decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(
                color: AppColor.inGrey,
              ),
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              SizedBox(
                height: 2.4.w,
              ),
              text,
              SizedBox(
                height: 2.4.w,
              ),
              SizedBox(
                width: 380.w,
                child: TextView(
                  text: text1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 14.sp,
                  maxLines: 2,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      );
}

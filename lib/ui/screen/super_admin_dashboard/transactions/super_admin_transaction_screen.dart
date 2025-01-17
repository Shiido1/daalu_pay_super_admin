import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/contant.dart';
import '../../widget/text_widget.dart';

class SuperAdminTransactionScreen extends StatelessWidget {
  const SuperAdminTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await model.getAdminTransactions(context);
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
                        text: 'Tansactions',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SvgPicture.asset(
                        AppImage.person,
                        color: AppColor.primary,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  if (model.pendingTransactons!.isEmpty)
                    Center(
                      child: TextView(
                        text: 'No Pending Transactions',
                        fontSize: 16.4.sp,
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  else
                    ...model.pendingTransactons!.map(
                      (e) => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.w, horizontal: 16.w),
                        margin: EdgeInsets.only(bottom: 12.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            border: Border.all(color: AppColor.inGrey),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: DateFormat('yyyy-MM-dd hh:mm a').format(
                                  DateTime.parse(e.createdAt.toString())),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.grey,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     // TextView(
                            //     //   text: 'Jane Doe',
                            //     //   fontSize: 14.sp,
                            //     //   fontWeight: FontWeight.w500,
                            //     // ),
                            //     TextView(
                            //       text: DateFormat('yyyy-MM-dd hh:mm a')
                            //                     .format(DateTime.parse(
                            //                         e.createdAt.toString())),
                            //       fontSize: 14.sp,
                            //       fontWeight: FontWeight.w500,
                            //       color: AppColor.grey,
                            //     ),
                            //   ],
                            // ),
                            TextView(
                              text: 'ID- #${e.transactionId}',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextView(
                              text:
                                  '${getAllCurrency(e.fromCurrency)}${oCcy.format(double.parse(e.fromAmount!))} -> ${oCcy.format(double.parse(e.toAmount!))}${getAllCurrency(e.toCurrency)}',
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 6.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.green.withOpacity(.17),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        size: 24.sp,
                                        color: AppColor.deeperGreen,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextView(
                                        text: 'Approved',
                                        fontSize: 12.4.sp,
                                        color: AppColor.deeperGreen,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 6.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.red.withOpacity(.17),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.cancel_outlined,
                                        size: 24.sp,
                                        color: AppColor.red,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextView(
                                        text: 'Reject',
                                        fontSize: 12.4.sp,
                                        color: AppColor.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 6.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.greyKind.withOpacity(.17),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline_rounded,
                                        size: 24.sp,
                                        color: AppColor.greyNice,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextView(
                                        text: 'Hold',
                                        fontSize: 12.4.sp,
                                        color: AppColor.greyNice,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Recent Transactions',
                        color: AppColor.greyKind,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: () => navigate
                            .navigateTo(Routes.superAdminPaymentMethodScreen),
                        child: TextView(
                          text: 'Payment Methods',
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
                  if (model.getStatistisResponseModell == null ||
                      model.isLoading)
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
                    ...model.getStatistisResponseModell!.data!.swaps!.map((o) =>
                        Container(
                          padding: EdgeInsets.all(10.w),
                          margin: EdgeInsets.only(bottom: 16.w),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(color: AppColor.inGrey),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TextView(
                                  //   text: 'Jane Doe',
                                  //   fontSize: 14.sp,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                  TextView(
                                    text: 'ID- #${o.transactionId}',
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
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.grey,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextView(
                                    text:
                                        '${getAllCurrency(o.fromCurrency)}${oCcy.format(double.parse(o.fromAmount!))} -> ${oCcy.format(double.parse(o.toAmount!))}${getAllCurrency(o.toCurrency)}',
                                    color: o.status == 'approved'
                                        ? AppColor.green
                                        : o.status == 'rejected'
                                            ? AppColor.red
                                            : AppColor.yellow,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 6.w),
                                    decoration: BoxDecoration(
                                        color: o.status == 'approved'
                                            ? AppColor.green.withOpacity(.17)
                                            : o.status == 'rejected'
                                                ? AppColor.red.withOpacity(.17)
                                                : AppColor.yellow
                                                    .withOpacity(.17),
                                        borderRadius: BorderRadius.circular(6)),
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
                    height: 30.h,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

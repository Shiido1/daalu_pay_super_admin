import 'package:daalu_pay_super_admin/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../app_assets/app_color.dart';
import '../widget/text_widget.dart';

class SuperAdminPaymentMethodScreen extends StatelessWidget {
  const SuperAdminPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => model.paymentMethod(context));
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: TextView(
                      text: 'Payment Management Method',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  model.getPaymentMethod == null
                      ? SpinKitPouringHourGlassRefined(
                          color: AppColor.primary,
                          size: 43.0.sp,
                        )
                      : model.getPaymentMethod!.data!.isEmpty
                          ? Center(
                              child: TextView(
                                text: 'No Payment Method',
                                fontSize: 20.sp,
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 14.w),
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  border: Border.all(color: AppColor.inGrey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'No',
                                          fontSize: 14.sp,
                                          color: AppColor.navyBlueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        TextView(
                                          text: 'Payment Method',
                                          fontSize: 14.sp,
                                          color: AppColor.navyBlueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        TextView(
                                          text: 'Status',
                                          fontSize: 14.sp,
                                          color: AppColor.navyBlueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          width: 60.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: AppColor.inGrey,
                                    thickness: .3.sp,
                                  ),
                                  Column(
                                    children: [
                                      if (model
                                          .getPaymentMethod!.data!.isNotEmpty)
                                        ...model.getPaymentMethod!.data!
                                            .map((i) => Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 60.w,
                                                          child: TextView(
                                                            text:
                                                                i.id.toString(),
                                                            fontSize: 14.sp,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 134.0.w,
                                                          child: TextView(
                                                            text: i.name
                                                                    ?.capitalize() ??
                                                                '',
                                                            fontSize: 14.sp,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8.w,
                                                                  vertical:
                                                                      5.2.w),
                                                          decoration: BoxDecoration(
                                                              color: i.status ==
                                                                      'enabled'
                                                                  ? AppColor
                                                                      .green
                                                                      .withOpacity(
                                                                          .17)
                                                                  : AppColor.red
                                                                      .withOpacity(
                                                                          .17),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4)),
                                                          child: TextView(
                                                            text: i.status
                                                                    ?.capitalize() ??
                                                                '',
                                                            fontSize: 12.4.sp,
                                                            color: i.status ==
                                                                    'enabled'
                                                                ? AppColor
                                                                    .deeperGreen
                                                                : AppColor.red,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (i.status ==
                                                                'enabled') {
                                                              model.disablePaymentMethod(
                                                                  context,
                                                                  i.id.toString());
                                                            } else {
                                                              model.enablePaymentMethod(
                                                                  context,
                                                                  i.id.toString());
                                                            }
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal:
                                                                    i.status ==
                                                                            'enabled'
                                                                        ? 8.w
                                                                        : 10.w,
                                                                vertical:
                                                                    5.2.w),
                                                            decoration: BoxDecoration(
                                                                color: i.status ==
                                                                        'enabled'
                                                                    ? AppColor
                                                                        .red
                                                                    : AppColor
                                                                        .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4)),
                                                            child: TextView(
                                                              text: i.status ==
                                                                      'enabled'
                                                                  ? 'Disable'
                                                                  : 'Enable',
                                                              fontSize: 12.4.sp,
                                                              color: AppColor
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      color: AppColor.inGrey,
                                                      thickness: .3.sp,
                                                    ),
                                                  ],
                                                ))
                                    ],
                                  )
                                ],
                              ),
                            )
                ],
              ),
            ),
          );
        });
  }

  paddedWing({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      );
}

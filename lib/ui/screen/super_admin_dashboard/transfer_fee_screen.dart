import 'package:daalu_pay_super_admin/core/connect_end/model/create_transfer_fees_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../app_assets/app_color.dart';
import '../../app_assets/app_validatiion.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';
import '../widget/text_widget.dart';

// ignore: must_be_immutable
class TransferFeeScreen extends StatefulWidget {
  const TransferFeeScreen({super.key});

  @override
  State<TransferFeeScreen> createState() => _TransferFeeScreenState();
}

class _TransferFeeScreenState extends State<TransferFeeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController currencyController = TextEditingController(text: 'NGN');
  TextEditingController feeAmountController = TextEditingController();

  @override
  void dispose() {
    currencyController.text = '';
    feeAmountController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          model.getTransferFees(context);
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Transfer Fee',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormWidget(
                      label: 'Currency',
                      hint: 'Select Currency',
                      border: 10,
                      isFilled: true,
                      readOnly: true,
                      fillColor: AppColor.white,
                      controller: currencyController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Transfer Fee',
                      hint: 'Transfer Fee',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: feeAmountController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ButtonWidget(
                      buttonText: 'Transfer Fee',
                      color: !model.isLoading ? AppColor.white : AppColor.grey,
                      border: 8,
                      isLoading: model.isLoading,
                      buttonColor:
                          !model.isLoading ? AppColor.primary : AppColor.inGrey,
                      buttonBorderColor: Colors.transparent,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          model.createTransferFees(
                              context,
                              CreateTransferFeesEntityModel(
                                  currency: currencyController.text,
                                  fee: feeAmountController.text));
                        }
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextView(
                      text: 'All Transfer Fees',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    if (model.isLoading ||
                        model.getTransferFeesModelResponse == null)
                      SpinKitPouringHourGlassRefined(
                        color: AppColor.primary,
                        size: 43.0.sp,
                      )
                    else if (model.getTransferFeesModelResponse!.data!.isEmpty)
                      Center(
                        child: TextView(
                          text: 'All Transfer Fees',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        ),
                      )
                    else if (model.getTransferFeesModelResponse != null &&
                        model.getTransferFeesModelResponse!.data!.isNotEmpty)
                      ...model.getTransferFeesModelResponse!.data!
                          .map((e) => Container(
                                margin: EdgeInsets.all(4.4.w),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: AppColor.inGrey)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: e.currency ?? '',
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black,
                                        ),
                                        TextView(
                                          text: e.fee ?? '',
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.black,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                        thickness: .7.sp,
                                        color: AppColor.inGrey)
                                  ],
                                ),
                              ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

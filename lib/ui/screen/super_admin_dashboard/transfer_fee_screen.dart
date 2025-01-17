import 'package:daalu_pay_super_admin/core/connect_end/model/login_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_assets/app_color.dart';
import '../../app_assets/app_validatiion.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';
import '../widget/text_widget.dart';

// ignore: must_be_immutable
class TransferFeeScreen extends StatefulWidget {
  TransferFeeScreen({super.key});

  @override
  State<TransferFeeScreen> createState() => _TransferFeeScreenState();
}

class _TransferFeeScreenState extends State<TransferFeeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController currencyController = TextEditingController();
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
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {},
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
                      height: 20.h,
                    ),
                    ButtonWidget(
                      buttonText: 'Login',
                      color: AppColor.grey,
                      border: 8,
                      isLoading: model.isLoading,
                      buttonColor: AppColor.inGrey,
                      buttonBorderColor: Colors.transparent,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
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
                  ],
                ),
              ),
            ),
          );
        });
  }
}

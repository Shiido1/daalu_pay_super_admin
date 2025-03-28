import 'package:daalu_pay_super_admin/core/connect_end/model/send_broadcast_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/app/app.locator.dart';
import '../app_assets/app_color.dart';
import '../app_assets/app_validatiion.dart';
import 'widget/button_widget.dart';
import 'widget/text_form_widget.dart';
import 'widget/text_widget.dart';

// ignore: must_be_immutable
class SendBroadcastScreen extends StatefulWidget {
  const SendBroadcastScreen({super.key});

  @override
  State<SendBroadcastScreen> createState() => _SendBroadcastScreenState();
}

class _SendBroadcastScreenState extends State<SendBroadcastScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    titleController.text = '';
    messageController.text = '';
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
                      text: 'Send Message',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextFormWidget(
                      label: 'Title',
                      hint: 'Enter the Title of message',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: titleController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: '',
                      hint: 'Enter message to send broadcast',
                      border: 10,
                      maxline: 7,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: messageController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 240.h,
                    ),
                    ButtonWidget(
                      buttonText: 'Send',
                      color: !model.isLoading ? AppColor.white : AppColor.grey,
                      border: 8,
                      isLoading: model.isLoading,
                      buttonColor:
                          !model.isLoading ? AppColor.primary : AppColor.inGrey,
                      buttonBorderColor: Colors.transparent,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          model.sendBroadCast(
                            context,
                            send: SendBroadcastEntityModel(
                                title: titleController.text.trim(),
                                message: messageController.text.trim()),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:daalu_pay_super_admin/core/connect_end/model/create_admin_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_color.dart';
import '../app_assets/app_image.dart';
import '../app_assets/app_validatiion.dart';
import 'widget/button_widget.dart';
import 'widget/text_form_widget.dart';
import 'widget/text_widget.dart';

// ignore: must_be_immutable
class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  TextEditingController zipCodeController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(vertical: 100.w, horizontal: 24.w),
                child: Form(
                  key: formKeyRegister,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Create Admin Account',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text:
                              'Enter your full name and the email address you’d like to use to create an account.',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'First name',
                          hint: 'First name',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: firstnameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Surname',
                          hint: 'Surname',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: lastnameController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Gender',
                          hint: 'Gender',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          validator: AppValidator.validateString(),
                          controller: model.genderController,
                          suffixWidget: IconButton(
                              onPressed: () => model.shwGenderDialog(context),
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColor.black,
                              )),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Role',
                          hint: 'Select Role',
                          border: 10,
                          isFilled: true,
                          readOnly: true,
                          fillColor: AppColor.white,
                          controller: model.roleController,
                          validator: AppValidator.validateString(),
                          suffixWidget: IconButton(
                              onPressed: () => model.shwRoleDialog(context),
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColor.black,
                              )),
                        ),
                        //     SizedBox(
                        //       width: 20.w,
                        //     ),
                        //     GestureDetector(
                        //       onTap: () => model.getDocumentImage(context),
                        //       child: Container(
                        //         margin: EdgeInsets.only(top: 26.w),
                        //         padding: EdgeInsets.symmetric(
                        //             vertical: 12.w, horizontal: 6.w),
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(6),
                        //             border: Border.all(
                        //                 color: AppColor.inGrey, width: 1.2),
                        //             color: AppColor.white),
                        //         child: TextView(text: 'Select file'),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 5.0.h,
                        // ),
                        // model.filename != null
                        //     ? TextView(
                        //         text: model.filename!,
                        //         fontSize: 12.sp,
                        //         fontStyle: FontStyle.italic,
                        //         color: AppColor.red.withOpacity(.7),
                        //       )
                        //     : SizedBox.shrink(),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Select your date of birth',
                          hint: 'D.O.B',
                          border: 10,
                          isFilled: true,
                          readOnly: true,
                          fillColor: AppColor.white,
                          controller: model.dobController,
                          validator: AppValidator.validateString(),
                          suffixWidget: IconButton(
                              onPressed: () => model.selectDateOfBirth(context),
                              icon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColor.black,
                              )),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Select Country',
                          hint: 'Country',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: countryController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Enter your address',
                          hint: 'Address',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: addressController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Enter your city',
                          hint: 'City',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: cityController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Enter your email address',
                          hint: 'Email address',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: emailController,
                          validator: AppValidator.validateEmail(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Zip Code',
                          hint: 'Enter zip code',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: zipCodeController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextView(
                          text: 'Enter your phone number',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.darkGrey,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0.w, horizontal: 4.w),
                            decoration: BoxDecoration(
                                color: AppColor.inGreyOut,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColor.inGrey)),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.nineja),
                                SizedBox(
                                  width: 2.h,
                                ),
                                TextView(
                                  text: '+234',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.darkGrey,
                                ),
                                SizedBox(
                                  width: 2.h,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 20.sp,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 3.2.w,
                          ),
                          Expanded(
                            child: TextFormWidget(
                              label: '00 00000 000',
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller: phoneController,
                              validator: AppValidator.validateString(),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Enter your password',
                          hint: 'Password',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: passwordController,
                          validator: AppValidator.validateString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormWidget(
                          label: 'Confirm Password',
                          hint: 'Confirm Password',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: confirmPasswordController,
                          validator: AppValidator.confirmValidatePassword(
                              passwordController1: passwordController,
                              passwordController2: confirmPasswordController),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     TextView(
                        //       text: 'Have an account? ',
                        //       fontSize: 16.2.sp,
                        //       fontWeight: FontWeight.w500,
                        //       color: AppColor.darkGrey,
                        //     ),
                        //     GestureDetector(
                        //       onTap: () => navigate.navigateTo(Routes.loginScreen),
                        //       child: TextView(
                        //         text: 'Login here',
                        //         fontSize: 16.2.sp,
                        //         fontWeight: FontWeight.w500,
                        //         color: AppColor.primary,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ButtonWidget(
                            buttonText: 'Continue',
                            color: AppColor.white,
                            border: 8,
                            isLoading: model.isLoading,
                            buttonColor: AppColor.primary,
                            buttonBorderColor: Colors.transparent,
                            onPressed: () {
                              if (formKeyRegister.currentState!.validate()) {
                                model.createAdmin(context,
                                    createAdmin: CreateAdminEntityModel(
                                        firstName:
                                            firstnameController.text.trim(),
                                        lastName:
                                            lastnameController.text.trim(),
                                        gender: model.gender,
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                        phone: phoneController.text.trim(),
                                        address: addressController.text.trim(),
                                        city: cityController.text.trim(),
                                        state: stateController.text.trim(),
                                        zipCode: zipCodeController.text.trim(),
                                        confirmPassword:
                                            confirmPasswordController.text
                                                .trim(),
                                        role: model.role,
                                        country:
                                            countryController.text.trim()));
                              }
                            }),
                      ]),
                ));
          }),
    );
  }
}

import 'package:daalu_pay_super_admin/core/core_folder/app/app.router.dart';
import 'package:daalu_pay_super_admin/main.dart';
import 'package:daalu_pay_super_admin/ui/app_assets/contant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../widget/text_form_widget.dart';
import '../../widget/text_widget.dart';

class SuperAdminUsersScreen extends StatefulWidget {
  const SuperAdminUsersScreen({super.key});

  @override
  State<SuperAdminUsersScreen> createState() => _SuperAdminUsersScreenState();
}

class _SuperAdminUsersScreenState extends State<SuperAdminUsersScreen> {
  RefreshController refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.superAdminUsers(context);
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
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
                        text: 'User Management',
                        fontSize: 22.0.sp,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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
                            model.query = p0;
                            model.notifyListeners();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      PopupMenuButton(
                        onSelected: (value) {
                          // your logic
                        },
                        color: AppColor.white,
                        child: SvgPicture.asset(AppImage.filter),
                        itemBuilder: (BuildContext bc) {
                          return [
                            PopupMenuItem(
                              value: '/all',
                              onTap: () {
                                model.userStats = 'all';
                                model.usergroupStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'All',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/active',
                              onTap: () {
                                model.userStats = 'active';
                                model.usergroupStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Active',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/suspended',
                              onTap: () {
                                model.userStats = 'suspended';
                                model.usergroupStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Suspended',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/band',
                              onTap: () {
                                model.userStats = 'band';
                                model.usergroupStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Band',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/unverified',
                              onTap: () {
                                model.userStats = 'unverified';
                                model.usergroupStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Unverified',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Admin Users',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      IconButton(
                          onPressed: () =>
                              navigate.navigateTo(Routes.createAccountScreen),
                          icon: Icon(
                            Icons.add,
                            size: 26.sp,
                            color: AppColor.black,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 14.w),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Name',
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              TextView(
                                text: 'Email',
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.w),
                                child: TextView(
                                  text: 'Status',
                                  fontSize: 16.4.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: 'Actions',
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.inGrey,
                          thickness: .3.sp,
                        ),
                        SizedBox(
                          height: 430,
                          child: SmartRefresher(
                            key: const PageStorageKey('storage_key_add_sales'),
                            enablePullUp: true,
                            enablePullDown: false,
                            onRefresh: () async {
                              await model.onRefresh();
                              model.superAdminUsers(context);
                              refreshController.refreshCompleted();
                            },
                            onLoading: () async {
                              await model.onLoading();
                              refreshController.loadComplete();
                            },
                            controller: refreshController,
                            footer: CustomFooter(builder: ((context, m) {
                              Widget body;
                              if (model.adminUserResponseModel != null &&
                                  model.adminUserResponseModel!.data!.data!
                                      .isEmpty) {
                                body = TextView(
                                    text: "You're caught up",
                                    color: AppColor.textColor);
                              } else if (m == LoadStatus.idle &&
                                  model.isLoadNoMore == false) {
                                body = TextView(
                                  text: "Pull up load",
                                  color: AppColor.textColor,
                                );
                              } else if (m == LoadStatus.loading) {
                                body = const CupertinoActivityIndicator();
                              } else if (m == LoadStatus.failed) {
                                body = TextView(
                                    text: "Load Failed!Click retry!",
                                    color: AppColor.textColor);
                              } else if (m == LoadStatus.canLoading) {
                                body = TextView(
                                    text: "release to load more",
                                    color: AppColor.textColor);
                              } else {
                                body = TextView(
                                    text: "You're caught up",
                                    color: AppColor.textColor);
                              }
                              return SizedBox(
                                height: 50.0,
                                child: Center(child: body),
                              );
                            })),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  model.query != ''
                                      ? Column(
                                          children: [
                                            if (model.userGroupList.isNotEmpty)
                                              ...model.userGroupList
                                                  .where((o) => o.firstName!
                                                      .toLowerCase()
                                                      .contains(model.query
                                                          .toLowerCase()))
                                                  .map((e) => Column(
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
                                                                      e.firstName ??
                                                                          '',
                                                                  fontSize:
                                                                      16.4.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 130.w,
                                                                child: TextView(
                                                                  text: e.email
                                                                          ?.toLowerCase() ??
                                                                      '',
                                                                  fontSize:
                                                                      16.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: e.status ==
                                                                            'active'
                                                                        ? 8.w
                                                                        : 4.w,
                                                                    vertical:
                                                                        4.8.w),
                                                                decoration: BoxDecoration(
                                                                    color: e.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .green
                                                                            .withOpacity(
                                                                                .17)
                                                                        : AppColor
                                                                            .grey
                                                                            .withOpacity(
                                                                                .17),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4)),
                                                                child: TextView(
                                                                  text: e.status
                                                                          ?.capitalize() ??
                                                                      '',
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: e.status ==
                                                                          'active'
                                                                      ? AppColor
                                                                          .deeperGreen
                                                                      : AppColor
                                                                          .grey,
                                                                  fontWeight: e
                                                                              .status ==
                                                                          'active'
                                                                      ? FontWeight
                                                                          .w600
                                                                      : FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              PopupMenuButton(
                                                                onSelected:
                                                                    (value) {
                                                                  // your logic
                                                                },
                                                                color: AppColor
                                                                    .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  size: 20.sp,
                                                                ),
                                                                itemBuilder:
                                                                    (BuildContext
                                                                        bc) {
                                                                  return [
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/suspend',
                                                                      onTap: () => model.modalBottomSuspendAndUnsuspendSheet(
                                                                          context:
                                                                              context,
                                                                          id: e
                                                                              .id
                                                                              .toString(),
                                                                          status:
                                                                              e.status),
                                                                      child:
                                                                          TextView(
                                                                        text: e.status?.toLowerCase() ==
                                                                                'active'
                                                                            ? 'Suspend'
                                                                            : "Unsuspend",
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/delete',
                                                                      onTap: () =>
                                                                          model
                                                                              .modalBottomDeleteAdminSheet(
                                                                        context,
                                                                        id: e.id
                                                                            .toString(),
                                                                      ),
                                                                      child:
                                                                          TextView(
                                                                        text:
                                                                            'Delete',
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ];
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                            else if (model
                                                .adminUserResponseListModel
                                                .isNotEmpty)
                                              ...model
                                                  .adminUserResponseListModel
                                                  .where((o) => o.firstName!
                                                      .toLowerCase()
                                                      .contains(model.query
                                                          .toLowerCase()))
                                                  .map((e) => Column(
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
                                                                      e.firstName ??
                                                                          '',
                                                                  fontSize:
                                                                      16.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 130.w,
                                                                child: TextView(
                                                                  text: e.email
                                                                          ?.toLowerCase() ??
                                                                      '',
                                                                  fontSize:
                                                                      16.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: e.status ==
                                                                            'active'
                                                                        ? 8.w
                                                                        : 4.w,
                                                                    vertical:
                                                                        4.8.w),
                                                                decoration: BoxDecoration(
                                                                    color: e.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .green
                                                                            .withOpacity(
                                                                                .17)
                                                                        : AppColor
                                                                            .grey
                                                                            .withOpacity(
                                                                                .17),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4)),
                                                                child: TextView(
                                                                  text: e.status
                                                                          ?.capitalize() ??
                                                                      '',
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: e.status ==
                                                                          'active'
                                                                      ? AppColor
                                                                          .deeperGreen
                                                                      : AppColor
                                                                          .grey,
                                                                  fontWeight: e
                                                                              .status ==
                                                                          'active'
                                                                      ? FontWeight
                                                                          .w600
                                                                      : FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              PopupMenuButton(
                                                                onSelected:
                                                                    (value) {
                                                                  // your logic
                                                                },
                                                                color: AppColor
                                                                    .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  size: 20.sp,
                                                                ),
                                                                itemBuilder:
                                                                    (BuildContext
                                                                        bc) {
                                                                  return [
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/suspend',
                                                                      onTap: () => model.modalBottomSuspendAndUnsuspendSheet(
                                                                          context:
                                                                              context,
                                                                          id: e
                                                                              .id
                                                                              .toString(),
                                                                          status:
                                                                              e.status),
                                                                      child:
                                                                          TextView(
                                                                        text: e.status?.toLowerCase() ==
                                                                                'active'
                                                                            ? 'Suspend'
                                                                            : "Unsuspend",
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/delete',
                                                                      onTap: () =>
                                                                          model
                                                                              .modalBottomDeleteAdminSheet(
                                                                        context,
                                                                        id: e.id
                                                                            .toString(),
                                                                      ),
                                                                      child:
                                                                          TextView(
                                                                        text:
                                                                            'Delete',
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ];
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            if (model.userGroupList.isNotEmpty)
                                              ...model.userGroupList
                                                  .where((o) => o.firstName!
                                                      .toLowerCase()
                                                      .contains(model.query
                                                          .toLowerCase()))
                                                  .map((e) => Column(
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
                                                                      e.firstName ??
                                                                          '',
                                                                  fontSize:
                                                                      16.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 130.w,
                                                                child: TextView(
                                                                  text: e.email
                                                                          ?.toLowerCase() ??
                                                                      '',
                                                                  fontSize:
                                                                      16.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: e.status ==
                                                                            'active'
                                                                        ? 8.w
                                                                        : 4.w,
                                                                    vertical:
                                                                        4.8.w),
                                                                decoration: BoxDecoration(
                                                                    color: e.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .green
                                                                            .withOpacity(
                                                                                .17)
                                                                        : AppColor
                                                                            .grey
                                                                            .withOpacity(
                                                                                .17),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4)),
                                                                child: TextView(
                                                                  text: e.status
                                                                          ?.capitalize() ??
                                                                      '',
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: e.status ==
                                                                          'active'
                                                                      ? AppColor
                                                                          .deeperGreen
                                                                      : AppColor
                                                                          .grey,
                                                                  fontWeight: e
                                                                              .status ==
                                                                          'active'
                                                                      ? FontWeight
                                                                          .w600
                                                                      : FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              PopupMenuButton(
                                                                onSelected:
                                                                    (value) {
                                                                  // your logic
                                                                },
                                                                color: AppColor
                                                                    .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  size: 20.sp,
                                                                ),
                                                                itemBuilder:
                                                                    (BuildContext
                                                                        bc) {
                                                                  return [
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/suspend',
                                                                      onTap: () => model.modalBottomSuspendAndUnsuspendSheet(
                                                                          context:
                                                                              context,
                                                                          id: e
                                                                              .id
                                                                              .toString(),
                                                                          status:
                                                                              e.status),
                                                                      child:
                                                                          TextView(
                                                                        text: e.status?.toLowerCase() ==
                                                                                'active'
                                                                            ? 'Suspend'
                                                                            : "Unsuspend",
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/delete',
                                                                      onTap: () =>
                                                                          model
                                                                              .modalBottomDeleteAdminSheet(
                                                                        context,
                                                                        id: e.id
                                                                            .toString(),
                                                                      ),
                                                                      child:
                                                                          TextView(
                                                                        text:
                                                                            'Delete',
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ];
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                            else if (model
                                                .adminUserResponseListModel
                                                .isNotEmpty)
                                              ...model
                                                  .adminUserResponseListModel
                                                  .map((e) => Column(
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
                                                                      e.firstName ??
                                                                          '',
                                                                  fontSize:
                                                                      16.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 130.w,
                                                                child: TextView(
                                                                  text: e.email
                                                                          ?.toLowerCase() ??
                                                                      '',
                                                                  fontSize:
                                                                      16.sp,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: e.status ==
                                                                            'active'
                                                                        ? 8.w
                                                                        : 4.w,
                                                                    vertical:
                                                                        4.8.w),
                                                                decoration: BoxDecoration(
                                                                    color: e.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .green
                                                                            .withOpacity(
                                                                                .17)
                                                                        : AppColor
                                                                            .grey
                                                                            .withOpacity(
                                                                                .17),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4)),
                                                                child: TextView(
                                                                  text: e.status
                                                                          ?.capitalize() ??
                                                                      '',
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: e.status ==
                                                                          'active'
                                                                      ? AppColor
                                                                          .deeperGreen
                                                                      : AppColor
                                                                          .grey,
                                                                  fontWeight: e
                                                                              .status ==
                                                                          'active'
                                                                      ? FontWeight
                                                                          .w600
                                                                      : FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              PopupMenuButton(
                                                                onSelected:
                                                                    (value) {
                                                                  // your logic
                                                                },
                                                                color: AppColor
                                                                    .white,
                                                                icon: Icon(
                                                                  Icons
                                                                      .more_vert,
                                                                  size: 20.sp,
                                                                ),
                                                                itemBuilder:
                                                                    (BuildContext
                                                                        bc) {
                                                                  return [
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/suspend',
                                                                      onTap: () => model.modalBottomSuspendAndUnsuspendSheet(
                                                                          context:
                                                                              context,
                                                                          id: e
                                                                              .id
                                                                              .toString(),
                                                                          status:
                                                                              e.status),
                                                                      child:
                                                                          TextView(
                                                                        text: e.status?.toLowerCase() ==
                                                                                'active'
                                                                            ? 'Suspend'
                                                                            : "Unsuspend",
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                    PopupMenuItem(
                                                                      value:
                                                                          '/delete',
                                                                      onTap: () => model.modalBottomDeleteAdminSheet(
                                                                          context,
                                                                          id: e
                                                                              .id
                                                                              .toString()),
                                                                      child:
                                                                          TextView(
                                                                        text:
                                                                            'Delete',
                                                                        fontSize:
                                                                            14.2.sp,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ];
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                          ],
                                        )
                                ],
                              ),
                            ),
                          ),
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

  // Future openDialog(context) => showDialog(
  //       context: context,
  //       builder: (context) => Container(
  //         margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 100.w),
  //         decoration: BoxDecoration(
  //             color: AppColor.white, borderRadius: BorderRadius.circular(12)),
  //         width: double.infinity,
  //         child: Scaffold(
  //           backgroundColor: AppColor.transparent,
  //           body: SingleChildScrollView(
  //             padding: EdgeInsets.symmetric(vertical: 33.w),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 paddedWing(
  //                   child: Container(
  //                     padding: EdgeInsets.all(10.w),
  //                     decoration: const BoxDecoration(
  //                         shape: BoxShape.circle, color: AppColor.navyBlueGrey),
  //                     child: TextView(
  //                       text: 'JD',
  //                       fontSize: 16.4.sp,
  //                       color: AppColor.white,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10.2.h,
  //                 ),
  //                 paddedWing(
  //                   child: TextView(
  //                     text: 'Activ,e',
  //                     fontSize: 14.4.sp,
  //                     color: AppColor.deeperGreen,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 8.2.h,
  //                 ),
  //                 paddedWing(
  //                   child: TextView(
  //                     text: 'Last Active - 2 secs ago',
  //                     fontSize: 14.4.sp,
  //                     color: AppColor.black,
  //                     fontStyle: FontStyle.italic,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 6.2.h,
  //                 ),
  //                 paddedWing(
  //                   child: TextView(
  //                     text: 'Jane Doe',
  //                     fontSize: 15.4.sp,
  //                     color: AppColor.black,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 6.2.h,
  //                 ),
  //                 paddedWing(
  //                   child: TextView(
  //                     text: 'jane.doe@example.com',
  //                     fontSize: 14.sp,
  //                     color: AppColor.black,
  //                     fontWeight: FontWeight.w400,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 6.2.h,
  //                 ),
  //                 paddedWing(
  //                   child: TextView(
  //                     text: 'ID- #81671ABO',
  //                     fontSize: 14.sp,
  //                     color: AppColor.black,
  //                     fontWeight: FontWeight.w400,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 8.h,
  //                 ),
  //                 paddedWing(
  //                   child: TextView(
  //                     text: 'Recent Transactions',
  //                     fontSize: 15.4.sp,
  //                     color: AppColor.black,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 4.2.h,
  //                 ),
  //                 Divider(
  //                   color: AppColor.grey,
  //                   thickness: .3.sp,
  //                 ),
  //                 SizedBox(
  //                   height: 4.2.h,
  //                 ),
  //                 paddedWing(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       TextView(
  //                         text: 'Txn ID',
  //                         fontSize: 14.sp,
  //                         color: AppColor.black,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                       TextView(
  //                         text: 'Amount',
  //                         fontSize: 14.sp,
  //                         color: AppColor.black,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                       TextView(
  //                         text: 'Status',
  //                         fontSize: 14.sp,
  //                         color: AppColor.black,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                       TextView(
  //                         text: 'Date',
  //                         fontSize: 14.sp,
  //                         color: AppColor.black,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 4.2.h,
  //                 ),
  //                 ...[
  //                   1,
  //                   2,
  //                   3,
  //                   4,
  //                 ].map((e) => contRecentTranWidget()),
  //                 SizedBox(
  //                   height: 12.2.h,
  //                 ),
  //                 paddedWing(
  //                   child: TextFormWidget(
  //                     label: 'Add Notes',
  //                     hint: null,
  //                     border: 10,
  //                     maxline: 4,
  //                     isFilled: true,
  //                     fillColor: AppColor.white,
  //                     alignLabelWithHint: true,
  //                     // controller: emailController,
  //                     // validator: AppValidator.validateEmail(),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 20.h,
  //                 ),
  //                 paddedWing(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Container(
  //                         padding: EdgeInsets.symmetric(
  //                             vertical: 6.w, horizontal: 22.w),
  //                         decoration: BoxDecoration(
  //                             color: AppColor.yellow.withOpacity(.2),
  //                             borderRadius: BorderRadius.circular(4)),
  //                         child: Row(
  //                           children: [
  //                             SvgPicture.asset(AppImage.flag),
  //                             SizedBox(
  //                               width: 10.w,
  //                             ),
  //                             TextView(
  //                               text: 'Flag',
  //                               fontSize: 14.sp,
  //                               color: AppColor.yellow,
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Container(
  //                         padding: EdgeInsets.symmetric(
  //                             vertical: 6.w, horizontal: 22.w),
  //                         decoration: BoxDecoration(
  //                             color: AppColor.grey.withOpacity(.2),
  //                             borderRadius: BorderRadius.circular(4)),
  //                         child: Row(
  //                           children: [
  //                             Icon(
  //                               Icons.pause_circle_outline,
  //                               color: AppColor.darkGrey,
  //                               size: 24.sp,
  //                             ),
  //                             SizedBox(
  //                               width: 10.w,
  //                             ),
  //                             TextView(
  //                               text: 'Suspend',
  //                               fontSize: 14.sp,
  //                               color: AppColor.darkGrey,
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 30.h,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  contRecentTranWidget() => Column(
        children: [
          Divider(
            color: AppColor.grey,
            thickness: .3.sp,
          ),
          SizedBox(
            height: 4.2.h,
          ),
          paddedWing(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: '#81671',
                  fontSize: 14.sp,
                  color: AppColor.greyNice,
                  fontWeight: FontWeight.w500,
                ),
                TextView(
                  text: '100,000,000 NGN',
                  fontSize: 14.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 6.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColor.green.withOpacity(.2)),
                  child: TextView(
                    text: 'Approved',
                    fontSize: 12.sp,
                    color: AppColor.deeperGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: '99/99/2025',
                  fontSize: 12.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      );
}

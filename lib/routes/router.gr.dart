// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;

import '../models/user.dart' as _i22;
import '../presentation/pages/accept-reject-screen/accept_reject_page.dart'
    as _i15;
import '../presentation/pages/admin_auth_hack_page/admin_auth_hack_page.dart'
    as _i13;
import '../presentation/pages/admin_auth_wrapper_page/admin_auth_wrapper_page.dart'
    as _i4;
import '../presentation/pages/admin_screen/admin_page.dart' as _i14;
import '../presentation/pages/edit_user_profile_page/edit_user_profile_page.dart'
    as _i11;
import '../presentation/pages/guest_wrapper_hack_page/guest_wrapper_hack_page.dart'
    as _i6;
import '../presentation/pages/guest_wrapper_page/guest_wrapper_page.dart'
    as _i2;
import '../presentation/pages/home_page/home_page.dart' as _i7;
import '../presentation/pages/insert_review_page/insert_review_page.dart'
    as _i10;
import '../presentation/pages/landing_page/landing_page.dart' as _i17;
import '../presentation/pages/login_page/login_page.dart' as _i19;
import '../presentation/pages/signup-page/signup_page.dart' as _i18;
import '../presentation/pages/splash_page/splash_page.dart' as _i1;
import '../presentation/pages/unauth_wrapper_page/unauth_wrapper_page.dart'
    as _i5;
import '../presentation/pages/user_auth_hack_page/user_auth_hack_page.dart'
    as _i9;
import '../presentation/pages/user_auth_wrapper_page/user_auth_wrapper_page.dart'
    as _i3;
import '../presentation/pages/view_profile_page/employee_profile_screen.dart'
    as _i8;
import '../presentation/pages/view_profile_page/view_profile_admin_page.dart'
    as _i16;
import '../presentation/pages/view_profile_page/view_profile_page.dart' as _i12;

class AppRouter extends _i20.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    GuestWrapperRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.GuestWrapperPage(),
      );
    },
    UserAuthWrapperRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.UserAuthWrapperPage(),
      );
    },
    AdminAuthWrapperRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AdminAuthWrapperPage(),
      );
    },
    UnAuthWrapperRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.UnAuthWrapperPage(),
      );
    },
    GuestWrapperHackRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.GuestWrapperHackPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    EmployeeProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeProfileRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EmployeeProfilePage(
          key: args.key,
          employeeId: args.employeeId,
        ),
      );
    },
    UserAuthHackRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.UserAuthHackPage(),
      );
    },
    InsertReviewRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.InsertReviewPage(),
      );
    },
    EditUserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditUserProfileRouteArgs>();
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.EditUserProfilePage(
          key: args.key,
          userType: args.userType,
          userId: args.userId,
        ),
      );
    },
    ViewProfileRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ViewProfilePage(),
      );
    },
    AdminAuthHackRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.AdminAuthHackPage(),
      );
    },
    AdminRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.AdminPage(),
      );
    },
    AcceptRejectRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.AcceptRejectPage(),
      );
    },
    ViewProfileAdminRoute.name: (routeData) {
      final args = routeData.argsAs<ViewProfileAdminRouteArgs>(
          orElse: () => const ViewProfileAdminRouteArgs());
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.ViewProfileAdminPage(
          userId: args.userId,
          key: args.key,
        ),
      );
    },
    LandingRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.LandingPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.SignUpPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i20.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.LoginPage(),
      );
    },
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(
          SplashRoute.name,
          path: 'splash',
        ),
        _i20.RouteConfig(
          GuestWrapperRoute.name,
          path: 'guest',
          children: [
            _i20.RouteConfig(
              GuestWrapperHackRoute.name,
              path: '',
              parent: GuestWrapperRoute.name,
              children: [
                _i20.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: GuestWrapperHackRoute.name,
                  redirectTo: 'home-page',
                  fullMatch: true,
                ),
                _i20.RouteConfig(
                  HomeRoute.name,
                  path: 'home-page',
                  parent: GuestWrapperHackRoute.name,
                ),
                _i20.RouteConfig(
                  EmployeeProfileRoute.name,
                  path: 'employee-profile-screen',
                  parent: GuestWrapperHackRoute.name,
                ),
              ],
            )
          ],
        ),
        _i20.RouteConfig(
          UserAuthWrapperRoute.name,
          path: '/user-auth',
          children: [
            _i20.RouteConfig(
              UserAuthHackRoute.name,
              path: '',
              parent: UserAuthWrapperRoute.name,
              children: [
                _i20.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: UserAuthHackRoute.name,
                  redirectTo: 'home-page',
                  fullMatch: true,
                ),
                _i20.RouteConfig(
                  HomeRoute.name,
                  path: 'home-page',
                  parent: UserAuthHackRoute.name,
                ),
                _i20.RouteConfig(
                  InsertReviewRoute.name,
                  path: 'insert-review-page',
                  parent: UserAuthHackRoute.name,
                ),
                _i20.RouteConfig(
                  EditUserProfileRoute.name,
                  path: 'edit-user-profile',
                  parent: UserAuthHackRoute.name,
                ),
                _i20.RouteConfig(
                  EmployeeProfileRoute.name,
                  path: 'employee-profile-screen',
                  parent: UserAuthHackRoute.name,
                ),
                _i20.RouteConfig(
                  ViewProfileRoute.name,
                  path: 'view-profile-page',
                  parent: UserAuthHackRoute.name,
                ),
              ],
            )
          ],
        ),
        _i20.RouteConfig(
          AdminAuthWrapperRoute.name,
          path: '/admin',
          children: [
            _i20.RouteConfig(
              AdminAuthHackRoute.name,
              path: '',
              parent: AdminAuthWrapperRoute.name,
              children: [
                _i20.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: AdminAuthHackRoute.name,
                  redirectTo: 'admin-page',
                  fullMatch: true,
                ),
                _i20.RouteConfig(
                  AdminRoute.name,
                  path: 'admin-page',
                  parent: AdminAuthHackRoute.name,
                ),
                _i20.RouteConfig(
                  AcceptRejectRoute.name,
                  path: 'accept-reject',
                  parent: AdminAuthHackRoute.name,
                ),
                _i20.RouteConfig(
                  ViewProfileAdminRoute.name,
                  path: 'view-profile-admin-page',
                  parent: AdminAuthHackRoute.name,
                ),
                _i20.RouteConfig(
                  EditUserProfileRoute.name,
                  path: 'edit-user-profile',
                  parent: AdminAuthHackRoute.name,
                ),
              ],
            )
          ],
        ),
        _i20.RouteConfig(
          UnAuthWrapperRoute.name,
          path: 'unauth',
          children: [
            _i20.RouteConfig(
              '#redirect',
              path: '',
              parent: UnAuthWrapperRoute.name,
              redirectTo: 'landing',
              fullMatch: true,
            ),
            _i20.RouteConfig(
              LandingRoute.name,
              path: 'landing',
              parent: UnAuthWrapperRoute.name,
            ),
            _i20.RouteConfig(
              SignUpRoute.name,
              path: 'signup-page',
              parent: UnAuthWrapperRoute.name,
            ),
            _i20.RouteConfig(
              LoginRoute.name,
              path: 'login-page',
              parent: UnAuthWrapperRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i20.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.GuestWrapperPage]
class GuestWrapperRoute extends _i20.PageRouteInfo<void> {
  const GuestWrapperRoute({List<_i20.PageRouteInfo>? children})
      : super(
          GuestWrapperRoute.name,
          path: 'guest',
          initialChildren: children,
        );

  static const String name = 'GuestWrapperRoute';
}

/// generated route for
/// [_i3.UserAuthWrapperPage]
class UserAuthWrapperRoute extends _i20.PageRouteInfo<void> {
  const UserAuthWrapperRoute({List<_i20.PageRouteInfo>? children})
      : super(
          UserAuthWrapperRoute.name,
          path: '/user-auth',
          initialChildren: children,
        );

  static const String name = 'UserAuthWrapperRoute';
}

/// generated route for
/// [_i4.AdminAuthWrapperPage]
class AdminAuthWrapperRoute extends _i20.PageRouteInfo<void> {
  const AdminAuthWrapperRoute({List<_i20.PageRouteInfo>? children})
      : super(
          AdminAuthWrapperRoute.name,
          path: '/admin',
          initialChildren: children,
        );

  static const String name = 'AdminAuthWrapperRoute';
}

/// generated route for
/// [_i5.UnAuthWrapperPage]
class UnAuthWrapperRoute extends _i20.PageRouteInfo<void> {
  const UnAuthWrapperRoute({List<_i20.PageRouteInfo>? children})
      : super(
          UnAuthWrapperRoute.name,
          path: 'unauth',
          initialChildren: children,
        );

  static const String name = 'UnAuthWrapperRoute';
}

/// generated route for
/// [_i6.GuestWrapperHackPage]
class GuestWrapperHackRoute extends _i20.PageRouteInfo<void> {
  const GuestWrapperHackRoute({List<_i20.PageRouteInfo>? children})
      : super(
          GuestWrapperHackRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'GuestWrapperHackRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i20.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.EmployeeProfilePage]
class EmployeeProfileRoute
    extends _i20.PageRouteInfo<EmployeeProfileRouteArgs> {
  EmployeeProfileRoute({
    _i21.Key? key,
    required String employeeId,
  }) : super(
          EmployeeProfileRoute.name,
          path: 'employee-profile-screen',
          args: EmployeeProfileRouteArgs(
            key: key,
            employeeId: employeeId,
          ),
        );

  static const String name = 'EmployeeProfileRoute';
}

class EmployeeProfileRouteArgs {
  const EmployeeProfileRouteArgs({
    this.key,
    required this.employeeId,
  });

  final _i21.Key? key;

  final String employeeId;

  @override
  String toString() {
    return 'EmployeeProfileRouteArgs{key: $key, employeeId: $employeeId}';
  }
}

/// generated route for
/// [_i9.UserAuthHackPage]
class UserAuthHackRoute extends _i20.PageRouteInfo<void> {
  const UserAuthHackRoute({List<_i20.PageRouteInfo>? children})
      : super(
          UserAuthHackRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'UserAuthHackRoute';
}

/// generated route for
/// [_i10.InsertReviewPage]
class InsertReviewRoute extends _i20.PageRouteInfo<void> {
  const InsertReviewRoute()
      : super(
          InsertReviewRoute.name,
          path: 'insert-review-page',
        );

  static const String name = 'InsertReviewRoute';
}

/// generated route for
/// [_i11.EditUserProfilePage]
class EditUserProfileRoute
    extends _i20.PageRouteInfo<EditUserProfileRouteArgs> {
  EditUserProfileRoute({
    _i21.Key? key,
    required _i22.UserType userType,
    required String? userId,
  }) : super(
          EditUserProfileRoute.name,
          path: 'edit-user-profile',
          args: EditUserProfileRouteArgs(
            key: key,
            userType: userType,
            userId: userId,
          ),
        );

  static const String name = 'EditUserProfileRoute';
}

class EditUserProfileRouteArgs {
  const EditUserProfileRouteArgs({
    this.key,
    required this.userType,
    required this.userId,
  });

  final _i21.Key? key;

  final _i22.UserType userType;

  final String? userId;

  @override
  String toString() {
    return 'EditUserProfileRouteArgs{key: $key, userType: $userType, userId: $userId}';
  }
}

/// generated route for
/// [_i12.ViewProfilePage]
class ViewProfileRoute extends _i20.PageRouteInfo<void> {
  const ViewProfileRoute()
      : super(
          ViewProfileRoute.name,
          path: 'view-profile-page',
        );

  static const String name = 'ViewProfileRoute';
}

/// generated route for
/// [_i13.AdminAuthHackPage]
class AdminAuthHackRoute extends _i20.PageRouteInfo<void> {
  const AdminAuthHackRoute({List<_i20.PageRouteInfo>? children})
      : super(
          AdminAuthHackRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'AdminAuthHackRoute';
}

/// generated route for
/// [_i14.AdminPage]
class AdminRoute extends _i20.PageRouteInfo<void> {
  const AdminRoute()
      : super(
          AdminRoute.name,
          path: 'admin-page',
        );

  static const String name = 'AdminRoute';
}

/// generated route for
/// [_i15.AcceptRejectPage]
class AcceptRejectRoute extends _i20.PageRouteInfo<void> {
  const AcceptRejectRoute()
      : super(
          AcceptRejectRoute.name,
          path: 'accept-reject',
        );

  static const String name = 'AcceptRejectRoute';
}

/// generated route for
/// [_i16.ViewProfileAdminPage]
class ViewProfileAdminRoute
    extends _i20.PageRouteInfo<ViewProfileAdminRouteArgs> {
  ViewProfileAdminRoute({
    String? userId,
    _i21.Key? key,
  }) : super(
          ViewProfileAdminRoute.name,
          path: 'view-profile-admin-page',
          args: ViewProfileAdminRouteArgs(
            userId: userId,
            key: key,
          ),
        );

  static const String name = 'ViewProfileAdminRoute';
}

class ViewProfileAdminRouteArgs {
  const ViewProfileAdminRouteArgs({
    this.userId,
    this.key,
  });

  final String? userId;

  final _i21.Key? key;

  @override
  String toString() {
    return 'ViewProfileAdminRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i17.LandingPage]
class LandingRoute extends _i20.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: 'landing',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i18.SignUpPage]
class SignUpRoute extends _i20.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: 'signup-page',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i19.LoginPage]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login-page',
        );

  static const String name = 'LoginRoute';
}

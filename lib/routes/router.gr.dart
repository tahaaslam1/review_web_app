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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../presentation/pages/accept-reject-screen/accept_reject_page.dart'
    as _i11;
import '../presentation/pages/admin_auth_wrapper_page/admin_auth_wrapper_page.dart'
    as _i3;
import '../presentation/pages/admin_screen/admin_page.dart' as _i10;
import '../presentation/pages/edit_user_profile_page/edit_user_profile_page.dart'
    as _i7;
import '../presentation/pages/home_page/home_page.dart' as _i5;
import '../presentation/pages/insert_review_page/insert_review_page.dart'
    as _i6;
import '../presentation/pages/landing_page/landing_page.dart' as _i1;
import '../presentation/pages/login_page/login_page.dart' as _i14;
import '../presentation/pages/signup-page/signup_page.dart' as _i13;
import '../presentation/pages/unauth_wrapper_page/unauth_wrapper_page.dart'
    as _i4;
import '../presentation/pages/user_auth_wrapper_page/user_auth_wrapper_page.dart'
    as _i2;
import '../presentation/pages/view_profile_page/employee_profile_screen.dart'
    as _i8;
import '../presentation/pages/view_profile_page/view_profile_admin_page.dart'
    as _i12;
import '../presentation/pages/view_profile_page/view_profile_page.dart' as _i9;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LandingPage(),
      );
    },
    UserAuthWrapperRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.UserAuthWrapperPage(),
      );
    },
    AdminAuthWrapperRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AdminAuthWrapperPage(),
      );
    },
    UnAuthWrapperRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.UnAuthWrapperPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    InsertReviewRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.InsertReviewPage(),
      );
    },
    EditUserProfileRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EditUserProfilePage(),
      );
    },
    EmployeeProfileRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.EmployeeProfilePage(),
      );
    },
    ViewProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ViewProfileRouteArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ViewProfilePage(
          args.userid,
          args.typeid,
          key: args.key,
        ),
      );
    },
    AdminRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AdminPage(),
      );
    },
    AcceptRejectRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AcceptRejectPage(),
      );
    },
    ViewProfileAdminRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.ViewProfileAdminPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.SignUpPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.LoginPage(),
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          LandingRoute.name,
          path: 'landing-page',
        ),
        _i15.RouteConfig(
          UserAuthWrapperRoute.name,
          path: '/user-auth',
          children: [
            _i15.RouteConfig(
              HomeRoute.name,
              path: 'home-page',
              parent: UserAuthWrapperRoute.name,
            ),
            _i15.RouteConfig(
              InsertReviewRoute.name,
              path: 'insert-review-page',
              parent: UserAuthWrapperRoute.name,
            ),
            _i15.RouteConfig(
              EditUserProfileRoute.name,
              path: 'edit-user-profile',
              parent: UserAuthWrapperRoute.name,
            ),
            _i15.RouteConfig(
              EmployeeProfileRoute.name,
              path: 'employee-profile-screen',
              parent: UserAuthWrapperRoute.name,
            ),
            _i15.RouteConfig(
              ViewProfileRoute.name,
              path: 'view-profile-page',
              parent: UserAuthWrapperRoute.name,
            ),
          ],
        ),
        _i15.RouteConfig(
          AdminAuthWrapperRoute.name,
          path: '/admin-auth',
          children: [
            _i15.RouteConfig(
              AdminRoute.name,
              path: 'admin-page',
              parent: AdminAuthWrapperRoute.name,
            ),
            _i15.RouteConfig(
              AcceptRejectRoute.name,
              path: 'accept-reject',
              parent: AdminAuthWrapperRoute.name,
            ),
            _i15.RouteConfig(
              ViewProfileAdminRoute.name,
              path: 'view-profile-admin-page',
              parent: AdminAuthWrapperRoute.name,
            ),
          ],
        ),
        _i15.RouteConfig(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          children: [
            _i15.RouteConfig(
              '#redirect',
              path: '',
              parent: UnAuthWrapperRoute.name,
              redirectTo: 'signup-page',
              fullMatch: true,
            ),
            _i15.RouteConfig(
              SignUpRoute.name,
              path: 'signup-page',
              parent: UnAuthWrapperRoute.name,
            ),
            _i15.RouteConfig(
              LoginRoute.name,
              path: 'Log-in-Page',
              parent: UnAuthWrapperRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i15.PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: 'landing-page',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i2.UserAuthWrapperPage]
class UserAuthWrapperRoute extends _i15.PageRouteInfo<void> {
  const UserAuthWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          UserAuthWrapperRoute.name,
          path: '/user-auth',
          initialChildren: children,
        );

  static const String name = 'UserAuthWrapperRoute';
}

/// generated route for
/// [_i3.AdminAuthWrapperPage]
class AdminAuthWrapperRoute extends _i15.PageRouteInfo<void> {
  const AdminAuthWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          AdminAuthWrapperRoute.name,
          path: '/admin-auth',
          initialChildren: children,
        );

  static const String name = 'AdminAuthWrapperRoute';
}

/// generated route for
/// [_i4.UnAuthWrapperPage]
class UnAuthWrapperRoute extends _i15.PageRouteInfo<void> {
  const UnAuthWrapperRoute({List<_i15.PageRouteInfo>? children})
      : super(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          initialChildren: children,
        );

  static const String name = 'UnAuthWrapperRoute';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.InsertReviewPage]
class InsertReviewRoute extends _i15.PageRouteInfo<void> {
  const InsertReviewRoute()
      : super(
          InsertReviewRoute.name,
          path: 'insert-review-page',
        );

  static const String name = 'InsertReviewRoute';
}

/// generated route for
/// [_i7.EditUserProfilePage]
class EditUserProfileRoute extends _i15.PageRouteInfo<void> {
  const EditUserProfileRoute()
      : super(
          EditUserProfileRoute.name,
          path: 'edit-user-profile',
        );

  static const String name = 'EditUserProfileRoute';
}

/// generated route for
/// [_i8.EmployeeProfilePage]
class EmployeeProfileRoute extends _i15.PageRouteInfo<void> {
  const EmployeeProfileRoute()
      : super(
          EmployeeProfileRoute.name,
          path: 'employee-profile-screen',
        );

  static const String name = 'EmployeeProfileRoute';
}

/// generated route for
/// [_i9.ViewProfilePage]
class ViewProfileRoute extends _i15.PageRouteInfo<ViewProfileRouteArgs> {
  ViewProfileRoute({
    required String? userid,
    required int? typeid,
    _i16.Key? key,
  }) : super(
          ViewProfileRoute.name,
          path: 'view-profile-page',
          args: ViewProfileRouteArgs(
            userid: userid,
            typeid: typeid,
            key: key,
          ),
        );

  static const String name = 'ViewProfileRoute';
}

class ViewProfileRouteArgs {
  const ViewProfileRouteArgs({
    required this.userid,
    required this.typeid,
    this.key,
  });

  final String? userid;

  final int? typeid;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ViewProfileRouteArgs{userid: $userid, typeid: $typeid, key: $key}';
  }
}

/// generated route for
/// [_i10.AdminPage]
class AdminRoute extends _i15.PageRouteInfo<void> {
  const AdminRoute()
      : super(
          AdminRoute.name,
          path: 'admin-page',
        );

  static const String name = 'AdminRoute';
}

/// generated route for
/// [_i11.AcceptRejectPage]
class AcceptRejectRoute extends _i15.PageRouteInfo<void> {
  const AcceptRejectRoute()
      : super(
          AcceptRejectRoute.name,
          path: 'accept-reject',
        );

  static const String name = 'AcceptRejectRoute';
}

/// generated route for
/// [_i12.ViewProfileAdminPage]
class ViewProfileAdminRoute extends _i15.PageRouteInfo<void> {
  const ViewProfileAdminRoute()
      : super(
          ViewProfileAdminRoute.name,
          path: 'view-profile-admin-page',
        );

  static const String name = 'ViewProfileAdminRoute';
}

/// generated route for
/// [_i13.SignUpPage]
class SignUpRoute extends _i15.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: 'signup-page',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i14.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'Log-in-Page',
        );

  static const String name = 'LoginRoute';
}

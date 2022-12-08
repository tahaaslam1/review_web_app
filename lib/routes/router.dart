import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:review_web_app/presentation/pages/accept-reject-screen/accept_reject_page.dart';
import 'package:review_web_app/presentation/pages/admin_auth_wrapper_page/admin_auth_wrapper_page.dart';
import 'package:review_web_app/presentation/pages/admin_screen/admin_page.dart';
import 'package:review_web_app/presentation/pages/user_auth_wrapper_page/user_auth_wrapper_page.dart';
import 'package:review_web_app/presentation/pages/edit_user_profile_page/edit_user_profile_page.dart';
import 'package:review_web_app/presentation/pages/home_page/home_page.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/insert_review_page.dart';
import 'package:review_web_app/presentation/pages/landing_page/landing_page.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';
import 'package:review_web_app/presentation/pages/signup-page/signup_page.dart';
import 'package:review_web_app/presentation/pages/unauth_wrapper_page/unauth_wrapper_page.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/employee_profile_screen.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_admin_page.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: LandingPage.route,
      page: LandingPage,
    ),
    AutoRoute(
      path: UserAuthWrapperPage.route,
      page: UserAuthWrapperPage,
      children: [
        AutoRoute(
          path: HomePage.route,
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              initial: true,
              page: HomePage,
            ),
            AutoRoute(
              path: InsertReviewPage.route,
              page: InsertReviewPage,
            ),
            AutoRoute(
              path: EditUserProfilePage.route,
              page: EditUserProfilePage,
            ),
            AutoRoute(
              path: EmployeeProfilePage.route,
              page: EmployeeProfilePage,
            ),
            AutoRoute(
              path: ViewProfilePage.route,
              page: ViewProfilePage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: AdminAuthWrapperPage.route,
      page: AdminAuthWrapperPage,
      children: [
        AutoRoute(
          path: AdminPage.route,
          page: AdminPage,
        ),
        AutoRoute(
          path: AcceptRejectPage.route,
          page: AcceptRejectPage,
        ),
        AutoRoute(
          path: ViewProfileAdminPage.route,
          page: ViewProfileAdminPage,
        ),
      ],
    ),
    AutoRoute(
      path: UnAuthWrapperPage.route,
      page: UnAuthWrapperPage,
      children: [
        AutoRoute(
          path: SignUpPage.route,
          page: SignUpPage,
          initial: true,
        ),
        AutoRoute(
          path: LoginPage.route,
          page: LoginPage,
        ),
      ],
    )
  ],
)
class $AppRouter {}

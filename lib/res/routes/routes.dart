import 'package:estate_listings/res/routes/routes_name.dart';
import 'package:estate_listings/view/home/home_view.dart';
import 'package:estate_listings/view/login/login_view.dart';
import 'package:estate_listings/view/splash_view.dart';
import 'package:estate_listings/view/user_profile/user_offers/user_offers_view.dart';
import 'package:estate_listings/view/user_profile/user_profile_view.dart';
import 'package:get/get.dart';


class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashView,
            page: () =>  const SplashView(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
          name: RouteName.loginView, 
          page: () =>  LoginView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250)),

          GetPage(
          name: RouteName.homeView, 
          page: () =>  HomeView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250)),

          GetPage(
          name: RouteName.userProfileView, 
          page: () =>  UserProfileView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250)),

          GetPage(
          name: RouteName.offerView, 
          page: () =>  UserOfferView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250)),

          GetPage(
          name: RouteName.dashboardView, 
          page: () =>  DashboardView(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 250)),

          
      ];
}

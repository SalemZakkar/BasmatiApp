import 'package:basic_project/screens/authentication/confirm_code.dart';
import 'package:basic_project/screens/authentication/forget_password.dart';
import 'package:basic_project/screens/authentication/sign_in.dart';
import 'package:basic_project/screens/authentication/sign_up.dart';
import 'package:basic_project/screens/notification/model/notification_model.dart';
import 'package:basic_project/screens/notification/notification_details.dart';
import 'package:basic_project/screens/order/order_details_subscription.dart';
import 'package:basic_project/screens/settings/change_phone.dart';
import 'package:basic_project/screens/settings/confirm_code_phone.dart';
import 'package:basic_project/screens/settings/new_password_page.dart';
import 'package:basic_project/screens/splash_screen.dart';
import 'package:basic_project/screens/subscriptions/subscription_details.dart';
import 'package:basic_project/screens/subscriptions/subscription_screen.dart';
import 'package:flutter/material.dart';

import '../screens/order/payment_log.dart';
import '../screens/order/purchase_history_screen.dart';
import '../screens/order/subscribe_log.dart';
import '../screens/screens_export.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case NavigationBarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NavigationBarScreen());
      case AuthenticationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case ShoppingCartScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ShoppingCartScreen());
      case SignInPage.routeName:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case SignUpPage.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case ForgetPasswordPage.routeName:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordPage());
      case ConfirmCodePage.routeName:
        return MaterialPageRoute(builder: (_) => const ConfirmCodePage());
      case ConfirmCodePhonePage.routeName:
        return MaterialPageRoute(builder: (_) => const ConfirmCodePhonePage());
      case SettingsPage.routeName:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case ChangePhone.routeName:
        return MaterialPageRoute(builder: (_) => const ChangePhone());
      case NewPasswordPage.routeName:
        return MaterialPageRoute(builder: (_) => const NewPasswordPage());
      case PaymentLog.routeName:
        return MaterialPageRoute(builder: (_) => const PaymentLog());
      case SubscribeLog.routeName:
        return MaterialPageRoute(builder: (_) => const SubscribeLog());
      case ItemScreen.routeName:
        var data = routeSettings.arguments as ItemScreen;
        return MaterialPageRoute(builder: (_) => ItemScreen(id: data.id));
      case PurchaseHistoryScreen.routeName:
        var data = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => PurchaseHistoryScreen(idOrder: data));
      case NotificationDetailsScreen.routeName:
        var data = routeSettings.arguments as NotificationData;
        return MaterialPageRoute(
            builder: (_) => NotificationDetailsScreen(
                  notificationData: data,
                ));
      case SubscriptionScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SubscriptionScreen());
      case SubscriptionDetails.routeName:
        String data = routeSettings.arguments as String;
        return MaterialPageRoute(builder: (_) => SubscriptionDetails(id: data));
      case OrderDetailsSubscription.routeName:
        String data = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => OrderDetailsSubscription(idOrder: data));
      default:
        return null;
    }
  }
}

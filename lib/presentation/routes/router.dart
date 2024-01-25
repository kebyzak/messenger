import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger_app/presentation/screens/chat_screen.dart';
import 'package:messenger_app/presentation/screens/dialog_screen.dart';
import 'package:messenger_app/presentation/screens/login_screen.dart';
import 'package:messenger_app/presentation/screens/register_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login', initial: true),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
        AutoRoute(page: ChatRoute.page, path: '/chat'),
        AutoRoute(page: DialogRoute.page, path: '/dialog'),
      ];
}

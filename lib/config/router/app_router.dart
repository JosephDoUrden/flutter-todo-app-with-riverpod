import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/config/router/router.dart';
import 'package:todo_app_riverpod/screens/screens.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRouter = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.create,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];

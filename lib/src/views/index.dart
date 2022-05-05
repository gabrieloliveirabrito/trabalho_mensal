import 'package:flutter/material.dart';

import 'home/view.dart';

class RouteModel {
  final String path;
  final Widget Function(BuildContext, {Object? args}) view;

  const RouteModel({
    required this.path,
    required this.view,
  });
}

List<RouteModel> getRoutes() {
  return [
    RouteModel(
      path: '/',
      view: (context, {args}) => const HomeView(),
    ),
  ];
}

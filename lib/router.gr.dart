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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'pages/create/create.dart' as _i2;
import 'pages/deck/deck.dart' as _i4;
import 'pages/homepage.dart' as _i1;
import 'pages/review/review.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Homepage.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Homepage(),
      );
    },
    CreateRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CreatePage(),
      );
    },
    ReviewRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ReviewPage(),
      );
    },
    DeckRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DeckPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          Homepage.name,
          path: '/',
        ),
        _i5.RouteConfig(
          CreateRoute.name,
          path: '/create-page',
        ),
        _i5.RouteConfig(
          ReviewRoute.name,
          path: '/review-page',
        ),
        _i5.RouteConfig(
          DeckRoute.name,
          path: '/deck-page',
        ),
      ];
}

/// generated route for
/// [_i1.Homepage]
class Homepage extends _i5.PageRouteInfo<void> {
  const Homepage()
      : super(
          Homepage.name,
          path: '/',
        );

  static const String name = 'Homepage';
}

/// generated route for
/// [_i2.CreatePage]
class CreateRoute extends _i5.PageRouteInfo<void> {
  const CreateRoute()
      : super(
          CreateRoute.name,
          path: '/create-page',
        );

  static const String name = 'CreateRoute';
}

/// generated route for
/// [_i3.ReviewPage]
class ReviewRoute extends _i5.PageRouteInfo<void> {
  const ReviewRoute()
      : super(
          ReviewRoute.name,
          path: '/review-page',
        );

  static const String name = 'ReviewRoute';
}

/// generated route for
/// [_i4.DeckPage]
class DeckRoute extends _i5.PageRouteInfo<void> {
  const DeckRoute()
      : super(
          DeckRoute.name,
          path: '/deck-page',
        );

  static const String name = 'DeckRoute';
}

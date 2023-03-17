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

import 'data/db.dart' as _i7;
import 'pages/create/create.dart' as _i2;
import 'pages/deck/deck.dart' as _i3;
import 'pages/homepage.dart' as _i1;
import 'pages/newdeck/newdeck.dart' as _i4;

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
    DeckRoute.name: (routeData) {
      final args = routeData.argsAs<DeckRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.DeckPage(
          key: args.key,
          deck: args.deck,
        ),
      );
    },
    NewdeckRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NewdeckPage(),
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
          DeckRoute.name,
          path: '/deck-page',
        ),
        _i5.RouteConfig(
          NewdeckRoute.name,
          path: '/newdeck-page',
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
/// [_i3.DeckPage]
class DeckRoute extends _i5.PageRouteInfo<DeckRouteArgs> {
  DeckRoute({
    _i6.Key? key,
    required _i7.DeckData deck,
  }) : super(
          DeckRoute.name,
          path: '/deck-page',
          args: DeckRouteArgs(
            key: key,
            deck: deck,
          ),
        );

  static const String name = 'DeckRoute';
}

class DeckRouteArgs {
  const DeckRouteArgs({
    this.key,
    required this.deck,
  });

  final _i6.Key? key;

  final _i7.DeckData deck;

  @override
  String toString() {
    return 'DeckRouteArgs{key: $key, deck: $deck}';
  }
}

/// generated route for
/// [_i4.NewdeckPage]
class NewdeckRoute extends _i5.PageRouteInfo<void> {
  const NewdeckRoute()
      : super(
          NewdeckRoute.name,
          path: '/newdeck-page',
        );

  static const String name = 'NewdeckRoute';
}

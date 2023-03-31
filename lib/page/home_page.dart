import 'package:flutter/material.dart';

import '../routes.dart';
import '../utils/locale_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var localizations = LocaleHelper().localizations(context);
    var paddingEdgeInsets = const EdgeInsets.all(8);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.homeTitle),
      ),
      body: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: paddingEdgeInsets,
            child: ElevatedButton(
                onPressed: () {
                  RouteHelper().push(context, RouteName.player.path);
                },
                child: Text(localizations.playerTitle)),
          ),
          Padding(
            padding: paddingEdgeInsets,
            child: ElevatedButton(
                onPressed: () {
                  RouteHelper().push(context, RouteName.paging.path);
                },
                child: Text(localizations.pagingTitle)),
          ),
          Padding(
            padding: paddingEdgeInsets,
            child: ElevatedButton(
                onPressed: () {
                  RouteHelper().push(context, RouteName.mc.path);
                },
                child: Text(localizations.mcTitle)),
          ),
        ],
      )),
    );
  }
}

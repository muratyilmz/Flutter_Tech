import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext context;

  // LocaleManager localeManager = LocaleManager.instance;
  // NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}

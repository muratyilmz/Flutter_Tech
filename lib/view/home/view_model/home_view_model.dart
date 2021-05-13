import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/path/url_path_constants.dart';
import '../model/home_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  Future<void> init() async {
    await getSampleRequest();
  }

  @action
  Future<List<NewsModel>> getSampleRequest() async {
    try {
      var dio = Dio();
      Response response;
      response = await dio.get(PathConstants.BASE);
      if (response.statusCode == 200) {
        var message = (response.data as List)
            .map((data) => NewsModel.fromJson(data))
            .toList();

        return message;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @action
  Future<NewsModel> getUserSampleRequest(String id) async {
    try {
      var dio = Dio();
      Response response;

      response = await dio.get(PathConstants.BASE + "/$id");
      if (response.statusCode == 200) {
        var uniqueresponse = NewsModel.fromJson(response.data);

        return uniqueresponse;
      } else {
        print(response.statusCode);
      }
      return null;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @observable
  bool isLoading = false;

  @observable
  GlobalKey<FormState> formState = GlobalKey();
  @observable
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
}

import 'package:flutter/material.dart';
import 'package:flutter_news_task_app/core/base/state/base_state.dart';
import 'package:flutter_news_task_app/core/base/view/base_view.dart';
import 'package:flutter_news_task_app/view/home/model/home_model.dart';
import 'package:flutter_news_task_app/view/home/view_model/home_view_model.dart';

class NewsDetails extends StatefulWidget {
  final String id;

  const NewsDetails({Key key, this.id}) : super(key: key);
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends BaseState<NewsDetails> {
  HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          viewModel = model;
        },
        onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
              appBar: AppBar(),
              body: _getUser(widget.id),
            ));
  }

  FutureBuilder<NewsModel> _getUser(String id) {
    return FutureBuilder(
      future: viewModel.getUserSampleRequest(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var newsitem = snapshot.data;

          return Container(
              child: Column(
            children: [
              Container(
                  color: Colors.red,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Text(newsitem.id)),
            ],
          ));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news_task_app/core/base/state/base_state.dart';
import 'package:flutter_news_task_app/view/home/view/news_details.dart';

import '../../../core/base/view/base_view.dart';
import '../model/home_model.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
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
        body: _getAll(),
      ),
    );
  }
}

ListView _listView(AsyncSnapshot<List<NewsModel>> snapshot) {
  return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        var item = snapshot.data[index];
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                height: MediaQuery.of(context).size.height / 2,
                child: Card(
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 15,
                  left: 15,
                  child: FlatButton(
                    shape: StadiumBorder(
                        side: BorderSide(width: 3, color: Colors.white)),
                    child: Text(
                      "KATIL",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () => NewsDetails(),
                  )),
              Positioned(
                left: 15,
                top: 240,
                right: 15,
                child: Text(
                  item.summary,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      backgroundColor: Colors.blueGrey.shade500),
                ),
              ),
              Positioned(
                  left: 360,
                  top: 25,
                  child: Icon(
                    Icons.share,
                    size: 30,
                    color: Colors.white,
                  )),
              Positioned(
                  top: 280,
                  left: 280,
                  child: FlatButton(
                    shape: StadiumBorder(
                        side: BorderSide(width: 3, color: Colors.white)),
                    child: Text(
                      "Read More",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      BuildContext contex;
                      Navigator.push(contex,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NewsDetails(id: item.id);
                      }));
                    },
                  )),
            ],
          ),
        );
      });
}

FutureBuilder<List<NewsModel>> _getAll() {
  return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _listView(snapshot);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future: HomeViewModel().getSampleRequest());
}

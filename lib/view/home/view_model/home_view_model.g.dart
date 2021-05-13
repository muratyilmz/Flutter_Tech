// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$formStateAtom = Atom(name: '_HomeViewModelBase.formState');

  @override
  GlobalKey<FormState> get formState {
    _$formStateAtom.reportRead();
    return super.formState;
  }

  @override
  set formState(GlobalKey<FormState> value) {
    _$formStateAtom.reportWrite(value, super.formState, () {
      super.formState = value;
    });
  }

  final _$scaffoldStateAtom = Atom(name: '_HomeViewModelBase.scaffoldState');

  @override
  GlobalKey<ScaffoldState> get scaffoldState {
    _$scaffoldStateAtom.reportRead();
    return super.scaffoldState;
  }

  @override
  set scaffoldState(GlobalKey<ScaffoldState> value) {
    _$scaffoldStateAtom.reportWrite(value, super.scaffoldState, () {
      super.scaffoldState = value;
    });
  }

  final _$getSampleRequestAsyncAction =
      AsyncAction('_HomeViewModelBase.getSampleRequest');

  @override
  Future<List<NewsModel>> getSampleRequest() {
    return _$getSampleRequestAsyncAction.run(() => super.getSampleRequest());
  }

  final _$getUserSampleRequestAsyncAction =
      AsyncAction('_HomeViewModelBase.getUserSampleRequest');

  @override
  Future<NewsModel> getUserSampleRequest(String id) {
    return _$getUserSampleRequestAsyncAction
        .run(() => super.getUserSampleRequest(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
formState: ${formState},
scaffoldState: ${scaffoldState}
    ''';
  }
}

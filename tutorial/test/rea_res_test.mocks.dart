// Mocks generated by Mockito 5.1.0 from annotations
// in tutorial/test/rea_res_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:ui' as _i7;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tutorial/303/reqres_resource/model/resource_model.dart' as _i4;
import 'package:tutorial/303/reqres_resource/service/reqres_service.dart'
    as _i2;
import 'package:tutorial/303/reqres_resource/viewModel/reqres_provider.dart'
    as _i3;
import 'package:tutorial/product/global/resource_context.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeIReqressService_0 extends _i1.Fake implements _i2.IReqressService {}

/// A class which mocks [ReqResProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockReqResProvider extends _i1.Mock implements _i3.ReqResProvider {
  MockReqResProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IReqressService get reqResService =>
      (super.noSuchMethod(Invocation.getter(#reqResService),
          returnValue: _FakeIReqressService_0()) as _i2.IReqressService);
  @override
  List<_i4.Data> get resourceItems =>
      (super.noSuchMethod(Invocation.getter(#resourceItems),
          returnValue: <_i4.Data>[]) as List<_i4.Data>);
  @override
  set resourceItems(List<_i4.Data>? _resourceItems) =>
      super.noSuchMethod(Invocation.setter(#resourceItems, _resourceItems),
          returnValueForMissingStub: null);
  @override
  bool get isLoading =>
      (super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false)
          as bool);
  @override
  set isLoading(bool? _isLoading) =>
      super.noSuchMethod(Invocation.setter(#isLoading, _isLoading),
          returnValueForMissingStub: null);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i5.Future<List<_i4.Data>> fetchItems() =>
      (super.noSuchMethod(Invocation.method(#fetchItems, []),
              returnValue: Future<List<_i4.Data>>.value(<_i4.Data>[]))
          as _i5.Future<List<_i4.Data>>);
  @override
  bool? saveToLocale(_i6.ResourceContext? resourceContext,
          List<_i4.Data>? resourceItems) =>
      (super.noSuchMethod(Invocation.method(
          #saveToLocale, [resourceContext, resourceItems])) as bool?);
  @override
  void addListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}

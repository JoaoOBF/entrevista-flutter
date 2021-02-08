// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$loadAtom = Atom(name: '_HomeControllerBase.load');

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  final _$loadFilterAtom = Atom(name: '_HomeControllerBase.loadFilter');

  @override
  bool get loadFilter {
    _$loadFilterAtom.reportRead();
    return super.loadFilter;
  }

  @override
  set loadFilter(bool value) {
    _$loadFilterAtom.reportWrite(value, super.loadFilter, () {
      super.loadFilter = value;
    });
  }

  final _$balanceAtom = Atom(name: '_HomeControllerBase.balance');

  @override
  Balance get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(Balance value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$statementsAtom = Atom(name: '_HomeControllerBase.statements');

  @override
  List<Statement> get statements {
    _$statementsAtom.reportRead();
    return super.statements;
  }

  @override
  set statements(List<Statement> value) {
    _$statementsAtom.reportWrite(value, super.statements, () {
      super.statements = value;
    });
  }

  final _$selectedDateNowAtom =
      Atom(name: '_HomeControllerBase.selectedDateNow');

  @override
  DateTime get selectedDateNow {
    _$selectedDateNowAtom.reportRead();
    return super.selectedDateNow;
  }

  @override
  set selectedDateNow(DateTime value) {
    _$selectedDateNowAtom.reportWrite(value, super.selectedDateNow, () {
      super.selectedDateNow = value;
    });
  }

  final _$selectedDateLastAtom =
      Atom(name: '_HomeControllerBase.selectedDateLast');

  @override
  DateTime get selectedDateLast {
    _$selectedDateLastAtom.reportRead();
    return super.selectedDateLast;
  }

  @override
  set selectedDateLast(DateTime value) {
    _$selectedDateLastAtom.reportWrite(value, super.selectedDateLast, () {
      super.selectedDateLast = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_HomeControllerBase.getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$filterAsyncAction = AsyncAction('_HomeControllerBase.filter');

  @override
  Future filter() {
    return _$filterAsyncAction.run(() => super.filter());
  }

  @override
  String toString() {
    return '''
load: ${load},
loadFilter: ${loadFilter},
balance: ${balance},
statements: ${statements},
selectedDateNow: ${selectedDateNow},
selectedDateLast: ${selectedDateLast}
    ''';
  }
}

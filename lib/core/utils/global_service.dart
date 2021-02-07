import 'dart:async';
import 'package:flutter/material.dart';

class GlobalService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future showPopUp({
    String mensagem = 'Ocorreu um erro',
  }) async {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Aviso"),
      content: Text(mensagem),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: navigatorKey.currentState.overlay.context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  static Future goTo({String router}) async {
    var _navigator = navigatorKey.currentState;
    var respose;
    if (router != null) {
      respose = await _navigator.pushNamed(
        router,
      );
    }
    return respose;
  }

  static Future gotToAndRemove({String router, Widget widget}) {
    if (router == null) {
      return navigatorKey.currentState.pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => widget),
        ModalRoute.withName('/'),
      );
    } else {
      return navigatorKey.currentState
          .pushNamedAndRemoveUntil(router, (Route<dynamic> route) => false);
    }
  }

  static void pop({result}) {
    return navigatorKey.currentState.pop(result);
  }
}

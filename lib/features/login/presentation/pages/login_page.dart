import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/core/injection/injection.dart';
import 'package:myapp/core/styles/app_colors.dart';
import 'package:myapp/core/styles/app_icons.dart';
import 'package:myapp/features/login/presentation/store/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _controllerAnimation;
  AnimationController _controllerAnimationButtom;
  Animation<double> transitionTween;
  Animation _animation;
  LoginController _controller;

  @override
  void initState() {
    _controller = injection<LoginController>();
    // TODO: implement initState
    _controllerAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controllerAnimation,
      curve: Curves.fastOutSlowIn,
    ));
    _controllerAnimationButtom = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    transitionTween = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(
      CurvedAnimation(
        parent: _controllerAnimationButtom,
        curve: Curves.ease,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    _controllerAnimationButtom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerAnimation
        .forward()
        .then((value) => _controllerAnimationButtom.forward());
    return Scaffold(
      backgroundColor: AppColors.verde,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: _body()),
    );
  }

  _body() {
    var height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            height: height * 0.28,
            child: AnimatedBuilder(
                animation: _controllerAnimation,
                builder: (cxt, _) {
                  return Transform(
                      transform: Matrix4.translationValues(
                        0.0,
                        -(_animation.value * width),
                        0.0,
                      ),
                      child: Image.asset(
                        AppIcons.logo,
                        color: Colors.white,
                        height: 120,
                        width: 120,
                      ));
                })),
        Expanded(
          child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gelo,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(60.0),
              ),
            ),
            child: SingleChildScrollView(
              child: _child(),
            ),
          ),
        )
      ],
    );
  }

  _child() {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controllerAnimation,
        builder: (BuildContext context, Widget child) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 30.0, top: 30),
            child: Transform(
              transform: Matrix4.translationValues(
                0.0,
                -(_animation.value * width),
                0.0,
              ),
              child: Column(
                children: [
                  Text(
                    "Conta digital sem anuidade completa pra você",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "É de graça, é completa, é para você!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _field("Seu nick", "Ex: joao otavio",
                      onChanged: _controller.onChangeUsername),
                  _field("Sua senha", "123",obscureText:true,
                      onChanged: _controller.onChangePassword),
                  SizedBox(
                    height: 30,
                  ),
                  _buttom()
                ],
              ),
            ),
          );
        });
  }

  _field(String labelText, String hintText,
      {TextInputType keyboardType, void Function(String) onChanged, obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Theme(
        data: ThemeData(primaryColor: AppColors.verde),
        child: TextField(
          cursorColor: AppColors.verde,
          keyboardType: keyboardType,
          onChanged: onChanged,
          obscureText: obscureText,
          style: TextStyle(color: AppColors.hint),
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            
            hintStyle: TextStyle(color: AppColors.hint),
            labelStyle: TextStyle(color: AppColors.hint),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                borderSide: BorderSide(color: AppColors.verde)),
            border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                borderSide: new BorderSide(color: AppColors.verde)),
          ),
        ),
      ),
    );
  }

  _buttom() {
    return AnimatedBuilder(
      animation: _controllerAnimationButtom,
      builder: (BuildContext context, Widget child) {
        return Observer(builder: (_) {
          return InkWell(
            onTap: _controller.isValid
                ? () async {
                    _controllerAnimationButtom.reverse();
                    await _controller.login();
                    _controllerAnimationButtom.forward();
                  }
                : null,
            child: new Container(
                width: transitionTween.value,
                height: 50,
                decoration: BoxDecoration(
                  color: _controller.isValid
                      ? AppColors.verde
                      : AppColors.cinzaBorda,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                    child: _controller.load
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text('ENTRAR',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)))),
          );
        });
      },
    );
  }
}

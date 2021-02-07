import 'package:flutter/material.dart';
import 'package:myapp/core/styles/app_colors.dart';
import 'package:myapp/core/styles/app_icons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
    return Column(
      children: [
        Container(
          height: height * 0.28,
          child: Image.asset(
            AppIcons.logo,
            color: Colors.white,
            height: 120,
            width: 120,
          ),
        ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 30.0, top: 30),
      child: Column(
        children: [
          Text(
            "Conta digital sem anuidade completa pra você",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "É de graça, é completa, é para você!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          SizedBox(
            height: 15,
          ),
          _field(TextEditingController(), "Seu email", "Ex: test@email"),
          _field(TextEditingController(), "Sua senha", "123"),
          SizedBox(
            height: 30,
          ),
          _buttom()
        ],
      ),
    );
  }

  _field(TextEditingController controller, String labelText, String hintText,
      {TextInputType keyboardType, void Function(String) onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Theme(
        data: ThemeData(primaryColor: AppColors.verde),
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Preencha o campo para continuar';
            }
            return null;
          },
          cursorColor: AppColors.verde,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
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
    return InkWell(
      child: new Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.verde,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Center(
              child: Text('ENTRAR',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16)))),
    );
  }
}

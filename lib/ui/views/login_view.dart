import 'package:flutter/material.dart';
import 'package:flutter_provider/core/viewmodels/base_model.dart';
import 'package:flutter_provider/ui/views/base_view.dart';
import 'package:flutter_provider/core/viewmodels/login_model.dart';

class LoginView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginHeader(model.errorMessage, controller),
                model.state == ViewState.Busy
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.white,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () async {
                          var loginSuccess = await model.login(controller.text);
                          if (loginSuccess) {
                            Navigator.pushNamed(context, '/');
                          }
                        },
                      )
              ],
            ),
          ),
    );
  }

  Widget LoginHeader(
      String validationMessage, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text("Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(
            "Entre com um número entre: 1-10",
            style: TextStyle(fontSize: 14),
          ),
          TextField(controller: controller)
        ],
      ),
    );
  }
}

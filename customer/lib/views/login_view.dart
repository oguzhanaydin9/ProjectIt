import 'package:customer/controller/logincontroller.dart';
import 'package:customer/views/record.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = Get.find<LoginController>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mailController.text);

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: Get.height * 0.4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(63, 63, 156, 1),
                Color.fromRGBO(90, 70, 178, 1)
              ],
            )),
          ),
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Icon(
              Icons.person_pin,
              size: 100,
              color: Colors.white,
            ),
          )),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0, 5)),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 34, color: Colors.black54),
                      ),
                      Container(
                        child: Form(
                            child: Column(
                          children: [
                            TextFormField(
                                controller: mailController,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurple,
                                            width: 2)),
                                    hintText: 'oguz@gmail.com',
                                    labelText: "Email",
                                    prefixIcon:
                                        Icon(Icons.alternate_email_rounded))),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                controller: passwordController,
                                autocorrect: false,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurple,
                                            width: 2)),
                                    hintText: '*********',
                                    labelText: "Password",
                                    prefixIcon: Icon(Icons.lock))),
                            SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                              onPressed: () {
                                LoginAccess();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledColor: Colors.grey,
                              color: Colors.deepPurple,
                              child: Container(
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 15),
                              ),
                            )
                          ],
                        )),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  LoginAccess() {
    final bool isValid = EmailValidator.validate(mailController.text);
    print(isValid);
    for (var i = 0; i < _controller.userList.length; i++) {
      if (mailController.text == _controller.userList[i].userMail &&
          passwordController.text == _controller.userList[i].password &&
          isValid) {
        Get.to(RecordPage());
        break;
      } else {
        print("Hatalı giriş");
      }
    }
  }
}

import 'package:android_ui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final GlobalKey<FormState> formField = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  saveUser() {
    final service = UserService();
    dynamic userData = {
      "Name": usernameController.text,
      "MobileNo": mobileController.text,
      "Email": emailController.text,
      "Password": passwordController.text
    };

    service.saveUser(userData).then((response) {
      SetUser(response);
    }).catchError((error) => print(error));
  }

  SetUser(response) {
    if (response.body == "Success") {
      Fluttertoast.showToast(
          msg: "Success",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 17.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Resister Page'),
       centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () {
            Navigator.pushNamed(context, 'home');
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 60,
          ),
          child: Form(
            key: formField,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    //prefixIcon: Icon(Icons.user)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Username";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Mobile No",
                    border: OutlineInputBorder(),
                    //prefixIcon: Icon(Icons.user)
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Mobile No";
                    } else if (mobileController.text.length < 10) {
                      return "Mobile no. length should not be less than 10 digits";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value!.isEmpty) {
                      return "Enter Email";
                    } else if (!emailValid) {
                      return "Enter Valid Email";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: passToggle,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password";
                    } else if (passwordController.text.length < 6) {
                      return "Password length should not be less than 6 characters";
                    }
                  },
                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    if (formField.currentState!.validate()) {
                      // call api service here
                      saveUser();
                      usernameController.clear();
                      mobileController.clear();
                      emailController.clear();
                      passwordController.clear();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

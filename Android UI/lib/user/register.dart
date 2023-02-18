import 'package:android_ui/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:stylish_dialog/stylish_dialog.dart';



class Register extends StatefulWidget
{
  const Register ({Key? key}) : super(key:key);
  @override
  RegisterState createState()=>RegisterState();
}

class RegisterState extends State<Register> {
  @override

   final Name= TextEditingController();
  final MobileNo=TextEditingController();
  final Email= TextEditingController();
  final Password=TextEditingController();

  saveUser()
  {
final service= UserService();
dynamic userData=
{
  "Name":Name.text,
  "MobileNo":MobileNo.text,
  "Email":Email.text,
  "Password":Password.text
};

service.saveUser(userData).then((response) {
      StylishDialog(
        context: context,
        alertType: StylishDialogType.SUCCESS,
        titleText: 'Success',
      );
}
).catchError((error) =>
    print(error));
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.png'),fit:BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body:Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35,top: 50),
              child:  const Text(
                'Create Account',
                style: TextStyle(color: Colors.white,fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.2,right: 35,left: 35),
                child: Column(
                  children:[
                    TextField(
                      controller: Name,
                      decoration: InputDecoration(
                          hintText: 'Name',
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: MobileNo,
                      decoration: InputDecoration(
                          hintText: 'Mobile No',
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: Email,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: Password,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Register'),
                          onPressed: () {
                            saveUser();
                          },
                        )
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed:() {
                          Navigator.pushNamed(context, 'login');
                        }, child: Text('Sign In',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            color: Color(0xff4c505b)
                        ),)
                        ),

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
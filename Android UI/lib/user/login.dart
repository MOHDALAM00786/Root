import 'package:flutter/material.dart';

class Login extends StatefulWidget
{
  const Login ({Key? key}) : super(key:key);
  @override
  LoginState createState()=>LoginState();
}
class LoginState extends State<Login>
{
  @override
  Widget build(BuildContext context )
  {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'),fit:BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35,top: 130),
              child:  const Text(
                'Welcome Back',
                style: TextStyle(color: Colors.white,fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.4,right: 35,left: 35),
                child: Column(
                  children:[
                    TextField(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [Text('Sign In', style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 30,
                          fontWeight:FontWeight.w700
                      ),
                      ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: (){},
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed:() {
                          Navigator.pushNamed(context, 'register');
                        }, child: Text('Sign Up',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            color: Color(0xff4c505b)
                        ),)
                        ),
                        TextButton(onPressed:() {}, child: Text('Forget Password',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            color: Color(0xff4c505b)
                        ),)
                        )

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
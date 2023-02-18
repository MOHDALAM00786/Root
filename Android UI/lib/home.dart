import 'package:flutter/material.dart';
import 'package:android_ui/Services/HomeService.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget
{
  const Home ({Key? key}) : super(key:key);
  @override
  HomeState createState()=>HomeState();
}
getAllCompanies()
{
  final service= HomeServices();
  service.getAllStockCompanies().then((value) =>
  print(value)
  );
}
class HomeState extends State<Home>
{
  @override
  void initState() {
    super.initState();
    getAllCompanies();
  }
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
                'Screener',
                style: TextStyle(color: Colors.white,fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.4,right: 35,left: 35),
                child: Column(
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed:() {
                          Navigator.pushNamed(context, 'login');
                        }, child: Text('Login',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            color: Color(0xff4c505b)
                        ),)
                        ),
                        TextButton(onPressed:() {Navigator.pushNamed(context, 'register');}, child: Text('Get Free Account',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            color: Color(0xff4c505b)
                        ),
                        )
                        )

                      ],

                    ),

                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Search your company',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(onPressed:() {
                      getAllCompanies();
                    }, child: Text('Companies',style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff4c505b)
                    ),)
                    ),
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
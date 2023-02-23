import 'package:flutter/material.dart';
import 'package:android_ui/Services/HomeService.dart';
import 'package:search_choices/search_choices.dart';

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
  dynamic selectedValue = TextEditingController();
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
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
                    SearchChoices.single(
                      items: menuItems,
                      value: selectedValue,
                      hint: "Select one",
                      searchHint: null,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      dialogBox: false,
                      isExpanded: true,
                      menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
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



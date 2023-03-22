import 'package:flutter/material.dart';
import 'package:android_ui/Services/HomeService.dart';


void main() {
  runApp(const MyApp());
}
getAllCompanies()
{
  final service= HomeServices();
  service.getAllStockCompanies().then((value) =>
      print(value)
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This is the root widget
// of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Company',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}
// This is the widget that will be shown
// as the homepage of your application.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getAllCompanies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search for company",
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60,),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create a new account?",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
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
                          "Sign in",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}


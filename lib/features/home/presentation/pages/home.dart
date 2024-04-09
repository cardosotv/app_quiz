import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/home/presentation/widgets/option_subjects.dart';
import 'package:app_quiz/core/domain/models/user.dart';
import '../widgets/user_score.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const routeName = '/';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomBarIndex = 0;
  User loggedUser = User();

  @override
  Widget build(BuildContext context) {
    final TokenProvider tokenProvider = Provider.of<TokenProvider>(context);
    final token = tokenProvider.token;
    // get to maximus of width screen
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        title: const Text(
          "Quiz IA",
          style: TextStyle(fontSize: 20, 
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                           ),
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                elevation: 1,
                margin: const EdgeInsets.only(top:15, bottom: 15),
                child: userScore(" Score", loggedUser, myWidht: maxWidth-20),
                ),
            ],
          ),
              optionSubject(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  width: maxWidth,
                  height: 100,
                  color: Colors.grey,
                  // child: const Text("Banner Google ADS"),
                  child: Text(token.toString()),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomBarIndex,
          backgroundColor: const Color.fromARGB(255, 223, 241, 250),
          onTap: (index) {
            setState(() {
              _bottomBarIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ]),
    );
  }
}

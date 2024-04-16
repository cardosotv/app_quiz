import 'package:app_quiz/core/data/repositories/external_api.dart';
import 'package:app_quiz/features/home/domain/entities/entity_subjects.dart';
import 'package:app_quiz/features/home/domain/use_cases/uc_subjects.dart';
import 'package:app_quiz/features/login/presentation/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/features/home/presentation/widgets/option_subjects.dart';
import 'package:app_quiz/features/user/domain/user_entity.dart' as UserEntity;
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

  @override
  Widget build(BuildContext context) {
    final TokenProvider tokenProvider = Provider.of<TokenProvider>(context);
    final token = tokenProvider.token.toString();
    UserEntity.User? user = tokenProvider.userLogged;
    UseCasesSubjects subjectUseCase = UseCasesSubjects();
    String url = "http://localhost:8080/api/v1/subjects";
    ExternalApi externalApi = ExternalApi();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
          title: const Text(
            "Quiz IA",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            textDirection: TextDirection.ltr,
          ),
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
        body: FutureBuilder(
            // future: subjectUseCase.getAllSubjects(token) as Future<dynamic>?,
            future: externalApi.execute(token, url),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null && snapshot.data.length != 0) {
                List<Subject> listSubjects =
                    subjectUseCase.getAllSubjects(snapshot.data);
                return _Home(context, listSubjects, user);
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget _Home(BuildContext context, var listSubjects, UserEntity.User? user) {
    double maxWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  elevation: 1,
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: userScore(" Score", user, myWidht: maxWidth - 20),
                ),
              ],
            ),
            optionSubject(context, listSubjects),
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
                    child: Text('User: ${user?.name}'),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}

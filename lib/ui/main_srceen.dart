import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/Utils/utils.dart';
import 'package:test_flutter/model/model.dart';
import 'package:test_flutter/ui/bloc/user_bloc.dart';
import 'package:test_flutter/ui/components/person_component.dart';
import 'package:test_flutter/ui/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<User> users;
  late ScrollController listController;
  late int lastRecuperationIndex;

  @override
  void initState() {
    lastRecuperationIndex = 1;
    users = [];
    super.initState();
    _getData(5);
    listController = ScrollController();
    listController.addListener(() {
      if (listController.position.maxScrollExtent == listController.offset || users.length<4) {
        _getData(3);
        lastRecuperationIndex += 3;
      }
    });
  }

  void _getData(int limit) {
    context.read<UserBloc>().add(GetUserEvent(
        lastRecuperationIndex: lastRecuperationIndex, limit: limit));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  "data displays",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 80, 80, 80)),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                            const SearchPage()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 235, 235, 235),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const Icon(Icons.search, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserGettedState) {
                users.addAll(state.users);
              } else if (state is UserCreatedState) {
                users.add(state.user);
              } else if (state is UserDeletedSate) {
                users.removeAt(state.index);
              } else if (state is UserUpdateState) {
                users[state.index] = state.user;
              }
            },
            builder: (context, state) {
              return users.isEmpty
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                      controller: listController,
                      itemCount: users.length + 1,
                      itemBuilder: (context, index) {
                        if (index < users.length) {
                          return PersonComponent(
                            user: users.elementAt(index),
                            index: index,
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showForm(context: context);
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/service/api_data_source.dart';
import 'package:test_flutter/ui/bloc/user_bloc.dart';
import 'package:test_flutter/ui/components/person_component.dart';

import '../model/user_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<UserModel> users;
  late ScrollController listController;

  @override
  void initState() {
    users = [];
    super.initState();
    _getData(5);
    listController = ScrollController();
    listController.addListener(() {
      if (listController.position.maxScrollExtent == listController.offset) {
        _getData(3);
      }
    });
  }

  void _getData(int limit) {
    context.read<UserBloc>().add(GetUserEvent(limit: limit));
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
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 235, 235, 235),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(Icons.search, color: Colors.grey),
                )
              ],
            ),
          ),
          const Divider(),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserGettedState) {
                users.addAll(state.users);
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
          var source = ApiDataSource();
          source.getData(5);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/Utils/utils.dart';
import 'package:test_flutter/model/model.dart';
import 'package:test_flutter/service/locale_data_source.dart';
import 'package:test_flutter/ui/bloc/user_bloc.dart';
import 'package:test_flutter/ui/components/person_component.dart';

import '../model/user_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<User> users;
  late ScrollController listController;
  late bool proccessing;

  @override
  void initState() {
    users = [];
    super.initState();
    proccessing = false;
  }

  void _getData(String search) async {
    setState(() {
      proccessing = true;
    });
    if (search.isNotEmpty) {
      var source = LocaleDataSource();
      List<User> userGetted = await source.getDataWithSearch(search);
      setState(() {
        users = userGetted;
      });
    } else {
      setState(() {
        users = [];
      });
    }
    setState(() {
      proccessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: const InputDecoration(
              hintText: "Search", hintStyle: TextStyle(color: Colors.grey)),
          onChanged: (value) {
            _getData(value);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(20),
          users.isEmpty
              ? const Center(
                  child: Text(
                  "No element",
                ))
              : proccessing
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return PersonComponent(
                          user: users.elementAt(index),
                          index: index,
                        );
                      },
                    ))
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

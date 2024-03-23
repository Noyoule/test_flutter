import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/service/api_data_source.dart';
import 'package:test_flutter/ui/components/person_component.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              scrollDirection: Axis.vertical,
              children: const [
                PersonComponent(),
                PersonComponent()
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var source  = ApiDataSource();
          source.getData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

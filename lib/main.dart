import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/model/model.dart';
import 'package:test_flutter/service/api_data_source.dart';
import 'package:test_flutter/service/locale_data_source.dart';
import 'package:test_flutter/ui/bloc/user_bloc.dart';
import 'package:test_flutter/ui/main_srceen.dart';

import 'Utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
  fetchAndSaveData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(create: (context) => UserBloc(source: LocaleDataSource()))
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            color: Colors.white,
            theme: ThemeData(
              canvasColor: const Color(0xFFFEFEFF),
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const MainScreen(),
          )),
    );
  }
}

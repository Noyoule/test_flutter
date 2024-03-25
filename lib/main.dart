import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/model/model.dart';
import 'package:test_flutter/service/api_data_source.dart';
import 'package:test_flutter/service/locale_data_source.dart';
import 'package:test_flutter/ui/bloc/user_bloc.dart';
import 'package:test_flutter/ui/loadingPage.dart';
import 'package:test_flutter/ui/main_srceen.dart';

import 'Utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    fetchAndSaveData().then((_) {
      setState(() {
        _isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    });
  }

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
          BlocProvider<UserBloc>(
              create: (context) => UserBloc(source: LocaleDataSource()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          theme: ThemeData(
            canvasColor: const Color(0xFFFEFEFF),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: _isLoading
              ? const LoadingPage()
              : _isError
                  ? const Center(
                      child: Text("an error occurred while retrieving data"))
                  : const MainScreen(),
        ),
      ),
    );
  }
}

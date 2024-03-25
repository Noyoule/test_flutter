import 'package:another_flushbar/flushbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/model/model.dart';
import 'package:test_flutter/service/locale_data_source.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/ui/components/user_form.dart';
import 'dart:io';
import 'package:image/image.dart';


Future<void> fetchAndSaveData() async {
  var source = LocaleDataSource();
  List<User> users = await User().select().top(3).toList();
  if (users.isEmpty) {
    await source.saveDataFromApi();
  }
}

Future<String> saveImage(File imageFile) async {
  final directory = await getApplicationDocumentsDirectory();
  final String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.png';
  final String path = '${directory.path}/$fileName';
  final image = decodeImage(imageFile.readAsBytesSync());
  final resizedImage = copyResize(image!, width: 72, height: 72);
  final imageResize = await File(path).create();
  await imageResize.writeAsBytes(encodePng(resizedImage));
  return path;
}

showInvalidateFormMessage(BuildContext context, String text) async {
  await Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.red,
    messageColor: Colors.black,
    padding:
    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    borderRadius: BorderRadius.circular(10),
    margin: const EdgeInsets.symmetric(horizontal: 24)
        .copyWith(top: 16),
    mainButton: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Icon(
        Icons.close,
        color: Colors.black,
        size: 20,
      ),
    ),
    messageText: Text(
        text,
        textAlign: TextAlign.center),
    duration: const Duration(seconds: 3),
  ).show(context);
}

showSuccessFormMessage(BuildContext context, String text) async {
  await Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.green,
    messageColor: Colors.black,
    padding:
    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    borderRadius: BorderRadius.circular(10),
    margin: const EdgeInsets.symmetric(horizontal: 24)
        .copyWith(top: 16),
    mainButton: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Icon(
        Icons.close,
        color: Colors.black,
        size: 20,
      ),
    ),
    messageText: Text(
        text,
        textAlign: TextAlign.center),
    duration: const Duration(seconds: 3),
  ).show(context);
}

showForm({User? user, int? index, required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: UserForm(
              user: user,
              index: index,
            )),
      );
    },
  );
}


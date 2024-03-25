import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_date_picker.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/Utils/utils.dart';
import 'package:test_flutter/model/model.dart';
import 'package:test_flutter/ui/bloc/user_bloc.dart';
import 'package:test_flutter/ui/components/form_input_component.dart';
import 'dart:io';

class UserForm extends StatefulWidget {
  final User? user;
  final int? index;
  const UserForm({super.key, this.user, this.index});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late String _selectedSex;
  late DateTime? _dateOfBrith;
  late DateTime? _dateOfRegistration;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _longitudeController;
  late TextEditingController _latitudeController;
  late TextEditingController _timezoneValueController;
  late TextEditingController _timezoneDescriptionController;
  late TextEditingController _tellController;
  late TextEditingController _cellController;
  late TextEditingController _idNameController;
  late TextEditingController _idValueController;
  late TextEditingController _sreetNameController;
  late TextEditingController _streetValueController;
  late TextEditingController _emailController;
  late String? _contry;
  late String? _contryCode;
  File? _image;

  Future getImageFromGalery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  Future getImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        _image = imageTemporary;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  bool checkFormField() {
    return (_contryCode != null &&
        _cellController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _tellController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _contry != null &&
        _stateController.text.isNotEmpty &&
        _latitudeController.text.isNotEmpty &&
        _longitudeController.text.isNotEmpty &&
        _sreetNameController.text.isNotEmpty &&
        _streetValueController.text.isNotEmpty &&
        _dateOfBrith != null &&
        _dateOfRegistration != null &&
        _idValueController.text.isNotEmpty &&
        _idNameController.text.isNotEmpty &&
        _timezoneValueController.text.isNotEmpty &&
        _timezoneDescriptionController.text.isNotEmpty);
  }

  @override
  void initState() {
    super.initState();
    _selectedSex = widget.user?.gender ?? "";
    _dateOfRegistration = widget.user != null
        ? DateTime.fromMillisecondsSinceEpoch(
            widget.user!.date_of_registration!)
        : null;
    _dateOfBrith = widget.user != null
        ? DateTime.fromMillisecondsSinceEpoch(widget.user!.date_of_birth!)
        : null;
    ;
    _firstNameController =
        TextEditingController(text: widget.user?.first ?? "");
    _lastNameController = TextEditingController(text: widget.user?.last ?? "");
    _cityController =
        TextEditingController(text: widget.user?.location_city ?? "");
    _stateController =
        TextEditingController(text: widget.user?.location_state ?? "");
    _latitudeController =
        TextEditingController(text: widget.user?.coordinate_lat ?? "");
    _longitudeController =
        TextEditingController(text: widget.user?.coordinate_long ?? "");
    _timezoneValueController =
        TextEditingController(text: widget.user?.timezone_value ?? "");
    _timezoneDescriptionController =
        TextEditingController(text: widget.user?.timezone_description ?? "");
    _tellController = TextEditingController(text: widget.user?.phone ?? "");
    _cellController = TextEditingController(text: widget.user?.cell ?? "");
    _idNameController = TextEditingController(text: widget.user?.id_name ?? "");
    _idValueController =
        TextEditingController(text: widget.user?.id_value ?? "");
    _sreetNameController =
        TextEditingController(text: widget.user?.street_name ?? "");
    _streetValueController =
        TextEditingController(text: widget.user?.street_number ?? "");
    _emailController = TextEditingController(text: widget.user?.email ?? "");
    _contry = "Togo";
    _contryCode = "TG";
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 80),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Gap(20),
                Container(
                  alignment: Alignment.center,
                  height: 320,
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: _image == null && widget.user == null
                              ? const Text(
                                  "Add an image",
                                  style: TextStyle(color: Colors.grey),
                                )
                              : _image != null
                                  ? Image.file(_image!)
                                  : widget.user != null
                                      ? widget.user!.picture_source == "network"
                                          ? Image.network(
                                              widget.user!.picture_path!)
                                          : Image.file(
                                              File(widget.user!.picture_path!))
                                      : Image.file(_image!),
                        ),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              getImageFromGalery();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey,
                                      style: BorderStyle.solid),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.image_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Gap(50),
                          InkWell(
                            onTap: () {
                              getImageFromCamera();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey,
                                      style: BorderStyle.solid),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                FormInputComponent(
                    controller: _firstNameController, hintTex: "FirstName"),
                const Gap(10),
                FormInputComponent(
                    controller: _lastNameController, hintTex: "LastName"),
                const Gap(10),
                FormInputComponent(
                    controller: _emailController, hintTex: "Email"),
                const Gap(10),
                Row(
                  children: [
                    const Text("Male"),
                    const Gap(5),
                    Radio(
                      value: 'Male',
                      groupValue: _selectedSex,
                      onChanged: (value) {
                        setState(() {
                          _selectedSex = value as String;
                        });
                      },
                    ),
                    const Gap(20),
                    const Text("Female"),
                    const Gap(5),
                    Radio(
                      value: 'Female',
                      groupValue: _selectedSex,
                      onChanged: (value) {
                        setState(() {
                          _selectedSex = value as String;
                        });
                      },
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    const Text("Date of brith"),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showMaterialDatePicker(
                            context: context,
                            selectedDate: DateTime.now(),
                            onChanged: (value) =>
                                setState(() => _dateOfBrith = value),
                            firstDate: DateTime(1940),
                            lastDate: DateTime.now(),
                          );
                        },
                        child: _dateOfBrith == null
                            ? const Icon(Icons.calendar_month)
                            : Text(_dateOfBrith!.toString()))
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    const Text("Date of registration"),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showMaterialDatePicker(
                            context: context,
                            selectedDate: DateTime.now(),
                            onChanged: (value) =>
                                setState(() => _dateOfRegistration = value),
                            firstDate: DateTime(1940),
                            lastDate: DateTime.now(),
                          );
                        },
                        child: _dateOfRegistration == null
                            ? const Icon(Icons.calendar_month)
                            : Text(_dateOfRegistration!.toString()))
                  ],
                ),
                const Gap(10),
                FormInputComponent(
                    controller: _sreetNameController, hintTex: "Street name"),
                const Gap(10),
                FormInputComponent(
                    controller: _streetValueController,
                    hintTex: "Street number"),
                const Gap(10),
                FormInputComponent(
                    controller: _cityController, hintTex: "City"),
                const Gap(10),
                FormInputComponent(
                    controller: _stateController, hintTex: "State"),
                const Gap(10),
                FormInputComponent(
                    controller: _longitudeController, hintTex: "Longitude"),
                const Gap(10),
                FormInputComponent(
                    controller: _latitudeController, hintTex: "Latitude"),
                const Gap(10),
                Row(
                  children: [
                    const Text("Contry"),
                    CountryCodePicker(
                      onChanged: (value) => {
                        _contry = value.name ?? "Togo",
                        _contryCode = value.name ?? "TG",
                      },
                      initialSelection: 'TG',
                      favorite: const ['+228', '+227'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: false,
                    ),
                  ],
                ),
                const Gap(10),
                FormInputComponent(
                    controller: _timezoneValueController,
                    hintTex: "Timezone value"),
                const Gap(10),
                FormInputComponent(
                    controller: _timezoneDescriptionController,
                    hintTex: "Timezone description"),
                const Gap(10),
                FormInputComponent(
                    controller: _tellController, hintTex: "Tell"),
                const Gap(10),
                FormInputComponent(
                    controller: _cellController, hintTex: "Cell"),
                const Gap(10),
                FormInputComponent(
                    controller: _idNameController,
                    hintTex: "Identification name"),
                const Gap(10),
                FormInputComponent(
                    controller: _idValueController,
                    hintTex: "Identification value"),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          child: Container(
            width: screenSize.width - 40,
            decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Annuler",
                    style: TextStyle(
                        fontFamily: "DM Sans", fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    if (widget.user == null) {
                      if (checkFormField() && _image != null) {
                        var path = await saveImage(_image!);
                        context.read<UserBloc>().add(CreateUserEvent(
                            nat: _contryCode!,
                            cell: _cellController.text,
                            title: _selectedSex == "male" ? "Mr" : "Ms",
                            first: _firstNameController.text,
                            lastName: _lastNameController.text,
                            gender: _selectedSex,
                            phone: _tellController.text,
                            email: _emailController.text,
                            city: _cityController.text,
                            country: _contry!,
                            state: _stateController.text,
                            latitude: _latitudeController.text,
                            longitude: _longitudeController.text,
                            streetName: _sreetNameController.text,
                            streetNumber: _streetValueController.text,
                            dateOfBirth: _dateOfBrith!,
                            registrationDate: _dateOfRegistration!,
                            idValue: _idValueController.text,
                            idName: _idNameController.text,
                            picturePath: path,
                            timezoneOffset: _timezoneValueController.text,
                            timezoneDescription:
                                _timezoneDescriptionController.text));
                        Navigator.pop(context);
                        showSuccessFormMessage(
                            context, "User created successfully");
                      } else {
                        showInvalidateFormMessage(
                            context, "You must fill all field");
                      }
                    } else {
                      if (checkFormField()) {
                        String path="" ;
                        if (_image != null) {
                          path = await saveImage(_image!);
                        }
                        context.read<UserBloc>().add(UpdateUserEvent(
                          pictureSource: path.isNotEmpty ? "locale" : "network" ,
                          index: widget.index!,
                            id: widget.user!.id!,
                            nat: _contryCode!,
                            cell: _cellController.text,
                            title: _selectedSex == "male" ? "Mr" : "Ms",
                            first: _firstNameController.text,
                            lastName: _lastNameController.text,
                            gender: _selectedSex,
                            phone: _tellController.text,
                            email: _emailController.text,
                            city: _cityController.text,
                            country: _contry!,
                            state: _stateController.text,
                            latitude: _latitudeController.text,
                            longitude: _longitudeController.text,
                            streetName: _sreetNameController.text,
                            streetNumber: _streetValueController.text,
                            dateOfBirth: _dateOfBrith!,
                            registrationDate: _dateOfRegistration!,
                            idValue: _idValueController.text,
                            idName: _idNameController.text,
                            picturePath:
                                path.isNotEmpty ? path : widget.user!.picture_path!,
                            timezoneOffset: _timezoneValueController.text,
                            timezoneDescription:
                                _timezoneDescriptionController.text));
                        Navigator.pop(context);
                        showSuccessFormMessage(
                            context, "User updated successfully");
                      } else {
                        showInvalidateFormMessage(
                            context, "You must fill all field");
                      }
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF2D8BD7)),
                    child: Text(
                      widget.user != null ? 'Valider' : 'Créer',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

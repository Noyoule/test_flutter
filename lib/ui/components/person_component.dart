import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/Utils/utils.dart';
import 'package:test_flutter/ui/bloc/user_bloc.dart';
import '../../model/model.dart';

class PersonComponent extends StatefulWidget {
  final User user;
  final int index;
  const PersonComponent({super.key, required this.user, required this.index});

  @override
  State<PersonComponent> createState() => _PersonComponentState();
}

class _PersonComponentState extends State<PersonComponent> {
  late bool isOpen;
  @override
  void initState() {
    super.initState();
    isOpen = false;
  }

  void delete(int id, int index) {
    context.read<UserBloc>().add(DeleteUserEvent(id: 1, index: widget.index));
    setState(() {
      isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const Gap(20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: widget.user.picture_source == "network"
                          ? Image.network(widget.user.picture_path!)
                          : Image.file(File(widget.user.picture_path!)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.user.title!} ${widget.user.first!} ${widget.user.last!}",
                          style: const TextStyle(
                              fontFamily: "Merriweather", fontSize: 13),
                        ),
                        const Gap(5),
                        Text(
                          widget.user.email!,
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 11),
                        ),
                        const Gap(5),
                        Text(
                          "${widget.user.age} years old",
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 12),
                        ),
                        const Gap(5),
                        Text(
                          "${widget.user.gender}",
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 12),
                        ),
                        const Gap(5),
                        Text(
                          "Registered since ${widget.user.registration_age} years",
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ],
                ),
                const Gap(5),
                Text(
                  " ${widget.user.location_city}, ${widget.user.location_state}, ${widget.user.location_contry}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.black45, fontFamily: "Lato"),
                ),
                const Divider(),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.perm_identity,
                      color: Colors.grey,
                    ),
                    const Gap(5),
                    Text("${widget.user.id_value}   ${widget.user.id_name}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.streetview,
                      color: Colors.grey,
                    ),
                    const Gap(5),
                    Text(
                        "${widget.user.street_name}, ${widget.user.street_number}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                    const Gap(5),
                    Text(
                        "${widget.user.coordinate_long},${widget.user.coordinate_long}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.timelapse_sharp,
                      color: Colors.grey,
                    ),
                    const Gap(5),
                    Text("${widget.user.timezone_value}"),
                    const Gap(2),
                    Text(
                      "${widget.user.timezone_description}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 8,
                        fontStyle: FontStyle.italic,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    const Gap(5),
                    Text("${widget.user.cell}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_iphone,
                      color: Colors.grey,
                    ),
                    const Gap(5),
                    Text("${widget.user.phone}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    CountryCodePicker(
                      initialSelection: widget.user.nat,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: false,
                      enabled: false,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                top: 0,
                right: 5,
                child: isOpen
                    ? Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isOpen = false;
                                });
                                showForm(
                                    context: context,
                                    user: widget.user,
                                    index: widget.index);
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            const Gap(10),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: IntrinsicHeight(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Are you sure you want to delete this user?',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: 'DM Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const Gap(40),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8,
                                                                horizontal: 16),
                                                        child: const Text(
                                                          'No',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        delete(widget.user.id!,
                                                            widget.index);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 8,
                                                                horizontal: 16),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xFFFF0000),
                                                                width: 1.6),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                        child: const Text(
                                                          'Delete',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF0000),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            const Gap(10),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isOpen = false;
                                });
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            const Gap(2),
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            isOpen = true;
                          });
                        },
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}

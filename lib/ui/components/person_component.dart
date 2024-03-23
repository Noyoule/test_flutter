import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter/model/user_model.dart';

class PersonComponent extends StatefulWidget {
  final UserModel user;
  const PersonComponent({super.key, required this.user});

  @override
  State<PersonComponent> createState() => _PersonComponentState();
}

class _PersonComponentState extends State<PersonComponent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0,),
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
                      child: Image.network(
                          widget.user.picture!.medium!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.user.name!.title!} ${widget.user.name!.first!} ${widget.user.name!.last!}",
                          style: const TextStyle(
                              fontFamily: "Merriweather",
                              fontSize: 13
                          ),
                        ),
                        const Gap(5),
                        Text(
                          widget.user.email!,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "${widget.user.dob!.age} years old",
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12
                          ),
                        ),
                        const Gap(5),
                        Text(
                          widget.user.gender!,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12
                          ),
                        ),
                        const Gap(5),
                        Text("Registered since ${widget.user.registered.age} years",
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              fontStyle: FontStyle.italic
                          ),)
                      ],
                    ),
                  ],
                ),
                const Gap(5),
                Text(
                  " ${widget.user.location.city}, ${widget.user.location.state}, ${widget.user.location.country}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontFamily: "Lato"
                  ),
                ),
                const Divider(),
                const Gap(5),
                Row(
                  children: [
                    const Icon(Icons.perm_identity,
                      color: Colors.grey,),
                    const Gap(5),
                    Text("${widget.user.id?.value}   ${widget.user.id?.name}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(Icons.streetview,
                      color: Colors.grey,),
                    const Gap(5),
                    Text("${widget.user.location.street?.name}, ${widget.user.location.street?.number}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                      color: Colors.grey,),
                    const Gap(5),
                    Text("${widget.user.location.coordinates?.longitude},${widget.user.location.coordinates?.latitude}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(Icons.timelapse_sharp,
                      color: Colors.grey,),
                    const Gap(5),
                    Text("${widget.user.location.timezone?.offset}"),
                    const Gap(2),
                    Text(
                      "${widget.user.location.timezone?.description}",
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
                    const Icon(Icons.phone,
                      color: Colors.grey,),
                    const Gap(5),
                    Text("${widget.user.cell}")
                  ],
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(Icons.phone_iphone,
                      color: Colors.grey,),
                    const Gap(5),
                    Text("${widget.user.phone}")
                  ],
                ),
              ],
            ),
            const Positioned(
                top: 0,
                right: 5,
                child: Icon(Icons.more_horiz,color: Colors.grey,))
          ],
        ),
      ),
    );
  }
}

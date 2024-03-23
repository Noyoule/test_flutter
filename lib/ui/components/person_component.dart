import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonComponent extends StatefulWidget {
  const PersonComponent({super.key});

  @override
  State<PersonComponent> createState() => _PersonComponentState();
}

class _PersonComponentState extends State<PersonComponent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0,),
        margin: const EdgeInsets.symmetric(vertical: 10),
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
                          "https://randomuser.me/api/portraits/med/women/58.jpg"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mr ALi Komlan",
                          style: TextStyle(
                              fontFamily: "Merriweather",
                              fontSize: 13
                          ),
                        ),
                        Gap(5),
                        Text(
                          "alikomlan@gmail.com",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12
                          ),
                        ),
                        Gap(5),
                        Text(
                          "53 years old",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12
                          ),
                        ),
                        Gap(5),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12
                          ),
                        ),
                        Gap(5),
                        Text("Registered since 3 years",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              fontStyle: FontStyle.italic
                          ),)
                      ],
                    ),
                  ],
                ),
                const Gap(5),
                const Text(
                  "1234 XK, Oosterhesselen, Zuid-Holland, Netherlands",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontFamily: "Lato"
                  ),
                ),
                const Divider(),
                const Gap(5),
                const Row(
                  children: [
                    Icon(Icons.perm_identity,
                      color: Colors.grey,),
                    Gap(5),
                    Text("91991602   BSN")
                  ],
                ),
                const Gap(5),
                const Row(
                  children: [
                    Icon(Icons.streetview,
                      color: Colors.grey,),
                    Gap(5),
                    Text("Hendrik Vinkhof, 1150")
                  ],
                ),
                const Gap(5),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                      color: Colors.grey,),
                    Gap(5),
                    Text("31.9275, -73.3391")
                  ],
                ),
                const Gap(5),
                const Row(
                  children: [
                    Icon(Icons.timelapse_sharp,
                      color: Colors.grey,),
                    Gap(5),
                    Text("0:00"),
                    Gap(2),
                    Text(
                      "Western Europe Time, London, Lisbon, Casablanca",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 8,
                        fontStyle: FontStyle.italic,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
                const Gap(5),
                const Row(
                  children: [
                    Icon(Icons.phone,
                      color: Colors.grey,),
                    Gap(5),
                    Text("(0590) 076516")
                  ],
                ),
                const Gap(5),
                const Row(
                  children: [
                    Icon(Icons.phone_iphone,
                      color: Colors.grey,),
                    Gap(5),
                    Text("(06) 79675313")
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

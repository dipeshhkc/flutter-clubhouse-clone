import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile.dart';

class SingleRoom extends StatelessWidget {
  final Room room;

  const SingleRoom({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${room.club} 🏠',
                style: Theme.of(context).textTheme.overline!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
              Text(
                room.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Stack(
                        children: [
                          UserProfile(image: room.speakers[0].imageUrl),
                          Positioned(
                              left: 28,
                              top: 20,
                              child: UserProfile(
                                image: room.speakers[1].imageUrl,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers
                                .map((e) => Text(
                                      '${e.givenName} 💬',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 16),
                                    ))
                                .toList(),
                            SizedBox(
                              height: 15,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "24 "),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.person_fill,
                                    color: Colors.grey,
                                    size: 18,
                                  )),
                                  TextSpan(text: ("/ 4 ")),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.chat_bubble,
                                    color: Colors.grey,
                                    size: 18,
                                  )),
                                ],
                              ),
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ]))
                ],
              )
            ]),
          )),
    );
  }
}

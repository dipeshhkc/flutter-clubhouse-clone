import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/room.dart';
import 'package:flutter_clubhouse_ui/widgets/upcoming_room.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.search),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.envelope_open),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.calendar),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
                padding: EdgeInsets.fromLTRB(8, 10, 20, 10),
                child: UserProfile(
                  image: currentUser.imageUrl,
                  size: 36,
                )),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
              children: [
                UpcomingRoom(
                  rooms: upcomingRoomsList,
                ),
                ...roomsList
                    .map((room) => SingleRoom(
                          room: room,
                        ))
                    .toList()
              ]),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
              )),
          Positioned(
              bottom: 60,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(24)),
                child: Text.rich(TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      CupertinoIcons.add,
                      size: 21,
                      color: Colors.white,
                    )),
                    TextSpan(
                        text: "Start a room",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500))
                  ],
                )),
              ))
        ],
      ),
    );
  }
}

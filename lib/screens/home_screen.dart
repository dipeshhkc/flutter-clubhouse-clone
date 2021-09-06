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
      body: ListView(
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
    );
  }
}

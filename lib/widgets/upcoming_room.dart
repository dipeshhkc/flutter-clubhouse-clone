import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';

import 'package:flutter_clubhouse_ui/data.dart';

class UpcomingRoom extends StatelessWidget {
  final List<Room> rooms;

  const UpcomingRoom({
    Key? key,
    required this.rooms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: rooms
            .map((room) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: room.club.isNotEmpty ? 5 : 0),
                      child: Text(room.time),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (room.club.isNotEmpty)
                            Text(
                              '${room.club.toUpperCase()} 🏠',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                              overflow: TextOverflow.ellipsis,
                            ),
                          Text(room.name),
                          SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}

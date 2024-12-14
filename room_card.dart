import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/room.dart';
import 'package:flutter_app/screens/room_screen.dart';
import 'package:flutter_app/widget/user_profile_image.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            fullscreenDialog: true, builder: (_) => RoomScreen(room: room)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                      ),
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: Stack(
                          children: [
                            if (room.speakers.length > 1)
                              Positioned(
                                left: 28.0,
                                top: 24.0,
                                child: UserProfileImage(
                                  imageUrl: room.speakers[0].imageURL,
                                  size: 48.0,
                                ),
                              ),
                            if (room.speakers.isNotEmpty)
                              UserProfileImage(
                                imageUrl: room.speakers[1].imageURL,
                                size: 48.0,
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var speaker in room.speakers)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '${speaker.firstName} ${speaker.lastName} 💬',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${(room.speakers.length) + (room.followedBySpeakers.length) + (room.others.length)} ',
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: ' / ${(room.speakers.length)} ',
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

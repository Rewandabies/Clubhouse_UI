import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/user_profile_image.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double Size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
    super.key,
    required this.imageUrl,
    required this.name,
    this.Size = 42,
    this.isNew = false,
    this.isMuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: UserProfileImage(imageUrl: imageUrl, size: Size),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ]),
                  child: const Text('🎉',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              ),
            if (isMuted)
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          )
                        ]),
                    child: const Icon(CupertinoIcons.mic_slash_fill),
                  )),
          ],
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

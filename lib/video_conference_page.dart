// Flutter imports:
import 'package:flutter/material.dart';
import 'package:mohamed/constants.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

// Project imports:
import 'common.dart';

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoConferencePageState();
}

class VideoConferencePageState extends State<VideoConferencePage> {
  final controller = ZegoUIKitPrebuiltVideoConferenceController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 1254065828, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: '6b0487343be8886ad08ff9bacdaf87c5e1ea8abc3f0116aaf98a574d41fe26c6', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: '123456',
        userName: 'user_$localUserID',
        conferenceID: widget.conferenceID,
        controller: controller,
        config: ZegoUIKitPrebuiltVideoConferenceConfig()
          ..avatarBuilder = customAvatarBuilder,
      ),
    );
  }
}

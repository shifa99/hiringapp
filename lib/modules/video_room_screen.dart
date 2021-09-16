// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hiring_app/components/colors.dart';
// import 'package:hiring_app/components/constants.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// class VideoRoomScreen extends StatefulWidget {
//   @override
//   _VideoRoomScreenState createState() => _VideoRoomScreenState();
// }

// class _VideoRoomScreenState extends State<VideoRoomScreen> {
//   int _remoteUId;
//   RtcEngine _engine;
//   bool muted = false;

//   @override
//   void initState() {
//     initForAgora();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _engine.destroy();
//     super.dispose();
//   }

//   Future<void> initForAgora() async {
//     await [Permission.microphone, Permission.camera].request();
//     _engine = await RtcEngine.create(appID);
//     await _engine.enableVideo();
//     _engine.setEventHandler(
//       RtcEngineEventHandler(
//         joinChannelSuccess: (String channel, int uid, int elapsed) {
//           print('local user $uid joind . :  $channel && $elapsed');
//           print('UID 1 :>>>>>>>>>>> $uid <<<<<<<<<<<<<<<<<<<<< ');
//         },
//         userJoined: (int uid, int elapsed) {
//           print('local user $uid joind . :  $elapsed');
//           print('UID 2 :>>>>>>>>>>> $uid <<<<<<<<<<<<<<<<<<<<< ');
//           setState(() => _remoteUId = uid);
//         },
//         userOffline: (int uid, UserOfflineReason reason) {
//           print('local user $uid joind . :  $reason');
//           print('UID 3 :>>>>>>>>>>> $uid <<<<<<<<<<<<<<<<<<<<< ');
//           setState(() => _remoteUId = null);
//         },
//       ),
//     );
//     await _engine.joinChannel('00607437dec37f64353b585a03d70fde372IAASvtUlN0qu1X2e+YjEtLd4kls/KBFuqa4G6VOy822N4ZFGZNsAAAAAEAAQK9JvDFQ/YQEAAQAKVD9h', "hiringChannel", null, 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       /* bottomNavigationBar:
//           Container(
//         height: 70,
//         color: Colors.grey[600],
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.mic_none,
//                       color: Colors.white,
//                     )),
//                 Text(
//                   'Mute',
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//             Column(
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.video_call_outlined,
//                       color: Colors.white,
//                     )),
//                 Text(
//                   'Stop Video',
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//             Column(
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.message_outlined,
//                       color: Colors.white,
//                     )),
//                 Text(
//                   'Chat',
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//           ],
//         )*/
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               width: double.infinity,
//               height: double.infinity,
//               /*  color: Colors.red,
//                   child: Image.asset(
//                 'assets/images/largeImage.png',
//                 fit: BoxFit.cover,
//               )*/
//               child: _renderRemoteVideo(),
//             ),
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.black26,
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.list),
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 50,
//               right: 0,
//               child: Container(
//                 height: 160,
//                 width: 120,
//                 color: Colors.green,
//                 /*child:
//                     Image.asset(
//                   'assets/images/smallImage.png',
//                   fit: BoxFit.cover,
//                 )*/
//                 child: _renderLocalPreview(),
//               ),
//             ),
//             /* Positioned(
//               top: 230,
//               right: 75,
//               child: CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Colors.purple,
//               ),
//             ),
//             Positioned(
//               top: 230,
//               right: 60,
//               child: CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Colors.white,
//               ),
//             ),
//             Positioned(
//               top: 230,
//               right: 45,
//               child: CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Colors.blue,
//               ),
//             ),
//             Positioned(
//               top: 230,
//               right: 30,
//               child: CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Colors.orange,
//               ),
//             ),*/

//             Positioned(
//               bottom: 10,
//               left: MediaQuery.of(context).size.width * 0.16,
//               child: Container(
//                 child: _toolbar(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// current user video
//   Widget _renderLocalPreview() {
//     return /*Transform.rotate(
//         angle: 90*pi/180,
//         child:*/
//         RtcLocalView.SurfaceView();
//   }

//   /// remote user video
//   Widget _renderRemoteVideo() {
//     if (_remoteUId != null) {
//       return RtcRemoteView.SurfaceView(
//         uid: _remoteUId,
//       );
//     } else {
//       return Text(
//         'Please wait remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Widget _toolbar() {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       // padding: EdgeInsets.symmetric(vertical: 40),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           RawMaterialButton(
//             onPressed: _onTogglleMute,
//             child: Icon(
//               muted ? Icons.mic_off : Icons.mic,
//               color: muted ? secondColor : defaultColor,
//               size: 20,
//             ),
//             padding: EdgeInsets.all(10),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: muted ? defaultColor : secondColor,
//           ),
//           RawMaterialButton(
//             onPressed: () => _onCallEnd(context),
//             child: Icon(
//               Icons.call_end,
//               color: secondColor,
//               size: 35,
//             ),
//             padding: EdgeInsets.all(15),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: Colors.red,
//           ),
//           RawMaterialButton(
//             onPressed: _onSwitchCamera,
//             child: Icon(
//               Icons.switch_camera,
//               color: defaultColor,
//               size: 20,
//             ),
//             padding: EdgeInsets.all(10),
//             shape: CircleBorder(),
//             elevation: 2.0,
//             fillColor: secondColor,
//           ),
//         ],
//       ),
//     );
//   }

//   void _onTogglleMute()
//   {
//     setState(()
//     {
//       muted = !muted;
//     });
//     _engine.muteLocalAudioStream(muted);
//   }

//   void _onCallEnd(BuildContext context) {
//     Navigator.pop(context);
//   }

//   void _onSwitchCamera()
//   {
//     _engine.switchCamera();
//   }
// }
import 'dart:async';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:permission_handler/permission_handler.dart';

class CallPage extends StatefulWidget {
  /// non-modifiable channel name of the page
  final String channelName;

  /// Creates a call page with given channel name.
  const CallPage({this.channelName});

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  RtcEngine _engine;
  Future<void> onJoin() async {
    // update input validation
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    onJoin();
    // initialize agora sdk
    initialize();
  }

  Future<void> initialize() async {
    if (appID.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.setParameters(
        '''{\"che.video.lowBitRateStreamParameter\":{\"width\":640,\"height\":360,\"frameRate\":30,\"bitRate\":800}}''');
    await _engine.joinChannel(
        tokenChat,
        'agora',
        null,
        0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(appID);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, leaveChannel: (stats) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        _users.add(uid);
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    }));
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    list.add(RtcLocalView.SurfaceView());

    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[_videoView(views[0])],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  /// Toolbar layout
  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  /// Info panel to show logs
  Widget _panel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: _infoStrings.length,
            itemBuilder: (BuildContext context, int index) {
              if (_infoStrings.isEmpty) {
                return Text(
                    "null"); // return type can't be null, a widget was required
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          _infoStrings[index],
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agora Flutter QuickStart'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            _viewRows(),
            _panel(),
            _toolbar(),
          ],
        ),
      ),
    );
  }
}

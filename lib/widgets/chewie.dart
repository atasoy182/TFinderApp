import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ChewieVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final bool fromUrl;
  final XFile xfile;

  const ChewieVideoPlayer({Key key, this.videoUrl, this.fromUrl, this.xfile}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ChewieVideoPlayerState();
  }
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  // edit tabında video seçildiğinde tekrar initialize işlemlerinin başlatılması için kullanılıyor.
  @override
  void didUpdateWidget(covariant ChewieVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    if (widget.fromUrl) {
      _videoPlayerController1 = VideoPlayerController.network(widget.videoUrl);
    } else {
      _videoPlayerController1 = VideoPlayerController.file(File(widget.xfile.path));
    }

    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return widget.videoUrl != "kaldir"
        ? Center(
            child: _chewieController != null && _chewieController.videoPlayerController.value.isInitialized
                ? Chewie(
                    controller: _chewieController,
                  )
                : Container(
                    height: 300,
                    width: _size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Yükleniyor',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
          )
        : Center(
            child: Text("Video Seçilmedi"),
          );
  }
}

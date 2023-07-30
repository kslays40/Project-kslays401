import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String subject;
  final List chapters;
  final int current;
  const VideoPlayer({
    Key? key,
    required this.subject,
    required this.chapters,
    required this.current,
  }) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  List<String> videoIds = [];
  List<String> videoTitles = [];
  YoutubePlayerController? _controller;
  int _selectedItemIndex = -1;

  // final List<bool> _isBookmarkedList = List<bool>.generate(10, (index) => false);
  var _isFullScreen = false;
  String getVideoUrl(int index) {
    return widget.chapters[index]['Videolink'];
  }

  String getName(int index) {
    return widget.chapters[index][' Name'];
  }

  String getYouTubeVideoId(String youtubeUrl) {
    Uri uri = Uri.parse(youtubeUrl);
    String videoId = uri.pathSegments.last;
    return videoId;
  }

  void fetchIds(int nowPlaying) {
    videoIds.clear();
    videoTitles.clear();
    for (int i = 0; i < widget.chapters.length; i++) {
      if (nowPlaying != i) {
        videoIds.add(getYouTubeVideoId(widget.chapters[i]['Videolink']));
        videoTitles.add(getName(i));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchIds(widget.current);

    _controller = YoutubePlayerController(
      initialVideoId: getYouTubeVideoId(getVideoUrl(widget.current)),
      flags: YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        autoPlay: false,
        mute: false,
      ),
    )..addListener(() {
        if (_controller!.value.isFullScreen != _isFullScreen) {
          setState(() {
            _isFullScreen = _controller!.value.isFullScreen;
          });
        }
        setState(() {
          // Update the video's progress state
        });
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            if (!_isFullScreen)
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      child: YoutubePlayer(
                        controller: _controller!,
                      ),
                    ),
                    SizedBox(
                      height: 587,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Text(
                                  widget.subject,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            getName(widget.current),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  top: 10,
                                ),
                                child: Text(
                                  "Videos",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  itemCount: videoIds.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        fetchIds(index);
                                        setState(() {});
                                      },
                                      child: _buildPlaylistItem(
                                        thumbnail: "images/c1.png",
                                        title: videoTitles[index],
                                        index: index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (_isFullScreen)
              Positioned.fill(
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    children: [
                      YoutubePlayer(
                        controller: _controller!,
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFullScreen = false;
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistItem({
    required String thumbnail,
    required String title,
    required int index,
  }) {
    final bool isSelected = _selectedItemIndex == index;
    final bool isVideoCompleted =
        _controller!.value.position >= _controller!.metadata.duration;
    final Color backgroundColor =
        isSelected ? Colors.grey.shade200 : Colors.transparent;
    final Color highlightedColor = isSelected
        ? const Color.fromARGB(255, 249, 237, 241)
        : Colors.white; // Updated color

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedItemIndex == index) {
            _selectedItemIndex = -1; // Pause the video if tapped again
          } else {
            _selectedItemIndex = index;
          }
        });

        if (_selectedItemIndex == index) {
          _controller!.load(videoIds[index]);
          _controller!.play();
        } else {
          _controller!.pause();
        }
      },
      child: Container(
        height: 90,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 5, bottom: 5),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: highlightedColor,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  height: 60,
                  child: Row(
                    children: [
                      if (isSelected)
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.circle,
                            color: Color(0xFF60bcfa),
                            size: 8,
                          ),
                        ),
                      Expanded(
                        child: Image.asset(
                          thumbnail,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            title,
                            style: const TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

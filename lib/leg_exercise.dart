import 'package:gym_workout/utils/export_all.dart';
import 'package:video_player/video_player.dart';

class LegExerciseScreen extends StatefulWidget {
  const LegExerciseScreen({super.key});

  @override
  State<LegExerciseScreen> createState() => _LegExerciseScreenState();
}

class _LegExerciseScreenState extends State<LegExerciseScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://www.w3schools.com/html/mov_bbb.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBars.primaryAppBar(
      //     title: "Machine Leg Press", isLeading: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300.h,
              color: Colors.black,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : const Center(child: CircularProgressIndicator()),
                  Positioned(
                    top: 36.h,
                    left: 10.w,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Machine Leg Press',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '1. Sit on a leg press machine, and place your feet against the pad about shoulder-width apart. Make sure your back is supported.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Personal Best To Beat: 154 lbs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Estimated 1 Rep Max',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '7 Jun 2021',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Set 1: 12 x 110 lbs\nSet 2: 12 x 110 lbs\nSet 3: 12 x 110 lbs\nSet 4: 12 x 110 lbs',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '31 May 2021',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Set 1: 10 x 110 lbs\nSet 2: 10 x 110 lbs\nSet 3: 10 x 110 lbs\nSet 4: 10 x 110 lbs',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        backgroundColor: Colors.black,
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

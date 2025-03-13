import 'package:gym_workout/utils/export_all.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> photos = [
      {'date': '31 May', 'image': 'https://via.placeholder.com/150/FF0000'},
      {'date': '31 May', 'image': 'https://via.placeholder.com/150/00FF00'},
      {'date': '31 May', 'image': 'https://via.placeholder.com/150/0000FF'},
      {'date': '24 May', 'image': 'https://via.placeholder.com/150/FFFF00'},
      {'date': '24 May', 'image': 'https://via.placeholder.com/150/FF00FF'},
      {'date': '24 May', 'image': 'https://via.placeholder.com/150/00FFFF'},
      {'date': '17 May', 'image': 'https://via.placeholder.com/150/000000'},
      {'date': '17 May', 'image': 'https://via.placeholder.com/150/808080'},
      {'date': '17 May', 'image': 'https://via.placeholder.com/150/C0C0C0'},
      {'date': '10 May', 'image': 'https://via.placeholder.com/150/800000'},
      {'date': '10 May', 'image': 'https://via.placeholder.com/150/008000'},
      {'date': '10 May', 'image': 'https://via.placeholder.com/150/000080'},
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 items per row
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7, // Adjust height to width ratio
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(photos[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  photos[index]['date']!,
                  style: const TextStyle(fontSize: 12.0),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

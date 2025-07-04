import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteMovies;

  const SavedPage({super.key, required this.favoriteMovies});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: favoriteMovies.isEmpty ? const Center(child: Text('No saved movies yet.')) : ListView.builder(
    //     itemCount: favoriteMovies.length,
    //     itemBuilder: (context, index) {
    //       final movie = favoriteMovies[index];
    //       return ListTile(
    //         leading: Image.network(
    //           movie['Poster'],
    //           width: 50,
    //           errorBuilder: (context, error, stackTrace) =>
    //           const Icon(Icons.image_not_supported),
    //         ),
    //         title: Text(movie['Title']),
    //         subtitle: Text(movie['Year']),
    //       );
    //     },
    //   ),
    //   backgroundColor: const Color.fromRGBO(9, 0, 27, 1),
    // );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(9, 0, 27, 1),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Favorite Movies', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: favoriteMovies.isEmpty ? const Center(child: Text('No saved movies yet.',style: TextStyle(color: Colors.white70),),)
                  : ListView.builder(
                itemCount: favoriteMovies.length,
                itemBuilder: (context, index) {
                  final movie = favoriteMovies[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(20, 20, 40, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: const Border(
                        left: BorderSide(
                          color: Color.fromRGBO(255, 0, 0, 0.5),
                          width: 10,
                        ),
                        bottom: BorderSide(
                          color: Color.fromRGBO(255, 0, 0, 0.5),
                          width: 0.001,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          movie['Poster'],
                          width: 30,
                          height: 45,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported, color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie['Title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                movie['Year'],
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
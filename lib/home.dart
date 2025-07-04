// // lib/pages/home.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List movies = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }
//
//   Future<void> fetchMovies() async {
//     final apiKey = dotenv.env['OMDB_API_KEY'] ?? '';
//     final url = Uri.parse('https://www.omdbapi.com/?s=batman&apikey=$apiKey');
//     final response = await http.get(url);
//     final data = json.decode(response.body);
//
//     if (data['Response'] == 'True') {
//       setState(() {
//         movies = data['Search'];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movie Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Color.fromRGBO(25, 0, 80, 0.4),
//       ),
//       body: Container(
//         color: Color.fromRGBO(25, 0, 80, 0.1),
//         child: GridView.builder(
//           padding: EdgeInsets.all(8),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             childAspectRatio: 0.5,
//           ),
//           itemCount: movies.length,
//           itemBuilder: (context, index) {
//             final movie = movies[index];
//             return Card(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Image.network(
//                       movie['Poster'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           movie['Title'],
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(movie['Year']),
//                             Icon(Icons.favorite_outline)
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }











//
//
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'saved.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List movies = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }
//
//   Future<void> fetchMovies() async {
//     final apiKey = dotenv.env['OMDB_API_KEY'] ?? '';
//     final url = Uri.parse('https://www.omdbapi.com/?s=batman&apikey=$apiKey');
//     final response = await http.get(url);
//     final data = json.decode(response.body);
//
//     if (data['Response'] == 'True') {
//       setState(() {
//         movies = data['Search'];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movie Explorer', style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Color.fromRGBO(25, 0, 80, 0.4),
//       ),
//       body: Container(
//         color: Color.fromRGBO(25, 0, 80, 0.1),
//         child: GridView.builder(
//           padding: EdgeInsets.all(8),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 8,
//             childAspectRatio: 0.5,
//           ),
//           itemCount: movies.length,
//           itemBuilder: (context, index) {
//             final movie = movies[index];
//             return Card(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Image.network(
//                       movie['Poster'],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           movie['Title'],
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(movie['Year']),
//                             IconButton(
//                               icon: Icon(
//                                 favoriteMovies.any((m) => m['imdbID'] == movie['imdbID'])
//                                     ? Icons.favorite
//                                     : Icons.favorite_border,
//                                 color: Colors.redAccent,
//                               ),
//                               onPressed: () {
//                                 final index = favoriteMovies.indexWhere((m) => m['imdbID'] == movie['imdbID']);
//
//                                 setState(() {
//                                   if (index >= 0) {
//                                     // Remove from favorites
//                                     favoriteMovies.removeAt(index);
//                                   } else {
//                                     // Add to favorites
//                                     favoriteMovies.add(movie);
//                                   }
//                                 });
//                               },
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieexplorer/info.dart';
import 'package:movieexplorer/profile.dart';
import 'search.dart';
import 'saved.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map<String, dynamic>> favoriteMovies = [];

class _HomePageState extends State<HomePage> {
  List movies = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final apiKey = dotenv.env['OMDB_API_KEY'] ?? '';
    final url = Uri.parse('https://www.omdbapi.com/?s=batman&apikey=$apiKey');
    final response = await http.get(url);
    final data = json.decode(response.body);

    if (data['Response']=='True') {
      setState(() {
        movies = data['Search'];
      });
    }
  }
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buildMovieGrid() {
    return Container(
      color: const Color.fromRGBO(25, 0, 80, 0.1),
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.5,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final isFav = favoriteMovies.any((m) => m['imdbID']==movie['imdbID']);

          return Card(
            color: Color.fromRGBO(41, 0, 129, 0.4),
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(movie: movie),
                        ),
                      );
                    },
                    child: Image.network(
                      movie['Poster'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Expanded(
                //   child: Image.network(
                //     movie['Poster'],
                //     fit: BoxFit.cover,
                //     errorBuilder: (context, error, stackTrace) => const Icon(Icons.downloading),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie['Title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(movie['Year']),
                          IconButton(
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isFav) {
                                  favoriteMovies.removeWhere((m) => m['imdbID'] == movie['imdbID']);
                                } else {
                                  favoriteMovies.add(movie);
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      buildMovieGrid(),
      SearchPage(movies: movies),
      SavedPage(favoriteMovies: favoriteMovies),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Explorer', style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        )),
        backgroundColor: const Color.fromRGBO(25, 0, 80, 0.4),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle,color: Colors.white,size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: pages[_currentIndex],
      backgroundColor: const Color.fromRGBO(9, 0, 27, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(25, 0, 80, 0.4),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(activeIcon: Icon(Icons.favorite), icon: Icon(Icons.favorite_border), label: 'Saved'),
        ],
      ),
    );
  }
}

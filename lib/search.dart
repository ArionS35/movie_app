// import 'package:flutter/material.dart';
//
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('Search Page')),
//       backgroundColor: const Color.fromRGBO(9, 0, 27, 1),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List movies;
  const SearchPage({Key? key, required this.movies}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List filteredMovies = [];
  @override
  void initState() {
    super.initState();
    filteredMovies = widget.movies;
  }

  void _filterMovies(String query) {
    final results = widget.movies.where((movie) {
      final title = movie['Title']?.toLowerCase() ?? '';
      return title.contains(query.toLowerCase());
  }).toList();

  setState(() {
    filteredMovies = results;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(25, 0, 80, 0.1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterMovies,
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromRGBO(9, 0, 27, 1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty ? Center(child: Text('No movies found.')) : ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];
                return ListTile(
                  leading: Image.network(
                    movie['Poster'],
                    width: 50,
                  ),
                  title: Text(movie['Title']),
                  subtitle: Text(movie['Year']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

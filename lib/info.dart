import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final Map movie;
  const InfoPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Explorer',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(25, 0, 80, 0.4),
        elevation: 0,
      ),
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(movie['Poster']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),


          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight*0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 1, spreadRadius: 10)],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      movie['Poster'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(movie['Title'] ?? 'No Title', style: TextStyle(
                    fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold
                ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text('Info about the movie', style: const TextStyle(
                    fontSize: 16, color: Colors.white70
                ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.white,),
                      label: const Text('Play', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent,),),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
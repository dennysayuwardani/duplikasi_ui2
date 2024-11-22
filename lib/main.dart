import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Untuk menampilkan rating bar

void main() {
  runApp(const MyApp()); // Menjalankan aplikasi dengan MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor untuk MyApp

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //MaterialApp itu seperti "rumah" untuk aplikasi Flutter
      debugShowCheckedModeBanner: false, //Menonaktifkan banner debug
      theme: ThemeData( //ThemeData digunakan untuk mengatur tema aplikasi
        primarySwatch: Colors.blue, //primarySwatch digunakan untuk mengatur warna utama aplikasi
      ),
      home: Scaffold( // Scaffold adalah struktur dasar halaman yang menyediakan AppBar, body, dan layout lainnya
        appBar: AppBar( // AppBar adalah bagian atas halaman yang menampilkan judul dan tombol navigasi
          title: const Text('Item Product Coffe'),
          centerTitle: true, //centerTitle digunakan untuk mengatur posisi judul di tengah
        ),
        body: ListView( //ListView adalah widget yang digunakan untuk menampilkan daftar item
          padding: const EdgeInsets.all(16),
          children: [ //children digunakan untuk menampilkan daftar item
            Center( 
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.brown[50],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                        child: Image.network( //Image.network digunakan untuk menampilkan gambar memelalui URL
                          'https://images.pexels.com/photos/7362647/pexels-photo-7362647.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          height: 250,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'Cappuccino Coffe',
                              style: TextStyle(
                                color: Colors.brown[700],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rp. 30.000',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Rp. 45.000',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough, //lineThrough digunakan untuk membuat teks ada coretan ditengahnya
                                    color: Colors.brown,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder( //RatingBar digunakan untuk menampilkan rating bar atau bintang
                                  initialRating: 3.5, //initialRating digunakan untuk mengatur rating awal
                                  minRating: 1, //minRating digunakan untuk mengatur rating minimum
                                  direction: Axis.horizontal,
                                  allowHalfRating: true, //allowHalfRating itu rating yang bisa setengah bintang
                                  itemCount: 5, 
                                  itemSize: 18,
                                  itemBuilder: (context, _) => Icon( 
                                    Icons.star,
                                    color: Colors.yellow[600],
                                  ),
                                  onRatingUpdate: (rating) { //onRatingUpdate digunakan untuk mengatur rating yang diupdate
                                    print(rating);
                                  },
                                  ignoreGestures: true, //ignoreGestures digunakan untuk mengabaikan gesture
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  '3.2k reviews',
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            TextButton(
                              onPressed: () {
                                print('Shop Now');
                              },
                              style: ButtonStyle(padding:
                                  WidgetStateProperty.resolveWith((states) { //WidgetStateProperty digunakan untuk mengatur padding di dalaman tombol
                                return const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15);
                              }), backgroundColor:
                                  WidgetStateProperty.resolveWith((states) { //WidgetStateProperty digunakan untuk mengatur warna latar belakang tombol
                                return Colors.brown[700];
                              }), foregroundColor:
                                  WidgetStateProperty.resolveWith((states) { //WidgetStateProperty digunakan untuk mengatur warna teks tombol
                                return Colors.white;
                              }), shape:
                                  WidgetStateProperty.resolveWith((states) { //WidgetStateProperty digunakan untuk mengatur bentuk tombol
                                return RoundedRectangleBorder( //RoundedRectangleBorder digunakan untuk mengatur bentuk tombol agar ujung kotak melengkung
                                  borderRadius: BorderRadius.circular(30),
                                );
                              }),
                              ), 
                              child: const Text('Shop Now'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

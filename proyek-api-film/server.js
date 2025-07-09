// Impor library yang dibutuhkan
const express = require('express');
const cors = require('cors');

// Inisialisasi aplikasi Express
const app = express();
const port = 3000; 

// Gunakan middleware
app.use(cors()); // Mengizinkan Cross-Origin Resource Sharing
app.use(express.json()); // Memungkinkan server membaca data JSON dari request

// Buat data dummy 
const movies = [
  {
    id: 1,
    title: "Inception",
    director: "Christopher Nolan",
    year: 2010,
    poster_url: "https://play-lh.googleusercontent.com/buKf27Hxendp3tLNpNtP3E-amP0o4yYV-SGKyS2u-Y3GdGRTyfNCIT5WAVs2OudOz6so5K1jtYdAUKI9nw8"
  },
  {
    id: 2,
    title: "The Dark Knight",
    director: "Christopher Nolan",
    year: 2008,
    poster_url: "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
  },
  {
    id: 3,
    title: "Parasite",
    director: "Bong Joon Ho",
    year: 2019,
    poster_url: "https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg"
  },
  {
    id: 4,
    title: "Avengers: Endgame",
    director: "Anthony & Joe Russo",
    year: 2019,
    poster_url: "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg"
  },
  {
    id: 5,
    title: "Joker",
    director: "Todd Phillips",
    year: 2019,
    poster_url: "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg"
  },
  {
    id: 6,
    title: "Spider-Man: No Way Home",
    director: "Jon Watts",
    year: 2021,
    poster_url: "https://cdn1-production-images-kly.akamaized.net/7gcMIafSjS-yWww46_C7Hs49Xu8=/1200x1200/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3635478/original/025116000_1637133546-253154135_2120128131476179_3401639978712735642_n.jpg"
  },
  {
    id: 7,
    title: "Forrest Gump",
    director: "Robert Zemeckis",
    year: 1994,
    poster_url: "https://image.tmdb.org/t/p/w500/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg"
  },
  {
    id: 8,
    title: "The Matrix",
    director: "Wachowski Brothers",
    year: 1999,
    poster_url: "https://awsimages.detik.net.id/customthumb/2005/08/02/221/MatrixCont-ist.jpg?w=600&q=90"
  },
  {
    id: 9,
    title: "Interstellar",
    director: "Christopher Nolan",
    year: 2014,
    poster_url: "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
  },
  {
    id: 10,
    title: "The Lord of the Rings: The Fellowship of the Ring",
    director: "Peter Jackson",
    year: 2001,
    poster_url: "https://image.tmdb.org/t/p/w500/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg"
  }
];

//Definisikan Endpoint (Rute) API
// Endpoint utama untuk menyapa pengguna
app.get('/', (req, res) => {
  res.send('Selamat datang di API Film!');
});

// Endpoint untuk mendapatkan SEMUA data film
// Metode: GET, URL: /api/movies
app.get('/api/movies', (req, res) => {
  res.json(movies); // Mengirimkan data 'movies' sebagai respons JSON
});

// Endpoint untuk mendapatkan SATU film berdasarkan ID
// Metode: GET, URL: /api/movies/1 (atau ID lainnya)
app.get('/api/movies/:id', (req, res) => {
    // Ambil ID dari parameter URL dan ubah ke tipe integer
    const movieId = parseInt(req.params.id);
    // Cari film di dalam array 'movies' yang ID-nya cocok
    const movie = movies.find(m => m.id === movieId);

    // Jika film tidak ditemukan, kirim status 404 (Not Found)
    if (!movie) {
        return res.status(404).send('Film dengan ID tersebut tidak ditemukan.');
    }

    // Jika film ditemukan, kirim data film tersebut
    res.json(movie);
});


//Jalankan server
app.listen(port, () => {
  console.log(`Server API berjalan di http://localhost:${port}`);
});
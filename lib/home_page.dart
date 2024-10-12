import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userEmail;
  String? userNamaLengkap;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userNamaLengkap =
          prefs.getString('userNamaLengkap') ?? 'Pengguna tidak dikenal';
      userEmail = prefs.getString('userEmail') ?? 'Pengguna tidak dikenal';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic>? args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return DinamisData(
      userEmail: userEmail,
      userNamaLengkap: userNamaLengkap,
    );
  }
}

class DinamisData extends StatelessWidget {
  final String? userEmail;
  final String? userNamaLengkap;

  const DinamisData({Key? key, this.userEmail, this.userNamaLengkap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang di Halaman Home!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nama lengkap: $userNamaLengkap\nEmail: $userEmail',
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 40),
              const Text(
                'Nikmati tampilan yang menarik dan interaktif!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Elemen dekoratif sebagai penghias
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.emoji_emotions,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaticData extends StatelessWidget {
  const StaticData({
    super.key,
    required this.args,
  });

  final Map<String, dynamic> args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              color: Colors.blue,
              size: 100,
            ),
            Text(
              'Selamat datang',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 60,
            ),
            Text('${args['email']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 60,
            ),
            Text('Flutter Pemula',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Keluar'))
          ],
        ),
      ),
    );
  }
}

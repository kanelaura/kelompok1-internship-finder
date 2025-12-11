import 'package:flutter/material.dart';

void main() {
  runApp(const InternshipFinderApp());
}

class InternshipFinderApp extends StatelessWidget {
  const InternshipFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internship Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

// SCREEN 1: MAIN SCREEN (Bottom Navigation)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SavedScreen(),
    ApplicationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Applications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// SCREEN 2: HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk internship
    final internships = [
      {
        'title': 'Frontend Developer Intern',
        'company': 'Tech Solutions Indonesia',
        'location': 'Jakarta',
        'type': 'Full-time',
        'salary': 'Rp 2.000.000',
      },
      {
        'title': 'UI/UX Designer Intern',
        'company': 'Creative Studio',
        'location': 'Bandung',
        'type': 'Part-time',
        'salary': 'Rp 1.500.000',
      },
      {
        'title': 'Mobile Developer Intern',
        'company': 'App Innovations',
        'location': 'Surabaya',
        'type': 'Full-time',
        'salary': 'Rp 2.500.000',
      },
      {
        'title': 'Data Analyst Intern',
        'company': 'Data Insights Co',
        'location': 'Jakarta',
        'type': 'Remote',
        'salary': 'Rp 2.000.000',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Internship Finder'),
        actions: [
          // ALERT: Notification Dialog
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Notifikasi'),
                  content: const Text('Tidak ada notifikasi baru.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          // Search Bar
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Cari magang...', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Header dengan Filter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lowongan Magang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton.icon(
                onPressed: () {
                  _showFilterBottomSheet(context);
                },
                icon: const Icon(Icons.filter_list),
                label: const Text('Filter'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // List Internship
          ...internships.map((internship) {
            return Card(
              margin: const EdgeInsets.only(bottom: 15),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.work, color: Colors.white),
                ),
                title: Text(
                  internship['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(internship['company'] as String),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14),
                        const SizedBox(width: 3),
                        Text(internship['location'] as String),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      internship['salary'] as String,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Tersimpan!')));
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InternshipDetailScreen(internship: internship),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  // ALERT: Filter Bottom Sheet
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Filter Magang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Dropdown Lokasi
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Lokasi',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('Semua Lokasi')),
                  DropdownMenuItem(value: 'jakarta', child: Text('Jakarta')),
                  DropdownMenuItem(value: 'bandung', child: Text('Bandung')),
                  DropdownMenuItem(value: 'surabaya', child: Text('Surabaya')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),
              // Dropdown Tipe
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipe Pekerjaan',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('Semua Tipe')),
                  DropdownMenuItem(value: 'fulltime', child: Text('Full-time')),
                  DropdownMenuItem(value: 'parttime', child: Text('Part-time')),
                  DropdownMenuItem(value: 'remote', child: Text('Remote')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              // Tombol
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Filter diterapkan!')),
                  );
                },
                child: const Text('Terapkan Filter'),
              ),
            ],
          ),
        );
      },
    );
  }
}

// SCREEN 3: SEARCH SCREEN
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
            hintText: 'Cari magang...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _isSearching = value.isNotEmpty;
            });
          },
        ),
        actions: [
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _isSearching = false;
                });
              },
            ),
        ],
      ),
      body: _isSearching
          ? ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.work),
                    title: Text('Hasil Pencarian ${index + 1}'),
                    subtitle: const Text('Nama Perusahaan'),
                    onTap: () {},
                  ),
                );
              },
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 80, color: Colors.grey),
                  SizedBox(height: 15),
                  Text(
                    'Cari lowongan magang',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// SCREEN 4: INTERNSHIP DETAIL SCREEN
class InternshipDetailScreen extends StatelessWidget {
  final Map<String, dynamic> internship;

  const InternshipDetailScreen({super.key, required this.internship});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Magang'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur berbagi segera hadir!')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Tersimpan!')));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue[50],
              child: Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.work, size: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      internship['title'] as String,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      internship['company'] as String,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 5),
                        Text(internship['location'] as String),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Info Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Icon(Icons.work_outline, size: 30),
                            const SizedBox(height: 5),
                            const Text('Tipe'),
                            Text(
                              internship['type'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Icon(Icons.payments, size: 30),
                            const SizedBox(height: 5),
                            const Text('Gaji'),
                            Text(
                              internship['salary'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Deskripsi
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Pekerjaan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kami mencari intern yang bersemangat untuk bergabung dengan tim kami. '
                    'Ini adalah kesempatan bagus untuk mendapatkan pengalaman kerja nyata.\n\n'
                    'Tanggung Jawab:\n'
                    '• Membantu tim dalam operasional harian\n'
                    '• Berpartisipasi dalam rapat tim\n'
                    '• Belajar teknologi baru\n'
                    '• Berkontribusi pada proyek yang sedang berjalan',
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Persyaratan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '• Sedang menempuh pendidikan terkait\n'
                    '• Kemampuan komunikasi yang baik\n'
                    '• Mampu bekerja dalam tim\n'
                    '• Bersemangat untuk belajar',
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Benefit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '• Uang saku kompetitif\n'
                    '• Mentoring dari profesional\n'
                    '• Jam kerja fleksibel\n'
                    '• Sertifikat setelah selesai',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      // Tombol Apply
      bottomSheet: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Form aplikasi ditambahkan di main.dart utama'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text('Lamar Sekarang', style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}

// PLACEHOLDER SCREENS
class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tersimpan')),
      body: const Center(
        child: Text('Screen Tersimpan - Ada di main.dart Utama'),
      ),
    );
  }
}

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lamaran Saya')),
      body: const Center(
        child: Text('Screen Lamaran - Ada di main.dart Utama'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: const Center(
        child: Text(
          'Screen Profil - Ada di dzikra-profile.dart & main.dart Utama',
        ),
      ),
    );
  }
}

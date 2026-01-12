import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../models/internship.dart';
import '../utils/constants.dart';
import '../widgets/internship_card.dart';
import '../widgets/horizontal_internship_card.dart';
import '../widgets/loading_widget.dart';
import 'internship_detail_screen.dart';
import 'my_applications_screen.dart';
import 'bookmark_screen.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const _InternshipListScreen(),
    const MyApplicationsScreen(),
    const BookmarkScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await AuthService.logout();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF1e3c72),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'Karier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            activeIcon: Icon(Icons.description),
            label: 'Lamaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  String _getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Karier';
      case 1:
        return 'Lamaran Saya';
      case 2:
        return 'Bookmark';
      case 3:
        return 'Profil';
      default:
        return 'Internship Finder';
    }
  }
}

class _InternshipListScreen extends StatefulWidget {
  const _InternshipListScreen();

  @override
  State<_InternshipListScreen> createState() => _InternshipListScreenState();
}

class _InternshipListScreenState extends State<_InternshipListScreen> {
  final ApiService _apiService = ApiService();
  List<Internship> _internships = [];
  bool _isLoading = true;
  String _errorMessage = '';
  final TextEditingController _searchController = TextEditingController();
  String _selectedProvince = '';
  String _selectedCity = '';

  // Provinsi Indonesia
  final List<String> _provinces = [
    'ACEH',
    'BALI',
    'BANTEN',
    'BENGKULU',
    'DI YOGYAKARTA',
    'DKI JAKARTA',
    'GORONTALO',
    'JAMBI',
    'JAWA BARAT',
    'JAWA TENGAH',
    'JAWA TIMUR',
    'KALIMANTAN BARAT',
    'KALIMANTAN SELATAN',
    'KALIMANTAN TENGAH',
    'KALIMANTAN TIMUR',
    'KALIMANTAN UTARA',
    'KEPULAUAN BANGKA BELITUNG',
    'KEPULAUAN RIAU',
    'LAMPUNG',
    'MALUKU',
    'MALUKU UTARA',
    'NUSA TENGGARA BARAT',
    'NUSA TENGGARA TIMUR',
    'PAPUA',
    'PAPUA BARAT',
    'RIAU',
    'SULAWESI BARAT',
    'SULAWESI SELATAN',
    'SULAWESI TENGAH',
    'SULAWESI TENGGARA',
    'SULAWESI UTARA',
    'SUMATERA BARAT',
    'SUMATERA SELATAN',
    'SUMATERA UTARA',
  ];

  // Kota untuk DKI Jakarta (sebagai contoh)
  final Map<String, List<String>> _citiesByProvince = {
    'DKI JAKARTA': [
      'JAKARTA BARAT',
      'JAKARTA PUSAT',
      'JAKARTA SELATAN',
      'JAKARTA TIMUR',
      'JAKARTA UTARA',
      'KABUPATEN ADMINISTRASI KEPULAUAN SERIBU',
    ],
    'JAWA BARAT': [
      'BANDUNG',
      'BEKASI',
      'BOGOR',
      'CIREBON',
      'DEPOK',
      'SUKABUMI',
      'TASIKMALAYA',
    ],
  };

  // Kategori lowongan
  final List<String> _categories = [
    'IT & Teknologi',
    'Keuangan & Akuntansi',
    'Marketing & Sales',
    'Desain & Kreatif',
    'Human Resources',
    'Administrasi',
  ];

  @override
  void initState() {
    super.initState();
    _loadInternships();
  }

  Future<void> _loadInternships() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await _apiService.get(Constants.internshipsEndpoint);
      final List<dynamic> data = response['data'] ?? response;

      setState(() {
        _internships = data.map((json) => Internship.fromJson(json)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal memuat data magang';
        _isLoading = false;
      });
    }
  }

  List<Internship> _getInternshipsByCategory(String category) {
    // Filter internships by category or return random subset
    return _internships.take(5).toList();
  }

  List<Internship> _getFilteredInternships() {
    String searchQuery = _searchController.text.toLowerCase().trim();

    if (searchQuery.isEmpty && _selectedProvince.isEmpty) {
      return _internships;
    }

    return _internships.where((internship) {
      bool matchesSearch = true;
      bool matchesLocation = true;

      // Filter by search query (company name or job title)
      if (searchQuery.isNotEmpty) {
        matchesSearch =
            internship.company.toLowerCase().contains(searchQuery) ||
                internship.title.toLowerCase().contains(searchQuery);
      }

      // Filter by location
      if (_selectedProvince.isNotEmpty) {
        if (_selectedCity.isNotEmpty) {
          matchesLocation = internship.location
              .toLowerCase()
              .contains(_selectedCity.toLowerCase());
        } else {
          matchesLocation = internship.location
              .toLowerCase()
              .contains(_selectedProvince.toLowerCase());
        }
      }

      return matchesSearch && matchesLocation;
    }).toList();
  }

  void _showLocationFilter() {
    String tempProvince = _selectedProvince;
    String tempCity = _selectedCity;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxHeight: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Lokasi Cari Kerja',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Saat ini Kitalulus hanya menyediakan lowongan pekerjaan di daerah tertentu sesuai dengan opsi pilihan di bawah ini:',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  initialValue: tempProvince.isEmpty ? null : tempProvince,
                  decoration: InputDecoration(
                    labelText: 'Pilih Provinsi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  items: _provinces.map((province) {
                    return DropdownMenuItem(
                      value: province,
                      child: Text(province),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setDialogState(() {
                      tempProvince = value ?? '';
                      tempCity = ''; // Reset city when province changes
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: tempCity.isEmpty ? null : tempCity,
                  decoration: InputDecoration(
                    labelText: 'Pilih Kota',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  items: tempProvince.isEmpty
                      ? []
                      : (_citiesByProvince[tempProvince] ?? []).map((city) {
                          return DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                  onChanged: tempProvince.isEmpty
                      ? null
                      : (value) {
                          setDialogState(() {
                            tempCity = value ?? '';
                          });
                        },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedProvince = tempProvince;
                        _selectedCity = tempCity;
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCategoryInternships(String category) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  padding: const EdgeInsets.all(16),
                  itemCount: _getInternshipsByCategory(category).length,
                  itemBuilder: (context, index) {
                    final internship =
                        _getInternshipsByCategory(category)[index];
                    return InternshipCard(
                      internship: internship,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InternshipDetailScreen(
                              internship: internship,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const LoadingWidget();
    }

    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadInternships,
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    if (_internships.isEmpty) {
      return const Center(
        child: Text('Tidak ada lowongan magang'),
      );
    }

    return Column(
      children: [
        // Header with brand name
        Container(
          color: Colors.blue,
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Brand Name
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Internship Finder',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {}); // Trigger rebuild to filter results
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari nama pekerjaan/perusahaan',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Location filter button
              InkWell(
                onTap: _showLocationFilter,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _selectedProvince.isEmpty
                              ? 'Cari Provinsi / Kota / Kabupaten'
                              : _selectedCity.isEmpty
                                  ? _selectedProvince
                                  : '$_selectedCity, $_selectedProvince',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Content
        Expanded(
          child: RefreshIndicator(
            onRefresh: _loadInternships,
            child: Builder(
              builder: (context) {
                final filteredInternships = _getFilteredInternships();

                if (filteredInternships.isEmpty) {
                  return ListView(
                    children: [
                      const SizedBox(height: 100),
                      Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Tidak ada hasil untuk pencarian Anda',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Coba kata kunci atau filter lain',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                // Show filtered results by category
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: _searchController.text.isNotEmpty ||
                          _selectedProvince.isNotEmpty
                      ? 1
                      : _categories.length,
                  itemBuilder: (context, index) {
                    // If filtering, show all results in one section
                    if (_searchController.text.isNotEmpty ||
                        _selectedProvince.isNotEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Hasil Pencarian (${filteredInternships.length})',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...filteredInternships.map((internship) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: InternshipCard(
                                internship: internship,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => InternshipDetailScreen(
                                        internship: internship,
                                      ),
                                    ),
                                  ).then((_) => _loadInternships());
                                },
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    }

                    // Otherwise show by category
                    final category = _categories[index];
                    final categoryInternships =
                        _getInternshipsByCategory(category);

                    if (categoryInternships.isEmpty)
                      return const SizedBox.shrink();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category header
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    _showCategoryInternships(category),
                                child: const Text('Lihat Semua'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Horizontal scrollable cards
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: categoryInternships.length,
                            itemBuilder: (context, idx) {
                              return HorizontalInternshipCard(
                                internship: categoryInternships[idx],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => InternshipDetailScreen(
                                        internship: categoryInternships[idx],
                                      ),
                                    ),
                                  ).then((_) => _loadInternships());
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

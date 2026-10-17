import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StudySwapApp());
}

class StudySwapApp extends StatelessWidget {
  const StudySwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudySwap',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}

class AppColors {
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryLight = Color(0xFFDBEAFE);
  static const Color primarySurface = Color(0xFFEFF6FF);

  static const Color available = Color(0xFF10B981);
  static const Color availableBg = Color(0xFFD1FAE5);

  static const Color reserved = Color(0xFFF59E0B);
  static const Color reservedBg = Color(0xFFFEF3C7);

  static const Color borrowed = Color(0xFF6366F1);
  static const Color borrowedBg = Color(0xFFE0E7FF);

  static const Color swapped = Color(0xFF64748B);
  static const Color swappedBg = Color(0xFFF1F5F9);

  static const Color background = Color(0xFFF8FAFC);
  static const Color card = Colors.white;
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFF1F5F9);

  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF94A3B8);

  static const Color buyColor = Color(0xFF2563EB);
  static const Color buyBg = Color(0xFFEFF6FF);

  static const Color sellColor = Color(0xFF059669);
  static const Color sellBg = Color(0xFFECFDF5);

  static const Color borrowColor = Color(0xFF4F46E5);
  static const Color borrowBg = Color(0xFFEEF2FF);

  static const Color donateColor = Color(0xFFE11D48);
  static const Color donateBg = Color(0xFFFFF1F2);

  static const Color exchangeColor = Color(0xFF0D9488);
  static const Color exchangeBg = Color(0xFFF0FDFA);

  static const Color needBoardColor = Color(0xFF7C3AED);
  static const Color needBoardBg = Color(0xFFFAF5FF);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.card,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.card,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: AppColors.border, width: 1),
        ),
      ),
    );
  }
}

enum ActionType { buy, sell, borrow, donate, exchange, needBoard }
enum AvailabilityStatus { available, reserved, borrowed, swapped }

class ResourceOwner {
  final String id;
  final String name;
  final String department;
  final String year;
  final String phone;

  ResourceOwner({
    required this.id,
    required this.name,
    required this.department,
    required this.year,
    this.phone = '+91 98765 43210',
  });
}

class ResourceCategory {
  final String id;
  final String name;
  final IconData icon;
  final int count;

  ResourceCategory({
    required this.id,
    required this.name,
    required this.icon,
    this.count = 0,
  });
}

class ResourceItem {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String categoryName;
  final ActionType actionType;
  final double price;
  final bool isFree;
  final String condition;
  final String location;
  final String departmentTarget;
  final AvailabilityStatus availability;
  final String imageUrl;
  final DateTime createdAt;
  final ResourceOwner owner;
  final bool isRecommended;
  final int? borrowPeriodDays;

  ResourceItem({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.categoryName,
    required this.actionType,
    required this.price,
    this.isFree = false,
    required this.condition,
    required this.location,
    required this.departmentTarget,
    this.availability = AvailabilityStatus.available,
    required this.imageUrl,
    DateTime? createdAt,
    required this.owner,
    this.isRecommended = false,
    this.borrowPeriodDays,
  }) : createdAt = createdAt ?? DateTime.now();
}

class NavigationActionItem {
  final ActionType type;
  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color accentColor;
  final int? badgeCount;

  NavigationActionItem({
    required this.type,
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.accentColor,
    this.badgeCount,
  });
}

class MockDataService {
  static final List<ResourceCategory> categories = [
    ResourceCategory(id: 'all', name: 'All Resources', icon: Icons.grid_view_rounded, count: 42),
    ResourceCategory(id: 'textbooks', name: 'Textbooks & Ref.', icon: Icons.menu_book_rounded, count: 18),
    ResourceCategory(id: 'engineering_kits', name: 'Lab & IoT Kits', icon: Icons.memory_rounded, count: 7),
    ResourceCategory(id: 'calculators', name: 'Calculators', icon: Icons.calculate_rounded, count: 5),
    ResourceCategory(id: 'notes', name: 'Topper Notes', icon: Icons.note_alt_outlined, count: 12),
    ResourceCategory(id: 'drafting_tools', name: 'Drafting Tools', icon: Icons.architecture_rounded, count: 4),
    ResourceCategory(id: 'lab_coats', name: 'Lab Coats / Aprons', icon: Icons.medical_services_outlined, count: 6),
    ResourceCategory(id: 'electronics', name: 'Electronics', icon: Icons.laptop_chromebook_rounded, count: 8),
  ];

  static final List<NavigationActionItem> navigationActions = [
    NavigationActionItem(
      type: ActionType.buy,
      label: 'Buy',
      subtitle: 'Affordable gear',
      icon: Icons.shopping_bag_outlined,
      color: AppColors.buyBg,
      accentColor: AppColors.buyColor,
    ),
    NavigationActionItem(
      type: ActionType.sell,
      label: 'Sell',
      subtitle: 'List your items',
      icon: Icons.sell_outlined,
      color: AppColors.sellBg,
      accentColor: AppColors.sellColor,
    ),
    NavigationActionItem(
      type: ActionType.borrow,
      label: 'Borrow',
      subtitle: 'For exam season',
      icon: Icons.access_time_rounded,
      color: AppColors.borrowBg,
      accentColor: AppColors.borrowColor,
    ),
    NavigationActionItem(
      type: ActionType.donate,
      label: 'Donate',
      subtitle: 'Help juniors free',
      icon: Icons.volunteer_activism_outlined,
      color: AppColors.donateBg,
      accentColor: AppColors.donateColor,
    ),
    NavigationActionItem(
      type: ActionType.exchange,
      label: 'Exchange',
      subtitle: 'Swap books & kits',
      icon: Icons.swap_horiz_rounded,
      color: AppColors.exchangeBg,
      accentColor: AppColors.exchangeColor,
    ),
    NavigationActionItem(
      type: ActionType.needBoard,
      label: 'Need Board',
      subtitle: 'Request an item',
      icon: Icons.campaign_outlined,
      color: AppColors.needBoardBg,
      accentColor: AppColors.needBoardColor,
      badgeCount: 5,
    ),
  ];

  static final List<ResourceItem> mockResources = [
    ResourceItem(
      id: 'res_001',
      title: 'Higher Engineering Mathematics - B.S. Grewal (44th Ed.)',
      description: 'Standard syllabus textbook for Sem 1 & 2 calculus and differential equations. Clean pages, no highlighting on formulas.',
      categoryId: 'textbooks',
      categoryName: 'Textbooks',
      actionType: ActionType.buy,
      price: 320.0,
      isFree: false,
      condition: 'Like New',
      location: 'Hostel Block 3, Ground Floor',
      departmentTarget: 'First Year (All Branches)',
      availability: AvailabilityStatus.available,
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=600&q=80',
      isRecommended: true,
      owner: ResourceOwner(
        id: 'usr_201',
        name: 'Aditya Kulkarni',
        department: 'Computer Engineering',
        year: '3rd Year',
      ),
    ),
    ResourceItem(
      id: 'res_002',
      title: 'Arduino Uno R3 Starter Kit with 20+ Sensors & LCD',
      description: 'Complete IoT & Embedded systems kit with breadboard, ultrasonic sensor, jumper wires, servo motor, and display module.',
      categoryId: 'engineering_kits',
      categoryName: 'Lab & IoT Kits',
      actionType: ActionType.borrow,
      price: 0.0,
      isFree: true,
      condition: 'Good',
      location: 'Campus Tech Park, Lab 402',
      departmentTarget: 'E&TC / CSE / IT',
      availability: AvailabilityStatus.available,
      imageUrl: 'https://images.unsplash.com/photo-1553406830-ef2513450d76?w=600&q=80',
      isRecommended: true,
      borrowPeriodDays: 14,
      owner: ResourceOwner(
        id: 'usr_202',
        name: 'Tanvi Shinde',
        department: 'Electronics & Telecomm.',
        year: 'Final Year',
      ),
    ),
    ResourceItem(
      id: 'res_003',
      title: 'Casio fx-991EX ClassWiz Scientific Calculator',
      description: 'High-speed matrix, complex numbers, and equation solver. Allowed in university exams. Clean condition with slide cover.',
      categoryId: 'calculators',
      categoryName: 'Calculators',
      actionType: ActionType.sell,
      price: 650.0,
      isFree: false,
      condition: 'Brand New',
      location: 'Central Library, Desk 18',
      departmentTarget: 'All Engineering Students',
      availability: AvailabilityStatus.available,
      imageUrl: 'https://images.unsplash.com/photo-1594980596870-8aa52a78d8cd?w=600&q=80',
      isRecommended: true,
      owner: ResourceOwner(
        id: 'usr_203',
        name: 'Rohan Mehta',
        department: 'Mechanical Engineering',
        year: '2nd Year',
      ),
    ),
    ResourceItem(
      id: 'res_004',
      title: 'Engineering Graphics Mini Drafter + Sheet Holder Tube',
      description: 'Omega mini drafter with clamp, scale, and sturdy plastic sheet carry container. Essential for FE Graphics practicals.',
      categoryId: 'drafting_tools',
      categoryName: 'Drafting Tools',
      actionType: ActionType.donate,
      price: 0.0,
      isFree: true,
      condition: 'Good',
      location: 'Girls Hostel B, Room 214',
      departmentTarget: 'First Year Engineering',
      availability: AvailabilityStatus.available,
      imageUrl: 'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?w=600&q=80',
      isRecommended: false,
      owner: ResourceOwner(
        id: 'usr_204',
        name: 'Pooja Verma',
        department: 'Civil Engineering',
        year: '3rd Year',
      ),
    ),
    ResourceItem(
      id: 'res_005',
      title: 'Database Management Systems (DBMS) Topper Handwritten Notes',
      description: 'Complete Units 1 to 6 handwritten notes with clear ER diagrams, SQL queries, normalization charts, and past 5 years solved university papers.',
      categoryId: 'notes',
      categoryName: 'Topper Notes',
      actionType: ActionType.exchange,
      price: 0.0,
      isFree: false,
      condition: 'Handwritten Notes',
      location: 'Campus Canteen Gazebo',
      departmentTarget: 'Computer / IT / AIDS (Sem 4)',
      availability: AvailabilityStatus.available,
      imageUrl: 'https://images.unsplash.com/photo-1517842645767-c639042777db?w=600&q=80',
      isRecommended: true,
      owner: ResourceOwner(
        id: 'usr_205',
        name: 'Sahil Deshmukh',
        department: 'Information Technology',
        year: '3rd Year',
      ),
    ),
    ResourceItem(
      id: 'res_006',
      title: 'White Chemistry & Workshop Cotton Lab Coat (Size L)',
      description: 'Thick protective fabric with dual pockets. Sanitized and washed. Required for Chemistry, Physics, and Mechanical workshop practicals.',
      categoryId: 'lab_coats',
      categoryName: 'Lab Coats / Aprons',
      actionType: ActionType.buy,
      price: 180.0,
      isFree: false,
      condition: 'Like New',
      location: 'Main Gate Cycle Stand',
      departmentTarget: 'First & Second Year Students',
      availability: AvailabilityStatus.reserved,
      imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=600&q=80',
      isRecommended: false,
      owner: ResourceOwner(
        id: 'usr_206',
        name: 'Nikhil Rane',
        department: 'Chemical Engineering',
        year: '2nd Year',
      ),
    ),
  ];

  static List<ResourceItem> getRecommended() => mockResources.where((r) => r.isRecommended).toList();

  static List<ResourceItem> getRecent() {
    final list = List<ResourceItem>.from(mockResources);
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  static List<ResourceItem> search({
    String query = '',
    String categoryId = 'all',
    ActionType? actionType,
    bool availableOnly = false,
  }) {
    return mockResources.where((item) {
      if (query.isNotEmpty) {
        final q = query.toLowerCase();
        final match = item.title.toLowerCase().contains(q) ||
            item.description.toLowerCase().contains(q) ||
            item.location.toLowerCase().contains(q) ||
            item.departmentTarget.toLowerCase().contains(q);
        if (!match) return false;
      }

      if (categoryId != 'all' && item.categoryId != categoryId) return false;
      if (actionType != null && item.actionType != actionType) return false;
      if (availableOnly && item.availability != AvailabilityStatus.available) {
        return false;
      }

      return true;
    }).toList();
  }
}

class StatusBadge extends StatelessWidget {
  final AvailabilityStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    late Color bg;
    late Color text;
    late String label;

    switch (status) {
      case AvailabilityStatus.available:
        bg = AppColors.availableBg;
        text = AppColors.available;
        label = 'Available';
        break;
      case AvailabilityStatus.reserved:
        bg = AppColors.reservedBg;
        text = AppColors.reserved;
        label = 'Reserved';
        break;
      case AvailabilityStatus.borrowed:
        bg = AppColors.borrowedBg;
        text = AppColors.borrowed;
        label = 'Borrowed';
        break;
      case AvailabilityStatus.swapped:
        bg = AppColors.swappedBg;
        text = AppColors.swapped;
        label = 'Swapped';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: text,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ActionTagBadge extends StatelessWidget {
  final ActionType actionType;

  const ActionTagBadge({super.key, required this.actionType});

  @override
  Widget build(BuildContext context) {
    late Color bg;
    late Color text;
    late String label;

    switch (actionType) {
      case ActionType.buy:
        bg = AppColors.buyBg;
        text = AppColors.buyColor;
        label = 'BUY';
        break;
      case ActionType.sell:
        bg = AppColors.sellBg;
        text = AppColors.sellColor;
        label = 'SELL';
        break;
      case ActionType.borrow:
        bg = AppColors.borrowBg;
        text = AppColors.borrowColor;
        label = 'BORROW';
        break;
      case ActionType.donate:
        bg = AppColors.donateBg;
        text = AppColors.donateColor;
        label = 'DONATE';
        break;
      case ActionType.exchange:
        bg = AppColors.exchangeBg;
        text = AppColors.exchangeColor;
        label = 'EXCHANGE';
        break;
      case ActionType.needBoard:
        bg = AppColors.needBoardBg;
        text = AppColors.needBoardColor;
        label = 'WANTED';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: text.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: text,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final ResourceItem resource;
  final bool isHorizontal;
  final VoidCallback onTap;

  const ResourceCard({
    super.key,
    required this.resource,
    this.isHorizontal = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedPrice = resource.isFree
        ? 'FREE'
        : '₹${resource.price.toStringAsFixed(0)}';

    return Container(
      width: isHorizontal ? 250 : double.infinity,
      margin: EdgeInsets.only(
        right: isHorizontal ? 14 : 0,
        bottom: isHorizontal ? 0 : 14,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: isHorizontal ? 130 : 160,
                    width: double.infinity,
                    child: Image.network(
                      resource.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.primarySurface,
                        child: const Center(
                          child: Icon(
                            Icons.menu_book_rounded,
                            size: 36,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: ActionTagBadge(actionType: resource.actionType),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: StatusBadge(status: resource.availability),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          resource.categoryName.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.divider,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            resource.condition,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      resource.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          formattedPrice,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: resource.isFree
                                ? AppColors.available
                                : AppColors.primaryDark,
                          ),
                        ),
                        if (resource.borrowPeriodDays != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.reservedBg,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Max ${resource.borrowPeriodDays}d',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.reserved,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const Divider(height: 16, color: AppColors.divider),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            resource.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionGrid extends StatelessWidget {
  final Function(ActionType) onActionSelected;

  const ActionGrid({super.key, required this.onActionSelected});

  @override
  Widget build(BuildContext context) {
    final actions = MockDataService.navigationActions;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'What do you want to do?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'Peer Exchange',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: actions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final act = actions[index];

              return InkWell(
                onTap: () => onActionSelected(act.type),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  decoration: BoxDecoration(
                    color: act.color,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: act.accentColor.withOpacity(0.25)),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: act.accentColor.withOpacity(0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                act.icon,
                                size: 22,
                                color: act.accentColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              act.label,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: act.accentColor,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              act.subtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 9,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (act.badgeCount != null)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: act.accentColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${act.badgeCount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategorySlider extends StatelessWidget {
  final String selectedCategoryId;
  final Function(String) onCategorySelected;

  const CategorySlider({
    super.key,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = MockDataService.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Resource Categories',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 42,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = selectedCategoryId == cat.id;

              return GestureDetector(
                onTap: () => onCategorySelected(cat.id),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        cat.icon,
                        size: 16,
                        color: isSelected ? Colors.white : AppColors.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        cat.name,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeDashboardScreen(
            collegeName: 'Engineering Campus',
            studentName: 'Sai',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryLight,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.swap_horiz_rounded,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Center(
                    child: Text(
                      'StudySwap',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Center(
                    child: Text(
                      'Campus Peer-to-Peer Academic Exchange',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Sign in to your college account to browse and swap materials.',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'College Email / Username',
                      hintText: 'sai@example.edu',
                      prefixIcon: const Icon(
                        Icons.alternate_email_rounded,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 20,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: _handleSignIn,
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(
                        color: AppColors.primary,
                        width: 1.2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CreateAccountScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Create a student account',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your registered email')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateNewPasswordScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.primarySurface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_reset_rounded,
                  size: 48,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Enter your registered email address to receive password reset instructions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'College Email',
                  hintText: 'sai@example.edu',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _handleContinue,
                  child: const Text(
                    'Continue to create new password',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _newPassController = TextEditingController();

  @override
  void dispose() {
    _newPassController.dispose();
    super.dispose();
  }

  void _handleSavePassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password updated successfully! Please sign in.'),
        backgroundColor: AppColors.available,
      ),
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Password')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Create new password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your new strong password below to regain access to your account.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _newPassController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  hintText: 'Minimum 6 characters',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _handleSavePassword,
                  child: const Text(
                    'Save new password',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a student account')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Join StudySwap 🎓',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Register with your college email and start sharing resources with peers.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'College Email / PRN',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Account registered! Please sign in.'),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Register Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDashboardScreen extends StatefulWidget {
  final String collegeName;
  final String studentName;

  const HomeDashboardScreen({
    super.key,
    this.collegeName = 'Engineering Campus',
    this.studentName = 'Sai',
  });

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  String _selectedCategory = 'all';
  late List<ResourceItem> _recommended;
  late List<ResourceItem> _recent;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _recommended = MockDataService.getRecommended();
      _recent = MockDataService.getRecent();
    });
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _loadData();
  }

  void _handleActionSelected(ActionType type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResourcesScreen(initialAction: type),
      ),
    );
  }

  void _handleCategorySelected(String catId) {
    setState(() => _selectedCategory = catId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResourcesScreen(initialCategoryId: catId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          color: AppColors.primary,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'StudySwap',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      widget.collegeName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Welcome, ${widget.studentName} 👋',
                                style: const TextStyle(
                                  color: AppColors.primaryLight,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.logout_rounded,
                              color: Colors.white,
                              size: 22,
                            ),
                            tooltip: 'Sign Out',
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SearchResourcesScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Search textbooks, kits, notes, calculators...',
                                  style: TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Icon(Icons.tune_rounded, color: AppColors.primary, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ActionGrid(onActionSelected: _handleActionSelected),
                CategorySlider(
                  selectedCategoryId: _selectedCategory,
                  onCategorySelected: _handleCategorySelected,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Recommended for You',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.reservedBg,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '★ High Demand',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: AppColors.reserved,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SearchResourcesScreen(),
                            ),
                          );
                        },
                        child: const Text('See all'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 290,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _recommended.length,
                    itemBuilder: (context, index) {
                      final item = _recommended[index];
                      return ResourceCard(
                        resource: item,
                        isHorizontal: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResourceDetailsScreen(resource: item),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Recently Added Resources',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(width: 6),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: AppColors.available,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SearchResourcesScreen(),
                            ),
                          );
                        },
                        child: const Text('Explore all'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: _recent.map((item) {
                      return ResourceCard(
                        resource: item,
                        isHorizontal: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResourceDetailsScreen(resource: item),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResourcesScreen extends StatefulWidget {
  final String initialQuery;
  final String initialCategoryId;
  final ActionType? initialAction;

  const SearchResourcesScreen({
    super.key,
    this.initialQuery = '',
    this.initialCategoryId = 'all',
    this.initialAction,
  });

  @override
  State<SearchResourcesScreen> createState() => _SearchResourcesScreenState();
}

class _SearchResourcesScreenState extends State<SearchResourcesScreen> {
  late final TextEditingController _searchController;
  late String _selectedCategory;
  ActionType? _selectedAction;
  bool _availableOnly = false;
  List<ResourceItem> _results = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
    _selectedCategory = widget.initialCategoryId;
    _selectedAction = widget.initialAction;
    _applySearch();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applySearch() {
    setState(() {
      _results = MockDataService.search(
        query: _searchController.text.trim(),
        categoryId: _selectedCategory,
        actionType: _selectedAction,
        availableOnly: _availableOnly,
      );
    });
  }

  void _clearFilters() {
    setState(() {
      _searchController.clear();
      _selectedCategory = 'all';
      _selectedAction = null;
      _availableOnly = false;
      _results = MockDataService.mockResources;
    });
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        String tempCat = _selectedCategory;
        ActionType? tempAction = _selectedAction;
        bool tempAvailable = _availableOnly;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Filter Resources',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                            _clearFilters();
                          },
                          child: const Text('Reset All'),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 12),
                    const Text(
                      'Action Type',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        ChoiceChip(
                          label: const Text('All Actions'),
                          selected: tempAction == null,
                          onSelected: (_) => setModalState(() => tempAction = null),
                        ),
                        ...ActionType.values.map((act) {
                          return ChoiceChip(
                            label: Text(act.name.toUpperCase()),
                            selected: tempAction == act,
                            onSelected: (_) => setModalState(() => tempAction = act),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: MockDataService.categories.map((c) {
                        return ChoiceChip(
                          label: Text(c.name),
                          selected: tempCat == c.id,
                          onSelected: (_) => setModalState(() => tempCat = c.id),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        'In-Stock & Available Only',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      value: tempAvailable,
                      activeThumbColor: AppColors.primary,
                      onChanged: (val) => setModalState(() => tempAvailable = val),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedCategory = tempCat;
                            _selectedAction = tempAction;
                            _availableOnly = tempAvailable;
                          });
                          _applySearch();
                          Navigator.pop(ctx);
                        },
                        child: const Text(
                          'Apply Filters',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Resources'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: _showFilterSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => _applySearch(),
              decoration: InputDecoration(
                hintText: 'Search books, kits, notes, calculators...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.textSecondary,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded, size: 20),
                        onPressed: () {
                          _searchController.clear();
                          _applySearch();
                        },
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_results.length} resources found',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_searchController.text.isNotEmpty ||
                    _selectedCategory != 'all' ||
                    _selectedAction != null ||
                    _availableOnly)
                  GestureDetector(
                    onTap: _clearFilters,
                    child: const Text(
                      'Clear Filters',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: _results.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off_rounded,
                            size: 50,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No Matching Resources Found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Try adjusting your keywords or clearing filters.',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _clearFilters,
                            child: const Text('Clear Filters'),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final item = _results[index];
                      return ResourceCard(
                        resource: item,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResourceDetailsScreen(resource: item),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ResourceDetailsScreen extends StatelessWidget {
  final ResourceItem resource;

  const ResourceDetailsScreen({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = resource.isFree
        ? 'FREE'
        : '₹${resource.price.toStringAsFixed(0)}';

    return Scaffold(
      appBar: AppBar(title: const Text('Resource Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              resource.imageUrl,
              width: double.infinity,
              height: 260,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 260,
                color: AppColors.primarySurface,
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 64,
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionTagBadge(actionType: resource.actionType),
                      StatusBadge(status: resource.availability),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    resource.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        formattedPrice,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: resource.isFree
                              ? AppColors.available
                              : AppColors.primaryDark,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.divider,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Condition: ${resource.condition}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  const Text(
                    'About this Item',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    resource.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primarySurface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryLight),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.school_outlined,
                          size: 20,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Targeted for: ${resource.departmentTarget}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.primary,
                          child: Text(
                            resource.owner.name.isNotEmpty ? resource.owner.name[0] : 'U',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                resource.owner.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '${resource.owner.department} • ${resource.owner.year}',
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 13,
                                    color: AppColors.textMuted,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    resource.location,
                                    style: const TextStyle(
                                      color: AppColors.textMuted,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
            label: const Text(
              'Contact Student / Propose Swap',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Contact request sent to ${resource.owner.name} (${resource.owner.phone})!',
                  ),
                  backgroundColor: AppColors.available,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/component/MyDrawer.dart';
import 'package:scan_me/pages/qr_scanner.dart';
import 'package:scan_me/theme/page_transition.dart';
import 'package:scan_me/theme/app_spacing.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onThemeToggle;

  const HomeScreen({super.key, this.onThemeToggle});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _scaleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Mydrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Smart Inventory',
                  style: TextStyle(
                    fontSize: 22,
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isDark
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.light_mode,
                      size: 18,
                      color: isDark ? Colors.grey.shade600 : Colors.amber,
                    ),
                    Switch(
                      value: isDark,
                      onChanged: (_) {
                        widget.onThemeToggle?.call();
                      },
                      activeColor: Colors.indigo,
                      inactiveThumbColor: Colors.orange,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Icon(
                      Icons.dark_mode,
                      size: 18,
                      color: isDark ? Colors.indigo : Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [Colors.grey.shade900, Colors.grey.shade800]
                : [Colors.grey.shade50, Colors.white],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated QR Circle
                    ScaleTransition(
                      scale: Tween<double>(begin: 1.0, end: 1.05)
                          .animate(_scaleController),
                      child: Container(
                        width: size.width * 0.6,
                        height: size.width * 0.6,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4F46E5),
                              Color(0xFF3B82F6),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4F46E5).withOpacity(0.4),
                              blurRadius: 30,
                              spreadRadius: 5,
                              offset: const Offset(0, 15),
                            ),
                            BoxShadow(
                              color: const Color(0xFF3B82F6).withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 2,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Rotating icon
                            RotationTransition(
                              turns: _rotationController,
                              child: Icon(
                                Icons.qr_code_scanner,
                                size: size.width * 0.35,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),

                    // Welcome Text Section
                    Column(
                      children: [
                        Text(
                          'Welcome to Smart Inventory',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : Colors.grey.shade800,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                            vertical: AppSpacing.sm,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusLg),
                            color: Theme.of(context).colorScheme.primary
                                .withOpacity(0.1),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary
                                  .withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            'Scan QR codes to manage inventory',
                            style: TextStyle(
                              fontSize: 16,
                              color: isDark
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

                    // CTA Button
                    Mybutton(
                      Data: "Start Scanning",
                      icon: Icons.qr_code_scanner,
                      onPressed: () {
                        Navigator.push(
                          context,
                          SmoothPageRoute(
                            page: const QRScannerScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Info Section
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                        color: isDark
                            ? Colors.grey.shade800.withOpacity(0.5)
                            : Colors.blue.shade50,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary
                              .withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Text(
                              'Open the menu to view implementation details and more options',
                              style: TextStyle(
                                fontSize: 14,
                                color: isDark
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade700,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

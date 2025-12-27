import 'package:flutter/material.dart';
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/component/MyDrawer.dart';
import 'package:scan_me/component/CustomAppBarWithTheme.dart';
import 'package:scan_me/pages/qr_scanner.dart';
import 'package:scan_me/theme/page_transition.dart';
import 'package:scan_me/theme/app_spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Mydrawer(),
      appBar: const CustomAppBarWithTheme(
        title: 'Scan Me',
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
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
                  _AnimatedQRCircle(scaleController: _scaleController),
                  const SizedBox(height: 60),
                  const _WelcomeSection(),
                  const SizedBox(height: 50),
                  _StartScanButton(
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
                  const _InfoSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Animated QR Circle Widget - Extracted to prevent rebuilds
class _AnimatedQRCircle extends StatelessWidget {
  final AnimationController scaleController;

  const _AnimatedQRCircle({required this.scaleController});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 1.05).animate(scaleController),
      child: Container(
        width: size.width * 0.6,
        height: size.width * 0.6,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
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
              color: Color.fromARGB(102, 79, 70, 229),
              blurRadius: 30,
              spreadRadius: 5,
              offset: Offset(0, 15),
            ),
            BoxShadow(
              color: Color.fromARGB(77, 59, 130, 246),
              blurRadius: 20,
              spreadRadius: 2,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: const _QRIcon(),
      ),
    );
  }
}

/// QR Icon with rotation animation - Further extracted
class _QRIcon extends StatefulWidget {
  const _QRIcon();

  @override
  State<_QRIcon> createState() => _QRIconState();
}

class _QRIconState extends State<_QRIcon> with TickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        RotationTransition(
          turns: _rotationController,
          child: Icon(
            Icons.qr_code_scanner,
            size: size.width * 0.35,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

/// Welcome Section - Const constructor for better performance
class _WelcomeSection extends StatelessWidget {
  const _WelcomeSection();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
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
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
          ),
          child: Text(
            'Scan QR codes to manage inventory',
            style: TextStyle(
              fontSize: 16,
              color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// Start Scan Button - Extracted
class _StartScanButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _StartScanButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Mybutton(
      Data: "Start Scanning",
      icon: Icons.qr_code_scanner,
      onPressed: onPressed,
    );
  }
}

/// Info Section - Const constructor for better performance
class _InfoSection extends StatelessWidget {
  const _InfoSection();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        color: isDark
            ? Colors.grey.shade800.withOpacity(0.5)
            : Colors.blue.shade50,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
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
                color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

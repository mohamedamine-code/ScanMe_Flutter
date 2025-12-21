import 'package:flutter/material.dart';
import 'package:scan_me/component/MyButton.dart';
import 'package:scan_me/pages/HomePage.dart';
import 'package:scan_me/pages/Implimentation.dart';
import 'package:scan_me/pages/Viewdetails.dart';
import 'package:scan_me/pages/login.dart';
import 'package:scan_me/theme/page_transition.dart';
import 'package:scan_me/theme/app_spacing.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      // margin: const EdgeInsets.symmetric(
      //   horizontal: AppSpacing.sm,
      //   vertical: AppSpacing.md,
      // ),
      height: MediaQuery.of(context).size.height - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(5, 0),
          )
        ],
      ),
      child: Drawer(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
        backgroundColor: isDark ? Colors.grey.shade900 : Colors.white,
        child: Column(
          children: [
            // Enhanced Header
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.radiusLg),
                  topRight: Radius.circular(AppSpacing.radiusLg),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4F46E5).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Container(
                // padding: const EdgeInsets.all(AppSpacing.lg),
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.inventory_2,
                        size: 40,
                        color: const Color(0xFF4F46E5),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const Text(
                      'Smart Inventory',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                children: [
                  _buildDrawerMenuItem(
                    context,
                    icon: Icons.home_rounded,
                    title: "Home",
                    subtitle: "Back to main screen",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        SmoothPageRoute(page: const HomeScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildDrawerMenuItem(
                    context,
                    icon: Icons.build,
                    title: "Implementation",
                    subtitle: "Device details",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        SmoothPageRoute(page: Implimentation()),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildDrawerMenuItem(
                    context,
                    icon: Icons.visibility,
                    title: "View Details",
                    subtitle: "View device info",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        SmoothPageRoute(page: Viewdetails()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Bottom Logout Button
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  Divider(
                    color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
                    height: AppSpacing.lg,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Mybutton(
                    Data: "Logout",
                    icon: Icons.logout,
                    isSmall: true,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text("Confirm Logout"),
                          content: const Text(
                            "Are you sure you want to logout?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  SmoothPageRoute(page: const LoginPage()),
                                );
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            color: isDark
                ? Colors.grey.shade800.withOpacity(0.5)
                : Colors.grey.shade50,
            border: Border.all(
              color: isDark
                  ? Colors.grey.shade700.withOpacity(0.5)
                  : Colors.grey.shade200,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey.shade400 : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: isDark ? Colors.grey.shade500 : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scan_me/theme/page_transition.dart';
// Navigation Performance Optimization - Usage Examples

// ============================================
// EXAMPLE 1: Basic Navigation (Forward)
// ============================================
void navigateToDetail(BuildContext context) {
  Navigator.push(
    context,
    SmoothPageRoute(page: const DetailPage()),
  );
}

// ============================================
// EXAMPLE 2: Navigation with Replacement
// ============================================
void navigateToHome(BuildContext context) {
  Navigator.pushReplacement(
    context,
    SmoothPageRoute(page: const HomeScreen()),
  );
}

// ============================================
// EXAMPLE 3: Navigation with Full Stack Clear
// ============================================
void logout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    SmoothPageRoute(page: const LoginPage()),
    (route) => false, // Remove all routes
  );
}

// ============================================
// EXAMPLE 4: Navigation with Data Pass
// ============================================
void navigateWithData(BuildContext context, String id) async {
  final result = await Navigator.push(
    context,
    SmoothPageRoute(
      page: DetailPage(id: id),
    ),
  );
  
  // Handle result when returning
  if (result != null) {
    print('Result: $result');
  }
}

// ============================================
// EXAMPLE 5: Quick Navigation (No Animation)
// ============================================
void quickNavigate(BuildContext context) {
  Navigator.push(
    context,
    InstantPageRoute(page: const FastLoadPage()),
  );
}

// ============================================
// EXAMPLE 6: Safe Navigation in Drawer
// ============================================
void navigateFromDrawer(BuildContext context, Widget page) {
  Navigator.pop(context); // Close drawer first
  Navigator.push(
    context,
    SmoothPageRoute(page: page),
  );
}

// ============================================
// EXAMPLE 7: Using Navigation Service (Future)
// ============================================
// When ready to migrate, use this pattern:
// void navigateOptimized(BuildContext context) {
//   navigationService.push(
//     context,
//     page: const DetailPage(),
//   );
// }

// ============================================
// PERFORMANCE TIPS
// ============================================

/*
1. ALWAYS make page constructors const:
   ✅ const DetailPage()
   ❌ DetailPage()

2. CHOOSE the right navigation method:
   - push()           → Go forward, can go back
   - pushReplacement() → Replace current page
   - pushAndRemoveUntil() → Clear stack and navigate

3. AVOID creating duplicate instances:
   ✅ SmoothPageRoute(page: const HomePage())
   ❌ SmoothPageRoute(page: HomePage()) // Creates new instance each time

4. REMEMBER: Page transitions are GPU-accelerated
   - Slide animation only (more efficient)
   - 300ms duration (faster than before)

5. MONITOR performance:
   - Use DevTools Performance tab
   - Check frame rate while navigating
   - Look for jank or stuttering

6. BEST PRACTICES:
   - Close dialogs before navigating
   - Pop drawer before pushing new route
   - Use replacement for main flow navigation
   - Clear stack on logout
*/

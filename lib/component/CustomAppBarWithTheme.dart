import 'package:flutter/material.dart';
import 'package:scan_me/theme/app_theme_context.dart';

class CustomAppBarWithTheme extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final double elevation;

  const CustomAppBarWithTheme({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: elevation,
      leading: leading,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          color: isDark ? Colors.white : Colors.black,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
      actions: [
        const _ThemeToggleButton(),
        if (actions != null) ...actions!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Extracted theme toggle widget to prevent unnecessary rebuilds
class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
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
                  AppThemeContext.toggleTheme();
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
    );
  }
}

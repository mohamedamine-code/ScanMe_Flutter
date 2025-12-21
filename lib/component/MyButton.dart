import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan_me/theme/app_spacing.dart';

class Mybutton extends StatefulWidget {
  final String Data;
  final VoidCallback onPressed;
  final bool isSmall;
  final IconData? icon;
  const Mybutton({
    super.key,
    required this.Data,
    required this.onPressed,
    this.isSmall = false,
    this.icon,
  });

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        HapticFeedback.lightImpact();
        setState(() {
          _scale = 0.92;
        });
      },
      onTapUp: (_) {
        setState(() {
          _scale = 1.0;
        });
      },
      onTapCancel: () => setState(() {
        _scale = 1.0;
      }),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 8,
                color: Colors.blue.withOpacity(0.25),
              ),
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            gradient: const LinearGradient(
              colors: [Color(0xFF4F46E5), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: Colors.white,
                    size: _MybuttonState._getIconSize(widget.isSmall),
                  )
                : const SizedBox.shrink(),
            label: Text(
              widget.Data,
              style: TextStyle(
                fontSize: widget.isSmall ? AppSpacing.fontMd : AppSpacing.fontXl,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                vertical: widget.isSmall ? 12 : AppSpacing.md,
                horizontal: AppSpacing.lg,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              ),
            ),
            onPressed: widget.onPressed,
          ),
        ),
      ),
    );
  }

  static double _getIconSize(bool isSmall) => isSmall ? 18 : 24;
}

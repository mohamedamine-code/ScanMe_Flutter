import 'package:flutter/material.dart';
import 'package:scan_me/component/SubTitleText.dart';
import 'package:scan_me/component/TitleText.dart';
import 'package:scan_me/models/device.dart';
import 'package:scan_me/theme/app_spacing.dart';

class Mycard extends StatefulWidget {
  final DeviceInfo Device;
  const Mycard({required this.Device});

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Helper function to create a label-value row
    Widget _buildRow(String title, String value, {IconData? icon}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: Icon(
                  icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                ),
              ),
            SizedBox(
              width: 140,
              child: Titletext(
                data: title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            Expanded(
              child: Subtitletext(
                data: ": $value",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? Colors.grey.shade300
                    : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      );
    }

    final activePortIcon =
        widget.Device.statePort ? Icons.check_circle : Icons.cancel;
    final activePortColor = widget.Device.statePort ? Colors.green : Colors.red;

    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.sm,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        side: BorderSide(
          color: isDark
              ? Colors.grey.shade700.withOpacity(0.5)
              : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [Colors.grey.shade900, Colors.grey.shade800.withOpacity(0.5)]
                : [Colors.white, Colors.grey.shade50.withOpacity(0.5)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with device ID
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    ],
                  ),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.inventory_2,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Titletext(
                        data: "Device ID: ${widget.Device.id}",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              // Device Details
              _buildRow("Society", widget.Device.societyName, icon: Icons.location_city),
              _buildRow(
                "Floors",
                widget.Device.numberOfFloors,
                icon: Icons.apartment,
              ),
              _buildRow(
                "Tech Room",
                widget.Device.technicalRoomNumber,
                icon: Icons.meeting_room,
              ),
              _buildRow(
                "Cabinet",
                widget.Device.cabinetNumber,
                icon: Icons.storage,
              ),
              _buildRow(
                "Switcher",
                widget.Device.switcher,
                icon: Icons.router,
              ),
              _buildRow("Port", widget.Device.port, icon: Icons.hub),
              // Port Status with visual indicator
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.signal_cellular_alt,
                      size: 20,
                      color:
                          widget.Device.statePort ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    SizedBox(
                      width: 140,
                      child: const Titletext(
                        data: "Port State",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                          color: activePortColor.withOpacity(0.15),
                          border: Border.all(
                            color: activePortColor.withOpacity(0.4),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              activePortIcon,
                              size: 16,
                              color: activePortColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              widget.Device.statePort ? "Active" : "Inactive",
                              style: TextStyle(
                                color: activePortColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
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
# ScanMe - Smart Inventory Management

A modern Flutter mobile application for managing inventory systems using QR code scanning technology. ScanMe provides an intuitive interface for scanning, tracking, and managing network components in building infrastructure.

## 📋 Overview

**ScanMe** is a comprehensive inventory management system designed specifically for tracking network infrastructure components such as switches, ports, and cabinets across multiple buildings and technical rooms. The app leverages QR code technology to quickly identify and retrieve detailed information about installed components.

### Key Capabilities

- 🔍 **QR Code Scanning**: Real-time QR code detection and recognition
- 📱 **Component Tracking**: Detailed information about network components
- 🏢 **Multi-Building Support**: Manage inventory across multiple buildings and technical rooms
- 🌐 **REST API Integration**: Seamless backend connectivity for data retrieval
- 💾 **Real-time Data Fetch**: Instant component information updates
- 🔦 **Flashlight Control**: Built-in torch functionality for low-light scanning

## 🎯 Features

### 1. **Home Screen**
   - Welcome interface with animated QR icon
   - Quick access to scanning functionality
   - Navigation drawer for additional options
   - Beautiful gradient design with shadow effects

### 2. **QR Scanner**
   - Real-time barcode detection using mobile_scanner package
   - Custom scanning overlay with visual guides
   - Flashlight toggle for better scanning in dim conditions
   - Automatic navigation to component details upon successful scan
   - Back navigation to home screen

### 3. **Component Details**
   - Display comprehensive component information:
     - Society/Building Name
     - Number of Floors
     - Technical Room Number
     - Cabinet Number
     - Switcher Details
     - Port Information
     - Port Status
   - Loading state indicators
   - Error handling with user-friendly messages
   - Update functionality for component information

### 4. **User Authentication**
   - Professional login screen
   - Email/Password authentication support
   - Google Sign-in integration (placeholder)
   - Navigation to home screen upon successful login

### 5. **Navigation Drawer**
   - Quick access to app features
   - User profile section
   - Additional navigation options

## 🛠️ Technology Stack

### Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | - | Core framework |
| `mobile_scanner` | Latest | QR/Barcode scanning |
| `http` | Latest | REST API communication |
| `url_launcher` | Latest | External URL handling |
| `font_awesome_flutter` | Latest | Enhanced icon library |
| `avatar_glow` | 3.0.1 | Glow effects for UI |
| `cupertino_icons` | 1.0.8 | iOS-style icons |

### Development Tools

| Tool | Version | Purpose |
|------|---------|---------|
| `flutter_lints` | 5.0.0 | Code quality and style guidelines |
| `flutter_test` | - | Unit and widget testing |

## 📁 Project Structure

```
lib/
├── main.dart                 # Application entry point
├── pages/
│   ├── HomePage.dart         # Main home screen with QR scanner navigation
│   ├── qr_scanner.dart       # QR code scanning interface
│   ├── ComponetDetails.dart  # Component information display
│   ├── login.dart            # User authentication screen
│   ├── Implimentation.dart   # Implementation details
│   └── Viewdetails.dart      # View component details
├── component/
│   ├── MyButton.dart         # Custom button widget
│   ├── MyCard.dart           # Custom card widget
│   ├── MyDrawer.dart         # Navigation drawer
│   ├── MyTextFlied.dart      # Custom text field
│   ├── TitleText.dart        # Title text widget
│   └── SubTitleText.dart     # Subtitle text widget
├── models/
│   └── device.dart           # DeviceInfo model for component data
└── theme/
    └── const_theme.dart      # Application theme configuration
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.0 or later)
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for device/emulator)
- Git (optional, for version control)

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/mohamedamine-code/ScanMe_Flutter.git
   cd scan_me
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the Application**
   ```bash
   flutter run
   ```

   For specific platforms:
   ```bash
   # Android
   flutter run -d android

   # iOS
   flutter run -d ios

   # Windows
   flutter run -d windows

   # Web
   flutter run -d chrome
   ```

### Configuration

#### Camera Permissions

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.FLASHLIGHT" />
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>NSCameraUsageDescription</key>
<string>We need camera access to scan QR codes</string>
```

#### Backend API Configuration

Update the API endpoint in `lib/pages/ComponetDetails.dart`:
```dart
final url = Uri.parse(
  'https://your-backend-url.com/components/${widget.componentId}',
);
```

Current backend: `https://backend-scanme-1.onrender.com`

## 📱 Application Flow

```
Login Screen
    ↓
Home Screen (Welcome)
    ↓
QR Scanner Screen
    ↓
Component Details Screen
    ↓
Update Information
```

## 🎨 Theme & Styling

The application uses a custom light theme with:

- **Primary Color**: Red (#B20B0B)
- **Secondary Color**: Gray Shades
- **Tertiary Color**: Indigo
- **Surface Color**: White
- **Accent**: Blue Gradient

### Typography
- **Headers**: Bold, sizes 18-26pt
- **Body Text**: Regular, sizes 15-18pt
- **Labels**: Semi-bold, sizes 16pt

## 🔌 API Integration

### Component Details Endpoint

**Request:**
```
GET /components/{componentId}
```

**Response Format:**
```json
{
  "_id": "component_id",
  "Society_Name": "Building Name",
  "Number_of_Floors": "10",
  "Technical_Room_Number": "5",
  "Cabinet_Number": "A1",
  "Switcher": "Cisco 3850",
  "Port": "GigabitEthernet1/0/1",
  "State_Port": true
}
```

## 📊 Data Models

### DeviceInfo Model
```dart
class DeviceInfo {
  final String id;
  final String societyName;
  final String numberOfFloors;
  final String technicalRoomNumber;
  final String cabinetNumber;
  final String switcher;
  final String port;
  final bool statePort;
}
```

## 🔒 Security Features

- Secure API communication via HTTPS
- Input validation and error handling
- Timeout protection (10-second API timeout)
- Safe state management
- Proper resource disposal

## 🐛 Error Handling

The application includes comprehensive error handling:

- **Network Errors**: Connection timeout and failure messages
- **API Errors**: HTTP status code handling
- **Parsing Errors**: JSON decode exception handling
- **User Feedback**: SnackBar notifications for all errors

Example Error Messages:
- ❌ Failed to fetch component data
- ⏱ Request timed out
- 🔥 Error: [detailed error message]

## 📦 Build & Deployment

### Android

```bash
# Build APK
flutter build apk

# Build App Bundle
flutter build appbundle
```

### iOS

```bash
# Build iOS app
flutter build ios
```

### Windows

```bash
# Build Windows executable
flutter build windows
```

### Web

```bash
# Build web application
flutter build web
```

## 🧪 Testing

Run unit and widget tests:

```bash
flutter test
```

Run tests with coverage:

```bash
flutter test --coverage
```

## 📝 File Descriptions

| File | Purpose |
|------|---------|
| `main.dart` | App initialization and theme setup |
| `HomePage.dart` | Welcome screen with animated QR icon |
| `qr_scanner.dart` | QR code detection and scanning logic |
| `ComponetDetails.dart` | Component data display and API integration |
| `login.dart` | Authentication interface |
| `const_theme.dart` | App-wide theme configuration |
| `device.dart` | DeviceInfo data model and JSON parsing |

## 🎯 Future Enhancements

- [ ] User authentication backend integration
- [ ] Component update/edit functionality
- [ ] Offline data caching
- [ ] Barcode scanning support (not just QR)
- [ ] Advanced filtering and search
- [ ] Inventory analytics dashboard
- [ ] Export component data to CSV/PDF
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Component history tracking

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Mohamed Amine**
- GitHub: [@mohamedamine-code](https://github.com/mohamedamine-code)
- Repository: [ScanMe_Flutter](https://github.com/mohamedamine-code/ScanMe_Flutter)

## 📞 Support

For issues, questions, or suggestions, please:

1. Check existing issues on GitHub
2. Open a new issue with detailed description
3. Provide error logs and steps to reproduce

## 🔗 Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [mobile_scanner Package](https://pub.dev/packages/mobile_scanner)
- [HTTP Package Documentation](https://pub.dev/packages/http)
- [Dart Language Guide](https://dart.dev/guides)

## 📊 Project Statistics

- **Platform Support**: Android, iOS, Windows, Web
- **Minimum SDK**: Android 5.0+
- **Target SDK**: Latest
- **Flutter Version**: 3.9.0+
- **Architecture**: MVC Pattern

---

**Last Updated**: December 2024
**Version**: 1.0.0

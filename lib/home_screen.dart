import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Background Image
          const HomeBackground(),

          /// Overlay Stack
          Column(
            children: [
              SizedBox(height: 30.h), // Safe Area Padding

              /// Header Section (Logo & Notification)
              const HomeHeader(),

              SizedBox(height: 10.h),

              /// Balance Section
              const BalanceSection(),

              SizedBox(height: 10.h),

              /// Track Number Section
              const TrackNumberSection(),

              SizedBox(height: 20.h),

              /// Features Section
              const FeaturesSection(),

              SizedBox(height: 20.h),

              /// Services Section
              const ServicesSection(),
            ],
          ),
        ],
      ),
    );
  }
}

/// **Background Widget**
class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.33.sh,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/header.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// **Header Section (Logo & Notification)**
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/percel.png', height: 50.h),
              SizedBox(width: 10.w),
              Text(
                'Sendy',
                style: GoogleFonts.poppins(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            height: 40.h,
            width: 40.h,
            decoration: const BoxDecoration(
              color: Color(0xFF4D555A),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset('assets/bell.svg', height: 24.h),
            ),
          ),
        ],
      ),
    );
  }
}

/// **Balance Section**
class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My Balance',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$3,382.00',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                'Top Up',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// **Track Number Section**
class TrackNumberSection extends StatelessWidget {
  const TrackNumberSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 52.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF0CCC70),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 10.w),
                  Text(
                    'Enter track number',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

/// **Features Section**
/// **Features Section**
class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {'title': 'Check', 'icon': 'assets/add.svg'},
      {'title': 'Nearby', 'icon': 'assets/bell.svg'},
      {'title': 'Order', 'icon': 'assets/bell.svg'},
      {'title': 'Help', 'icon': 'assets/bell.svg'},
      {'title': 'Wallet', 'icon': 'assets/bell.svg'},
      {'title': 'Others', 'icon': 'assets/bell.svg'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Features',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            children: features
                .map((feature) => FeatureCard(feature['title']!, feature['icon']!))
                .toList(),
          ),
        ],
      ),
    );
  }
}



/// **Feature Card Widget**
class FeatureCard extends StatelessWidget {
  final String title;
  final String iconPath; // SVG Icon Path

  const FeatureCard(this.title, this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(color: Color(0xFFF3F3F3)), // Border color
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: Colors.greenAccent,
              height: 24.h, // Adjust as needed
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// **Services Section**
/// **Services Section**
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {'id': 'MM09132005', 'time': '2 Hrs', 'status': 'Processed at sort facility', 'icon': 'assets/add.svg'},
      {'id': 'MM02187642', 'time': '5 Hrs', 'status': 'Out for delivery', 'icon': 'assets/bell.svg'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services and Product',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Column(
            children: services
                .map((service) => ServiceItem(
              service['id']!,
              service['time']!,
              service['status']!,
              service['icon']!,
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// **Service Item Widget**
/// **Service Item Widget**
class ServiceItem extends StatelessWidget {
  final String id, time, status;
  final String iconPath; // SVG Icon Path

  const ServiceItem(this.id, this.time, this.status, this.iconPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFF3F3F3)), // Border color
      ),
      child: Row(
        children: [
          /// **Left Side: Icon Container**
          Container(
            height: 50.h,
            width: 50.h,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F4F9), // Left side background
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 20.h,
            ),
          ),

          SizedBox(width: 12.w),

          /// **Right Side: Service Details**
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                Text(
                  status,
                  style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.black54),
                ),
              ],
            ),
          ),

          /// **Trailing: Time**
          Text(
            time,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

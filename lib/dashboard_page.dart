import 'package:doctor_appointment/presentation/dashboard/homepage.dart';
import 'package:doctor_appointment/presentation/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

//page khusus bottomNavigationBar

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index = 0;
  List menu = [
    {
      'icon': "assets/ic_home.png",
      'icon_active': "assets/ic_home_active.png",
      'label': "Home",
      'page': const HomePage(),
    },
    {
      'icon': "assets/ic_calendar.png",
      'icon_active': "assets/ic_calendar_active.png",
      'label': "Schedule",
      'page': const SchedulePage(),
    },
    {
      'icon': "assets/ic_message.png",
      'icon_active': "assets/ic_message.png",
      'label': "Chats",
      'page': const Center(
        child: Text("Chats"),
      ),
    },
    {
      'icon': "assets/ic_profile.png",
      'icon_active': "assets/ic_profile.png",
      'label': "Profile",
      'page': const Center(
        child: Text("Profile"),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[index]['page'],
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SalomonBottomBar(
          //MapToListGenerate supaya bisa lngsng ambil key nya, tanpa harus mengakses index
          items: menu.map((e) {
            return SalomonBottomBarItem(
                selectedColor: Color(0xff63B4FF),
                unselectedColor: Color(0xff8696BB),
                icon: Image.asset(
                  e['icon'],
                  width: 24,
                  height: 24,
                ),
                title: Text(e['label'],
                    style: GoogleFonts.nunito().copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                activeIcon: Image.asset(
                  e['icon_active'],
                  width: 24,
                  height: 24,
                ));
          }).toList(),
          itemShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          currentIndex: index,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          itemPadding: EdgeInsets.all(12),
          selectedItemColor: Color(0xff63B4FF),
        ),
      ),
    );
  }
}

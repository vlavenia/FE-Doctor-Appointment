import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      //Bouncing ScrollPhysics supaya scroalble
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      children: [
        Gap(64),
        BuildHeader(),
        Gap(30),
        Column(
          children: [
            CardDashboard(),
            Gap(24),
            BuildSearch(),
            Gap(5),
            BuildCategory(),
            Gap(32),
            BuildDoctor()
          ],
        )
      ],
    );
  }
}

Widget BuildDoctor() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Near Doctor",
          style: GoogleFonts.poppins().copyWith(
              color: Color(0xff0D1B34),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
        Gap(16),
        ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: 2,
          itemBuilder: (context, index) {
            String image = 'assets/joseph.png';
            String name = "Dr.Joseph Brostito";
            String specialist = "Dental Spesialist";
            String range = "1.2 KM";
            double rate = 4.8;
            int review = 120;
            String open = '17:00';
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              //height: 148,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        offset: Offset(2, 12),
                        color: Color(0xff5A75A7).withOpacity(0.1))
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        image,
                        width: 48,
                        height: 48,
                      ),
                      Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff0D1B34)),
                            ),
                            Gap(8),
                            Text(
                              specialist,
                              style: GoogleFonts.poppins().copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color(0xff8696BB)),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16.0,
                            color: Color(0xff8696BB),
                          ),
                          Gap(8),
                          Text(
                            "1.2 K",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 12, color: Color(0xff8696BB)),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: Color.fromARGB(255, 235, 228, 228),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/ic_clock.png",
                            width: 20.0,
                            height: 20.0,
                            color: Color(0xffffFEB052),
                          ),
                          Gap(6),
                          Text(
                            "$rate ($review Reviews)",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 12, color: Color(0xffFEB052)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/ic_clock.png",
                            width: 20.0,
                            height: 20.0,
                            color: Color(0xff4894FE),
                          ),
                          Gap(6),
                          Text(
                            "Open at $open",
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 12, color: Color(0xff4894FE)),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    ),
  );
}

Widget BuildCategory() {
  final categories = [
    {'icon': 'assets/ic_virus.png', 'title': 'covid 19'},
    {'icon': 'assets/ic_profile_add.png', 'title': 'Doctor'},
    {'icon': 'assets/ic_link.png', 'title': 'Medicine'},
    {'icon': 'assets/ic_hospital.png', 'title': 'Hospital'},
  ];
  return Container(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //categories.map((item){return }).toList();
        children: categories.map((item) {
          //return masing2 layout:
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFAFAFA),
                    shape: BoxShape.circle),
                child: Image.asset(
                  item['icon']!,
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item['title']!,
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 15,
                  color: Color(0xff8696BB),
                ),
              )
            ],
          );
        }).toList()),
  );
}

class BuildSearch extends StatelessWidget {
  const BuildSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      height: 56,
      decoration: BoxDecoration(
          color: Color(0xffFAFAFA), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Image.asset(
            "assets/ic_search.png",
            width: 24,
            height: 24,
          ),
          Gap(12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                isDense: true,
                border: InputBorder.none,
                hintText: "Search doctor or health issue",
                hintStyle: GoogleFonts.poppins()
                    .copyWith(color: Color(0xff8696BB), fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardDashboard extends StatelessWidget {
  const CardDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      //  width: 327,
      height: 138,
      decoration: BoxDecoration(
        color: Color(0xff4894FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/imran.png",
                width: 48,
                height: 48,
              ),
              Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr.Imran Syahrir",
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Gap(8),
                    Text(
                      "General Doctor",
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xffCBE1FF)),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 24.0,
                color: Colors.white,
              ),
            ],
          ),
          Spacer(),
          Divider(
            color: Colors.white.withOpacity(0.15),
            thickness: 1,
            height: 1,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 16.0,
                      color: Colors.white,
                    ),
                    Gap(8),
                    Text(
                      DateFormat('EEEE, d MMMM').format(DateTime.now()),
                      style: GoogleFonts.poppins().copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16.0,
                          color: Colors.white,
                        ),
                        Gap(8),
                        Text(
                          "11-00 - 12:00 AM",
                          style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: GoogleFonts.poppins()
                  .copyWith(color: Color(0xff8696BB), fontSize: 16),
            ),
            Gap(6),
            Text(
              "Hi James",
              style: GoogleFonts.poppins().copyWith(
                color: Color(0xff0D1B34),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/profile.png",
          width: 56,
          height: 56,
        ),
      ],
    );
  }
}

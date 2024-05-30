import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ListStatus = [
    'Canceled Schedule',
    'UpComing Schedule',
    'Completed Schedule',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(64),
        BuildStatus(ListStatus: ListStatus),
        // Gap(24),
        Expanded(
          child: BuildListDoctor(),
        )
      ],
    );
  }
}

class BuildStatus extends StatefulWidget {
  BuildStatus({
    super.key,
    required this.ListStatus,
  });

  final List<String> ListStatus;

  @override
  State<BuildStatus> createState() => _BuildStatusState();
}

class _BuildStatusState extends State<BuildStatus> {
  //default tab awal statusActive
  String statusActive = 'Canceled Schedule';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 30),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.6),
          onPageChanged: (currentIndex) {
            //di set value terbaru dgn index terbaru
            statusActive = widget.ListStatus[currentIndex];
            setState(() {});
          },
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.ListStatus.length,
          itemBuilder: (context, index) {
            bool isActive = statusActive == widget.ListStatus[index];
            return UnconstrainedBox(
              child: Container(
                decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xff63B4FF).withOpacity(0.1)
                        : null,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                alignment: Alignment.center,
                child: Text(
                  widget.ListStatus[index],
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 16,
                    color: isActive ? Color(0xff4894FE) : Color(0xff8696BB),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class BuildListDoctor extends StatefulWidget {
  const BuildListDoctor({
    super.key,
  });

  @override
  State<BuildListDoctor> createState() => _BuildListDoctorState();
}

class _BuildListDoctorState extends State<BuildListDoctor> {
  @override
  Widget build(BuildContext context) {
    final ListDoctor = [
      {
        'image': 'assets/joseph.png',
        'name': "Dr.Joseph Brostito",
        'specialist': "Dental Spesialist",
        'date': DateTime(2024, 06, 12),
        'range': "11.00 - 12.00",
      },
      {
        'image': 'assets/bessie.png',
        'name': "Dr.Bessie Coleman",
        'specialist': "Dental Spesialist",
        'date': DateTime(2024, 06, 12),
        'range': "11.00 - 12.00",
      },
      {
        'image': 'assets/babe.png',
        'name': "Dr.Babe Didrikson",
        'specialist': "Dental Spesialist",
        'date': DateTime(2024, 06, 12),
        'range': "11.00 - 12.00",
      },
    ];
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: BouncingScrollPhysics(),
      itemCount: ListDoctor.length,
      itemBuilder: (context, index) {
        Map item = ListDoctor[index];
        return Container(
            decoration: BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    offset: Offset(2, 12),
                    color: Color(0xff5A75A7).withOpacity(0.1))
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        item['image'],
                        width: 48,
                        height: 48,
                      ),
                      Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                color: Color(0xff0D1B34)),
                          ),
                          Gap(8),
                          Text(
                            item['specialist'],
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 14, color: Color(0xff8696BB)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    thickness: 1,
                    height: 1,
                    color: Color.fromARGB(255, 235, 228, 228),
                  ),
                ),
                Container(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            size: 16.0,
                            color: Color(0xff8696BB),
                          ),
                          Gap(5),
                          Text(
                            "Sunday, 12 June",
                            style: GoogleFonts.poppins().copyWith(
                                color: Color(0xff8696BB), fontSize: 12),
                          )
                        ],
                      ),
                      Gap(34.5),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16.0,
                            color: Color(0xff8696BB),
                          ),
                          Gap(5),
                          Text(
                            item['range'],
                            style: GoogleFonts.poppins().copyWith(
                                color: Color(0xff8696BB), fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff63B4FF).withOpacity(0.1),
                    ),
                    width: double.infinity,
                    child: TextButton(
                        onPressed: null,
                        child: Text("Detail",
                            style: GoogleFonts.poppins()
                                .copyWith(color: Color(0xff4894FE)))))
              ],
            ));
      },
    );
  }
}

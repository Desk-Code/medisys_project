import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Bill_Data/Screens/bill_search_data.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/widgets/common_drawer_tile.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Doctor_data/Screens/doctor_search_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Patient_Data/Screens/patient_search_page.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Staff_Data/Screens/staff_dash_screen.dart';
import 'package:medisys/Presentation/login_dash/screen/login_dash_screen.dart';

Widget dashDrawer(BuildContext context) => Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/hospitalhomedrawerlogo.png",
                    ),
                  ),
                ),
              ),
              const Divider(),
              commonDrawerTile(
                icon: Icons.home,
                name: "Home",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              commonDrawerTile(
                icon: Icons.person,
                name: "Patient Details",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PatientSearchPage(),
                    ),
                  );
                },
              ),
              commonDrawerTile(
                icon: Icons.groups,
                name: "Staff Detail",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StaffDashScreen(),
                      ));
                },
              ),
              commonDrawerTile(
                icon: Icons.person,
                name: "Doctor Detail",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorSearchPage(),
                    ),
                  );
                },
              ),
              commonDrawerTile(
                icon: Icons.currency_rupee_sharp,
                name: "Bill",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BillSearchData(),
                    ),
                  );
                },
              ),
              const Divider(),
              commonDrawerText(text: "Profile"),
              commonDrawerTile(
                icon: Icons.person,
                name: "Profile",
                onTap: () {},
              ),
              commonDrawerTile(
                icon: Icons.logout_rounded,
                name: "Log Out",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Please Confirm'),
                      content: const Text("Do you want to logout ?"),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                        MaterialButton(
                          onPressed: () async {
                            await FirebaseAuth.instance
                                .signOut()
                                .then((value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginDashScreen(),
                                    ),
                                    (route) => false));
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Divider(),
              commonDrawerText(text: "Other"),
              commonDrawerTile(
                icon: Icons.delete,
                name: "Delete Account",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );

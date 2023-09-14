import 'package:flutter/material.dart';
import 'package:medisys/Presentation/Presentation_Hospital/Dashboard_screen/widgets/common_drawer_tile.dart';

Widget dashDrawer() => Drawer(
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
              onTap: () {},
            ),
            commonDrawerTile(
              icon: Icons.person,
              name: "Patient Details",
              onTap: () {},
            ),
            commonDrawerTile(
              icon: Icons.groups,
              name: "Staff Detail",
              onTap: () {},
            ),
            commonDrawerTile(
              icon: Icons.person,
              name: "Doctor Detail",
              onTap: () {},
            ),
            commonDrawerTile(
              icon: Icons.currency_rupee_sharp,
              name: "Bill",
              onTap: () {},
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
              onTap: () {},
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
    );

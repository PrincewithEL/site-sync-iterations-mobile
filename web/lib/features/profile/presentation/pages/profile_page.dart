import 'package:flutter/material.dart';
import 'package:site_sync/features/auth/presentation/pages/signin_page.dart';
import 'package:site_sync/features/profile/presentation/widgets/profile_component.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../dashboard/presentation/widgets/project_component.dart';

class MyProfilePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const MyProfilePage());

  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: AppPallete.errorColor,
            ),
            child: const Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Column(
              children: [
                ProfileComponent(
                  mainColor: AppPallete.errorColor,
                  iconData: Icons.person,
                  title: 'Account Details',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                ProfileComponent(
                  mainColor: AppPallete.errorColor,
                  iconData: Icons.shield,
                  title: 'Password & Security',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                ProfileComponent(
                  mainColor: AppPallete.errorColor,
                  iconData: Icons.auto_graph,
                  title: 'Activity & Statistics',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                ProfileComponent(
                  mainColor: AppPallete.errorColor,
                  iconData: Icons.settings,
                  title: 'Preference & Settings',
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

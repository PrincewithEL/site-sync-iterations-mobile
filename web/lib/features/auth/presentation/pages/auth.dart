import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:site_sync/core/theme/app_pallete.dart';
import 'package:site_sync/features/auth/presentation/pages/signin_page.dart';
import 'package:site_sync/features/auth/presentation/pages/signup_page.dart';

class MainAuth extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const MainAuth());
  const MainAuth({super.key});

  @override
  State<MainAuth> createState() => _MainAuthState();
}

class _MainAuthState extends State<MainAuth> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppPallete.errorColor,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  color: AppPallete.errorColor
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                          vertical: MediaQuery.of(context).size.height * 0.005,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15)),
                        ),
                        child: const TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.white,
                          indicatorColor: Colors.white,
                          dividerColor: AppPallete.transparent,
                          indicatorWeight: 3,
                          tabs: [
                            Tab(child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),
                            Tab(child: Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                            ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    SignUpPage(),
                    SignInPage()
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
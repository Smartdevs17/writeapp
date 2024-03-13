import 'package:flutter/material.dart';
import 'package:writeapp/common/widgets/title_widget.dart';
import 'package:writeapp/features/auth/presentation/login_screen.dart';
import 'package:writeapp/features/auth/presentation/register_screent.dart';
import 'package:writeapp/features/auth/presentation/reset_password_screen.dart';
import 'package:writeapp/utils/theme/theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _showResetPasswordTab = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _getTabLength(), vsync: this);
  }

  int _getTabLength() {
    return _showResetPasswordTab ? 3 : 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TitleWidget(),
              const SizedBox(height: 85),
              Expanded(
                child: DefaultTabController(
                  length: _getTabLength(),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        isScrollable: _showResetPasswordTab,
                        tabs: <Widget>[
                          const Tab(text: "Sign In"),
                          if (_showResetPasswordTab)
                            const Tab(text: "Recover Password"),
                          const Tab(text: "Sign Up"),
                        ],
                        indicatorColor: primaryColorLT,
                        dividerColor: primaryColorDK,
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: primaryColorLT,
                              width: 4.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            LoginScreen(onForgotPassword: (bool value) {
                              setState(() {
                                _showResetPasswordTab = value;
                                _tabController.dispose();
                                _tabController = TabController(
                                  length: _getTabLength(),
                                  vsync: this,
                                );
                              });
                            }),
                            if (_showResetPasswordTab)
                              const ResetPasswordScreen(),
                            const RegisterScreen(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

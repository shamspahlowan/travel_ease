import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_ease/presentation/signup_screen.dart';
import 'package:travel_ease/presentation/vehicle_selection_screen.dart';
import 'package:travel_ease/utils/sp_text_box_type.dart';
import 'package:travel_ease/utils/theme.dart';
import 'package:travel_ease/widgets/sp_form_text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TapGestureRecognizer _recognizer;
  late final TextEditingController _emailEditingController;
  late final TextEditingController _pswdEditingController;
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    _emailEditingController = TextEditingController();
    _pswdEditingController = TextEditingController();
    _recognizer = TapGestureRecognizer()
      ..onTap = () {
        _goToRegister();
      };
  }

  @override
  void dispose() {
    _recognizer.dispose();
    _emailEditingController.dispose();
    _pswdEditingController.dispose();
    super.dispose();
  }

  void _goToRegister() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SignupScreen();
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: true,
      left: false,
      right: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              // bottom: 70
              child: Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/pngs/travelImage.png"),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  colors: [
                    ThemeManager.surfaceColor,
                    ThemeManager.transparentColor,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  _branding(),
                  SizedBox(height: 120),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  _loginForm(),
                  SizedBox(height: 20),
                  _extraLoginOptTitle(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _brandContainer(asset: "assets/svgs/googleLogo.svg"),
                      _brandContainer(asset: "assets/svgs/facebookLogo.svg"),
                    ],
                  ),
                  SizedBox(height: 70),
                  _notThisPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText _notThisPage() {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, wordSpacing: 1.5),
        children: [
          TextSpan(
            text: "Haven't registered yet?",
            style: TextStyle(color: ThemeManager.onPrimaryTextColor),
          ),
          TextSpan(
            text: "Register!",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            recognizer: _recognizer,
          ),
        ],
      ),
    );
  }

  Row _extraLoginOptTitle() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ThemeManager.onBackgroundTextColor,
            thickness: 2,
            indent: 8,
            endIndent: 8,
          ),
        ),
        Container(
          padding: EdgeInsets.all(4),
          color: Colors.transparent,
          child: Text(
            "or login with",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Divider(
            color: ThemeManager.onBackgroundTextColor,
            thickness: 2,
            indent: 8,
            endIndent: 8,
          ),
        ),
      ],
    );
  }

  Widget _brandContainer({required String asset}) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        
      },
      child: Container(
        height: 60,
        width: 80,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xD41AA191),
              const Color.fromARGB(211, 32, 200, 180),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          shape: BoxShape.rectangle,
          // border: Border.all(color: ThemeManager.borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
          // color: const Color(0xD41AA191),
        ),
        child: SvgPicture.asset(asset),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SpFormTextBox(
            controller: _emailEditingController,
            type: SpTextBoxType.email,
            validator: _isValidEmail,
          ),

          SizedBox(height: 15),
          SpFormTextBox(
            controller: _pswdEditingController,
            type: SpTextBoxType.password,
            validator: _isValidPswd,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Checkbox(
                  activeColor: ThemeManager.borderColor,
                  checkColor: ThemeManager.primaryColor,
                  semanticLabel: "Remember Me?",
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
              ),
              SizedBox(width: 5),
              Text("Remember Me"),
              Expanded(child: Container()),
              Text("Forgot Password?"),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return VehicleSelectionScreen();
                    },
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _isValidEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter email address";
    }
    return null;
  }

  String? _isValidPswd(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter email password";
    }
    return null;
  }

  Widget _branding() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          "assets/svgs/roundtrip.svg",
          width: 200,
          height: 100,
          fit: BoxFit.contain,
          alignment: Alignment.center,
          colorFilter: ColorFilter.mode(
            ThemeManager.onPrimaryTextColor,
            BlendMode.srcIn,
          ),
        ),
        Positioned(
          top: 70,
          child: Text(
            "Travel Ease",
            style: TextStyle(
              fontFamily: "Righteous",
              fontSize: 46,
              fontWeight: FontWeight.w100,
              letterSpacing: 2,
              wordSpacing: 3,
            ),
          ),
        ),
      ],
    );
  }
}

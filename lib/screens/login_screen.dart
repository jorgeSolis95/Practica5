import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_ui/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _rememberMe = false;

  Widget _buildSignInTxt() {
    return const Text(
      'Sign In',
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Candara',
          fontSize: 42.0,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Candara', fontSize: 18.0),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: const Color(0x12FFFFFF),
            borderRadius: BorderRadius.circular(1.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 16.0),
                hintText: 'Enter your Email',
                hintStyle: TextStyle(color: Colors.white70)),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Candara', fontSize: 18.0),
        ),
        const SizedBox(height: 10.0),
        Container(
          decoration: BoxDecoration(
            color: const Color(0x12FFFFFF),
            borderRadius: BorderRadius.circular(1.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 16.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: ' Enter your Password',
                hintStyle: TextStyle(color: Colors.white70)),
          ),
        )
      ],
    );
  }

  Widget _buildForgotBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Fluttertoast.showToast(
            msg: 'RECUERDALA',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white70,
            textColor: Colors.black45,
            fontSize: 15.0),
        child: const Text(
          'Forgot Password',
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildRememberCB() {
    return Row(
      children: <Widget>[
        Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            )),
        const Text(
          'Remember Me',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: 120.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.white),
        onPressed: () => Navigator.pushNamed(context, '/dashboard'),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF363637),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignWTxt() {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10.0),
        Text(
          'Sign in with',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildSocialBtn(Function()? onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => Fluttertoast.showToast(
                msg: 'Log in with Facebook',
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.black,
                backgroundColor: Colors.white70,
                gravity: ToastGravity.BOTTOM),
            const AssetImage(
              "images/facebook.jpg",
            ),
          ),
          _buildSocialBtn(
                () => Fluttertoast.showToast(
                msg: 'Log in with Google',
                toastLength: Toast.LENGTH_SHORT,
                textColor: Colors.black,
                backgroundColor: Colors.white70,
                gravity: ToastGravity.BOTTOM),
            const AssetImage(
              'images/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSigninBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      width: 120.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        onPressed: () => Navigator.pushNamed(context, '/dashboard'),
        child: const Text(
          'SIGN IN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0XFF000000),
                    Color(0xC24676D5),
                    Color(0XFF363637),
                    Color(0xFF014678),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.95],
                )),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSignInTxt(),
                  const SizedBox(height: 10.0),
                  _buildEmailTF(),
                  const SizedBox(height: 10.0),
                  _buildPasswordTF(),
                  _buildForgotBtn(),
                  _buildRememberCB(),
                  _buildLoginBtn(),
                  _buildSignWTxt(),
                  _buildSocialBtnRow(),
                  _buildSigninBtn()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


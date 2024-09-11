import 'package:flutter/material.dart';

class CustomBackGround extends StatefulWidget {
  Widget body;
  Key? scaffoldKey;
  Widget? drawer;
  Widget? bottom;

  CustomBackGround({this.drawer,this.scaffoldKey,this.bottom,required this.body, super.key});

  @override
  State<CustomBackGround> createState() => _CustomBackGroundState();
}

class _CustomBackGroundState extends State<CustomBackGround> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false; // Prevent the default behavior
        },
        child: Stack(
          children: [
            Image.asset('assets/Images/logo.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: double.infinity),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                  Theme.of(context).scaffoldBackgroundColor,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Scaffold(
                key: widget.scaffoldKey,
                drawer: widget.drawer,
                bottomNavigationBar: widget.bottom != null ? widget.bottom:null,
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: widget.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

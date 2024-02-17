import 'package:chat_app/presentation/bloc/openchannel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpenchannelBloc, OpenchannelState>(
        builder: (context, state) {
      return Scaffold(
          body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 20),
              child: Image.asset("assets/images/landingpage.png"),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "Welcome to Chat App",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<OpenchannelBloc>(context)
                            .add(GetAllChannels());
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
    });
  }
}

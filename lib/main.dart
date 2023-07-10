import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        )
      ),
      debugShowCheckedModeBanner: true,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(desktop: Desktop(),mobile: Mobile());
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const ResponsiveLayout({super.key, required this.desktop,required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1){
        num mobileWidth = 666;
        if(p1.maxWidth < mobileWidth){
          return mobile;
        }
        else{
          return desktop;
        }
      },
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('MOBİLE'),
      ),
      body: const LottieBuilderMobile(),
    );
  }
}

class Desktop extends StatelessWidget{
  const Desktop({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('DESKTOP'),
      ),
      body: const LottieBuilderDesktop(),
    );
  }
}

class LottieBuilderMobile extends StatelessWidget {
  const LottieBuilderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieBuilder.asset('assets/lotties/mobile.json'));
  }
}

class LottieBuilderDesktop extends StatelessWidget {
  const LottieBuilderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieBuilder.asset('assets/lotties/desktop.json'));
  }
}
import 'package:flutter/scheduler.dart';
import 'package:paygo/app/router.dart';
import 'package:paygo/services/db/cache.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paygo/services/style/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final userToken = cache.getString('user_token');
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  String _displayedText = '';
  final String _fullText = 'PayGo';
  Ticker? _ticker;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    int index = 0;
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _ticker = Ticker((_) {
          if (index < _fullText.length) {
            setState(() {
              _displayedText = _fullText.substring(0, index + 1);
              index++;
            });
          } else {
            _ticker?.dispose();
            _ticker = null;
          }
        });
        _ticker?.start();
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (userToken != null) {
          context.go(Routes.homePage);
        } else {
          context.go(Routes.homePage);
        }
      }
    });
  }

  @override
  void dispose() {
    _ticker?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset('assets/images/logo.png', width: 300),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _displayedText,
            style: const TextStyle(
              fontSize: 84,
              color: AppColors.grade2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

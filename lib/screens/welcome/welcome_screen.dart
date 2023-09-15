import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/gen/assets.gen.dart';
import 'package:planai/screens/create_workout/create_workout_screen.dart';
import 'package:planai/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        opacity = 1;
      });
    });
  }

  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, toolbarHeight: 0, elevation: 0),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: AnimatedOpacity(
        opacity: opacity,
        curve: Curves.decelerate,
        duration: const Duration(seconds: 5),
        child: Stack(
          children: [
            SizedBox(height: double.maxFinite, child: Assets.images.welcomeScreen.image(fit: BoxFit.fitHeight)),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.logos.planai.svg(height: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                    const SizedBox(height: 50),
                    Text(S.of(context)!.welcomeScreenYourTransformation,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
                    Text(S.of(context)!.welcomeScreenItsOnTheWay,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w300, color: Colors.grey[500])),
                    Text(S.of(context)!.welcomeScreenJustStart, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w300, color: Colors.grey[700])),
                    const Spacer(),
                    CustomButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateWorkoutScreen())),
                      title: Text(S.of(context)!.welcomeScreenGetStarted),
                      color: Colors.white,
                      childColor: Colors.black,
                      radius: 14,
                      trailing: const Icon(Icons.sports_gymnastics),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/enums/user_focus_enum.dart';

class CreateWorkoutFocusStep extends StatelessWidget {
  const CreateWorkoutFocusStep({super.key, required this.onSelected});

  final Function(UserFocus focus) onSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                S.of(context)!.createWorkoutScreenWhatsYourFocus,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 30),
              ...List.generate(
                UserFocus.values.length,
                (index) => Column(
                  children: [
                    const SizedBox(height: 20),
                    ListTile(
                      key: Key(UserFocus.values[index].name),
                      onTap: () => onSelected(UserFocus.values[index]),
                      tileColor: UserFocus.values[index].color,
                      leading: UserFocus.values[index].icon,
                      title:
                          Text(UserFocus.values[index].label(context), style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        UserFocus.values[index].description(context),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

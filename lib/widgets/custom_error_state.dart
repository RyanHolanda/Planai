import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/gen/assets.gen.dart';
import 'package:planai/widgets/custom_button.dart';

class CustomErrorState extends StatelessWidget {
  const CustomErrorState({super.key, required this.onTryAgain, required this.errorDescription});

  final Function() onTryAgain;
  final String errorDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Assets.icons.errorCloud.svg(width: 100),
          const SizedBox(height: 20),
          Text(S.of(context)!.customErrorStateOhNo, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Text(
            errorDescription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 30),
          CustomButton(
            color: Colors.indigo,
            title: Text(S.of(context)!.customErrorStateTryAgain),
            onPressed: () => onTryAgain(),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/widgets/custom_snack_bar.dart';

class CreateWorkoutAgeStep extends StatefulWidget {
  const CreateWorkoutAgeStep({super.key, required this.age, required this.onContinue, required this.onChanged});

  final Function() onContinue;
  final Function(num? age) onChanged;
  final num? age;

  @override
  State<CreateWorkoutAgeStep> createState() => _CreateWorkoutAgeStepState();
}

class _CreateWorkoutAgeStepState extends State<CreateWorkoutAgeStep> {
  late final TextEditingController _ageController = TextEditingController(text: widget.age != null ? widget.age!.toString() : null);
  final FocusNode _ageFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _ageFocusNode.requestFocus();
  }

  void submit() async {
    _ageController.text.isNotEmpty
        ? {
            widget.onContinue(),
            FocusScope.of(context).unfocus(),
          }
        : CustomSnackBar.show(
            context,
            title: S.of(context)!.createWorkoutScreenAgeStepErrorText,
            type: CustomSnackBarType.error,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: const Key("age-continue"),
        onPressed: () => submit(),
        child: const Icon(Icons.navigate_next, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Text(
                  S.of(context)!.createWorkoutScreenWhatsYourAge,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 30),
                IntrinsicWidth(
                  child: TextField(
                    onEditingComplete: () => submit(),
                    key: const Key('age-field'),
                    onChanged: (value) => widget.onChanged(num.tryParse(_ageController.text)),
                    focusNode: _ageFocusNode,
                    controller: _ageController,
                    style: Theme.of(context).textTheme.headlineMedium,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    decoration: InputDecoration(
                      suffixIconConstraints: const BoxConstraints(maxHeight: 30),
                      suffix: Text(
                        S.of(context)!.createWorkoutScreenYearsOld,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).hintColor, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/weight_input_formatter.dart';
import 'package:planai/widgets/custom_snack_bar.dart';

class CreateWorkoutWeightStep extends StatefulWidget {
  const CreateWorkoutWeightStep({super.key, required this.weight, required this.onContinue, required this.onChanged, required this.weightType});

  final Function(WeightType type) onContinue;
  final Function(num? weight) onChanged;
  final num? weight;
  final WeightType? weightType;

  @override
  State<CreateWorkoutWeightStep> createState() => _CreateWorkoutWeightStepState();
}

class _CreateWorkoutWeightStepState extends State<CreateWorkoutWeightStep> {
  late WeightType _weightType = widget.weightType ?? WeightType.kg;
  late final TextEditingController _weightControllrt = TextEditingController(
    text: widget.weight != null ? widget.weightType?.formatter(TextEditingValue(text: widget.weight.toString())).text : null,
  );
  final FocusNode _weightFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _weightFocusNode.requestFocus();
  }

  void submit() async {
    _weightControllrt.text.isNotEmpty
        ? widget.onContinue(_weightType)
        : CustomSnackBar.show(
            context,
            title: S.of(context)!.createWorkoutScreenWeightStepErrorText,
            type: CustomSnackBarType.error,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: const Key("weight-continue"),
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
                  S.of(context)!.createWorkoutScreenWhatsYourWeight,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 30),
                IntrinsicWidth(
                  child: TextField(
                    onEditingComplete: () => submit(),
                    key: const Key('weight-field'),
                    onChanged: (value) => widget.onChanged(num.tryParse(_weightControllrt.text)),
                    focusNode: _weightFocusNode,
                    controller: _weightControllrt,
                    style: Theme.of(context).textTheme.headlineMedium,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WeightInputFormatter(),
                      LengthLimitingTextInputFormatter(_weightType.maxCharactes),
                    ],
                    decoration: InputDecoration(
                      suffixIconConstraints: const BoxConstraints(maxHeight: 30),
                      suffix: Text(_weightType.label(context),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).hintColor, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  child: CupertinoSlidingSegmentedControl(
                    groupValue: _weightType,
                    children: {
                      WeightType.kg: Text(key: const Key("kg-button"), WeightType.kg.label(context)),
                      WeightType.lbs: Text(key: const Key("lbs-button"), WeightType.lbs.label(context)),
                    },
                    onValueChanged: (value) => setState(() => _weightType = value!),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/height_input_formatter.dart';
import 'package:planai/widgets/custom_snack_bar.dart';

class CreateWorkoutHeightStep extends StatefulWidget {
  const CreateWorkoutHeightStep({super.key, required this.onContinue, required this.height, required this.onChanged, required this.heightType});

  final Function(HeightType type) onContinue;
  final Function(num? height) onChanged;
  final num? height;
  final HeightType? heightType;

  @override
  State<CreateWorkoutHeightStep> createState() => _CreateWorkoutHeightStepState();
}

class _CreateWorkoutHeightStepState extends State<CreateWorkoutHeightStep> {
  late final TextEditingController _heightController = TextEditingController(
    text: widget.height != null ? heightType.formatter(TextEditingValue(text: widget.height.toString())).text : null,
  );
  late HeightType heightType = widget.heightType ?? HeightType.cm;
  final FocusNode _heightFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _heightFocusNode.requestFocus();
  }

  void submit() async {
    _heightController.text.isNotEmpty
        ? widget.onContinue(heightType)
        : CustomSnackBar.show(
            context,
            title: S.of(context)!.createWorkoutScreenHeightStepErrorText,
            type: CustomSnackBarType.error,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: const Key("height-continue"),
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
                Text(S.of(context)!.createWorkoutScreenWhatsYourHeight,
                    textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400)),
                const SizedBox(height: 30),
                IntrinsicWidth(
                  child: TextField(
                    onEditingComplete: () => submit(),
                    key: const Key('height-field'),
                    onChanged: (value) => widget.onChanged(num.tryParse(_heightController.text)),
                    focusNode: _heightFocusNode,
                    controller: _heightController,
                    style: Theme.of(context).textTheme.headlineMedium,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      HeightInputFormatter(heightType: heightType),
                      LengthLimitingTextInputFormatter(heightType.maxCharacters),
                    ],
                    decoration: InputDecoration(
                      suffixIconConstraints: const BoxConstraints(maxHeight: 30),
                      suffix: Text(heightType.label(context),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).hintColor, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  child: CupertinoSlidingSegmentedControl(
                    groupValue: heightType,
                    children: {
                      HeightType.cm: Text(key: const Key("cm-button"), HeightType.cm.label(context)),
                      HeightType.ft: Text(key: const Key("ft-button"), HeightType.ft.label(context)),
                      HeightType.m: Text(key: const Key("m-button"), HeightType.m.label(context)),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        heightType = value!;
                        _heightController.text = heightType.formatter(TextEditingValue(text: _heightController.text)).text;
                      });
                    },
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

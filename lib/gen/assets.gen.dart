/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arm.svg
  SvgGenImage get arm => const SvgGenImage('assets/icons/arm.svg');

  /// File path: assets/icons/error_cloud.svg
  SvgGenImage get errorCloud => const SvgGenImage('assets/icons/error_cloud.svg');

  /// File path: assets/icons/healthcare.svg
  SvgGenImage get healthcare => const SvgGenImage('assets/icons/healthcare.svg');

  /// File path: assets/icons/lower_and_upper_body.svg
  SvgGenImage get lowerAndUpperBody => const SvgGenImage('assets/icons/lower_and_upper_body.svg');

  /// File path: assets/icons/lower_body.svg
  SvgGenImage get lowerBody => const SvgGenImage('assets/icons/lower_body.svg');

  /// File path: assets/icons/search_unknown.svg
  SvgGenImage get searchUnknown => const SvgGenImage('assets/icons/search_unknown.svg');

  /// File path: assets/icons/torso.svg
  SvgGenImage get torso => const SvgGenImage('assets/icons/torso.svg');

  /// File path: assets/icons/weight-loss.svg
  SvgGenImage get weightLoss => const SvgGenImage('assets/icons/weight-loss.svg');

  /// List of all assets
  List<SvgGenImage> get values => [arm, errorCloud, healthcare, lowerAndUpperBody, lowerBody, searchUnknown, torso, weightLoss];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/welcome_screen.jpg
  AssetGenImage get welcomeScreen => const AssetGenImage('assets/images/welcome_screen.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [welcomeScreen];
}

class $AssetsLoadingPackGen {
  const $AssetsLoadingPackGen();

  /// File path: assets/loading_pack/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/loading_pack/apple.png');

  /// File path: assets/loading_pack/balance.png
  AssetGenImage get balance => const AssetGenImage('assets/loading_pack/balance.png');

  /// File path: assets/loading_pack/bottle.png
  AssetGenImage get bottle => const AssetGenImage('assets/loading_pack/bottle.png');

  /// File path: assets/loading_pack/dumbell.png
  AssetGenImage get dumbell => const AssetGenImage('assets/loading_pack/dumbell.png');

  /// File path: assets/loading_pack/weight.png
  AssetGenImage get weight => const AssetGenImage('assets/loading_pack/weight.png');

  /// File path: assets/loading_pack/weights.png
  AssetGenImage get weights => const AssetGenImage('assets/loading_pack/weights.png');

  /// List of all assets
  List<AssetGenImage> get values => [apple, balance, bottle, dumbell, weight, weights];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/planai.svg
  SvgGenImage get planai => const SvgGenImage('assets/logos/planai.svg');

  /// List of all assets
  List<SvgGenImage> get values => [planai];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLoadingPackGen loadingPack = $AssetsLoadingPackGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

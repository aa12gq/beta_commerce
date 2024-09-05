import 'package:flutter/material.dart';
import '../index.dart';

enum ButtonWidgetType {
  none, // 无
  primary, // 主按钮
  secondary, // 次按钮
  text, // 文字按钮
  icon, // 图标按钮
  textFilled, // 文字/填充
  textRoundFilled, // 文字/填充/圆形
  iconTextUpDown, // 图标/文字/上下
  iconTextOutlined, // 图标/文字/边框
  iconTextUpDownOutlined, // 图标/文字/上下/边框
  textIcon, // 文字/图标
}

/// 按钮
class ButtonWidget extends StatelessWidget {
  /// 按钮类型
  final ButtonWidgetType type;

  /// tap 事件
  final Function()? onTap;

  /// 文字字符串
  final String? text;

  /// 子组件
  final Widget? child;

  /// 图标
  final Widget? icon;

  /// 圆角
  final double? borderRadius;

  /// 背景色
  final Color? backgroundColor;

  /// 边框色
  final Color? borderColor;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  const ButtonWidget({
    super.key,
    this.type = ButtonWidgetType.none,
    this.onTap,
    this.text,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  });

  /// 主要
  const ButtonWidget.primary(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.primary,
    this.width = double.infinity,
    this.height = 50,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
  });

  /// 次要
  const ButtonWidget.secondary(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.secondary,
    this.width = double.infinity,
    this.height = 50,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
  });

  /// 文字
  ButtonWidget.text(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.text,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  }) : child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        );

  /// 图标
  const ButtonWidget.icon(
    this.icon, {
    super.key,
    this.type = ButtonWidgetType.icon,
    this.onTap,
    this.text,
    this.borderRadius,
    this.backgroundColor,
    this.child,
    this.borderColor,
    this.width,
    this.height,
  });

  /// 文字/填充
  ButtonWidget.textFilled(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.textFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        );

  /// 文字/填充/圆形 按钮
  ButtonWidget.textRoundFilled(
    this.text, {
    super.key,
    this.type = ButtonWidgetType.textRoundFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = TextWidget.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        );

  /// 图标文字 上下
  ButtonWidget.iconTextUpDown(
    this.icon,
    this.text, {
    super.key,
    this.type = ButtonWidgetType.iconTextUpDown,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          icon!,
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toColumn(
          mainAxisSize: MainAxisSize.min,
        );

  /// 图标 / 文字 / 边框
  ButtonWidget.iconTextOutlined(
    this.icon,
    this.text, {
    super.key,
    this.type = ButtonWidgetType.iconTextOutlined,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          icon!.paddingRight(AppSpace.iconTextSmail),
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toRow(
          mainAxisSize: MainAxisSize.min,
        );

  /// 图标 / 文字 / 上下 / 边框
  ButtonWidget.iconTextUpDownOutlined(
    this.icon,
    this.text, {
    super.key,
    this.type = ButtonWidgetType.iconTextUpDownOutlined,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          icon!.paddingBottom(AppSpace.iconTextSmail),
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ].toColumn(
          mainAxisSize: MainAxisSize.min,
        );

  /// 文字 / 图标
  ButtonWidget.textIcon(
    this.text,
    this.icon, {
    super.key,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.type = ButtonWidgetType.textIcon,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : child = <Widget>[
          TextWidget.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ).paddingRight(AppSpace.iconTextSmail),
          icon!,
        ].toRow(
          mainAxisSize: MainAxisSize.min,
        );

  // 背景
  WidgetStateProperty<Color?>? get _backgroundColor {
    switch (type) {
      case ButtonWidgetType.primary:
        return WidgetStateProperty.all(backgroundColor ?? AppColors.primary);
      default:
        return WidgetStateProperty.all(backgroundColor ?? Colors.transparent);
    }
  }

  // 边框
  WidgetStateProperty<BorderSide?>? get _side {
    switch (type) {
      case ButtonWidgetType.secondary:
        return WidgetStateProperty.all(BorderSide(
          color: borderColor ?? AppColors.primary,
          width: 1,
        ));
      case ButtonWidgetType.iconTextOutlined:
      case ButtonWidgetType.iconTextUpDownOutlined:
        return WidgetStateProperty.all(BorderSide(
          color: borderColor ?? AppColors.outline,
          width: 1,
        ));
      default:
        return null;
    }
  }

  // 阴影颜色
  WidgetStateProperty<Color?>? get _overlayColor {
    switch (type) {
      case ButtonWidgetType.primary:
        return null;
      default:
        return WidgetStateProperty.all(AppColors.surfaceContainerHighest);
    }
  }

  // 形状圆角
  WidgetStateProperty<OutlinedBorder?>? get _shape {
    switch (type) {
      case ButtonWidgetType.primary:
      case ButtonWidgetType.secondary:
        return WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppRadius.button)),
          ),
        );
      case ButtonWidgetType.textFilled:
      case ButtonWidgetType.iconTextOutlined:
      case ButtonWidgetType.iconTextUpDownOutlined:
        return WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppRadius.buttonTextFilled)),
          ),
        );
      case ButtonWidgetType.textRoundFilled:
        return WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          ),
        );
      default:
        return null;
    }
  }

  // padding
  WidgetStateProperty<EdgeInsetsGeometry?>? get _padding {
    switch (type) {
      // case ButtonWidgetType.primary:
      // case ButtonWidgetType.secondary:
      //   return null;
      default:
        return WidgetStateProperty.all(EdgeInsets.zero);
    }
  }

  // 子元素
  Widget? get _child {
    switch (type) {
      case ButtonWidgetType.primary:
        return TextWidget.button(
          text: text!,
          color: AppColors.onPrimary,
        );
      case ButtonWidgetType.secondary:
        return TextWidget.button(
          text: text!,
          color: AppColors.primary,
        );
      case ButtonWidgetType.icon:
        return icon;
      default:
        return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        child: _child,
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(0, 0)),
          elevation: WidgetStateProperty.all(0),
          backgroundColor: _backgroundColor,
          side: _side,
          overlayColor: _overlayColor,
          shape: _shape,
          padding: _padding,
        ),
      ),
    );
  }
}

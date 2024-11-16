part of './utils.dart';

abstract class UIEventHandler {
  const UIEventHandler();

  static FutureOr<T?> handleEvent<T>(
    BuildContext context,
    UIEvent<T>? event,
    UIEvent<T>? oldEvent,
  ) async {
    if (event == null) {
      return Future<T?>.value();
    }
    switch (event.type) {
      case UIEventType.loading:
        _showLoading(context, event);
        return Future<T?>.value();

      case UIEventType.hideLoading:
        _hideLoading(context, oldEvent);
        return Future<T?>.value();

      case UIEventType.run:
        _hideLoading(context, oldEvent);
        return _run(context, event, event.function!);

      case UIEventType.navigate:
        _hideLoading(context, oldEvent);
        _navigateTo(context, event);

      case UIEventType.pop:
        _pop(context);
    }

    return Future<T?>.value();
  }

  static Future<T?> _showLoading<T>(
    BuildContext context,
    UIEvent<T> event,
  ) async {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0.5),
      pageBuilder: (_, __, ___) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.7,
            child: const CircularProgressIndicator(
              strokeWidth: Layout.space8,
              color: FMColors.orange3,
            ),
          ),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Layout.space500,
                ),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Layout.space500,
                ),
                child: Image.asset(
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.fitWidth,
                  Animations.fmLoader,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return Future<T?>.value();
  }

  static void _hideLoading<T>(
    BuildContext context,
    UIEvent<T>? event,
  ) {
    if (event?.type == UIEventType.loading) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static Future<T?> _run<T>(
    BuildContext context,
    UIEvent<T> event,
    FutureOr<T?> Function(BuildContext) launch,
  ) async =>
      launch.call(context);

  static Future<T?> _navigateTo<T>(
    BuildContext context,
    UIEvent<T> event,
  ) =>
      Navigator.push<T>(
        context,
        event.route!,
      );

  static void _pop<T>(BuildContext context) {
    Navigator.pop(context, T);
  }
}

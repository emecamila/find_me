// Mocks generated by Mockito 5.4.4 from annotations
// in find_me/test/presentation/screens/home/view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:ui' as _i15;

import 'package:find_me/data/extensions/extensions.dart' as _i2;
import 'package:find_me/domain/entities/entities.dart' as _i12;
import 'package:find_me/domain/use_cases/use_cases.dart' as _i10;
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/gestures.dart' as _i7;
import 'package:flutter/rendering.dart' as _i13;
import 'package:flutter/src/widgets/basic.dart' as _i14;
import 'package:flutter/src/widgets/framework.dart' as _i16;
import 'package:flutter/src/widgets/scroll_activity.dart' as _i6;
import 'package:flutter/src/widgets/scroll_context.dart' as _i4;
import 'package:flutter/src/widgets/scroll_controller.dart' as _i17;
import 'package:flutter/src/widgets/scroll_metrics.dart' as _i8;
import 'package:flutter/src/widgets/scroll_physics.dart' as _i3;
import 'package:flutter/src/widgets/scroll_position.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T, E> extends _i1.SmartFake implements _i2.Result<T, E> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScrollPhysics_1 extends _i1.SmartFake implements _i3.ScrollPhysics {
  _FakeScrollPhysics_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScrollContext_2 extends _i1.SmartFake implements _i4.ScrollContext {
  _FakeScrollContext_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeValueNotifier_3<T> extends _i1.SmartFake
    implements _i5.ValueNotifier<T> {
  _FakeValueNotifier_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScrollHoldController_4 extends _i1.SmartFake
    implements _i6.ScrollHoldController {
  _FakeScrollHoldController_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDrag_5 extends _i1.SmartFake implements _i7.Drag {
  _FakeDrag_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScrollMetrics_6 extends _i1.SmartFake implements _i8.ScrollMetrics {
  _FakeScrollMetrics_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeScrollPosition_7 extends _i1.SmartFake
    implements _i9.ScrollPosition {
  _FakeScrollPosition_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetDataWithFiltersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetDataWithFiltersUseCase extends _i1.Mock
    implements _i10.GetDataWithFiltersUseCase {
  MockGetDataWithFiltersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Result<List<_i12.Person>, _i2.BackError>> call(
          {required Map<String, String>? parameters}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#parameters: parameters},
        ),
        returnValue:
            _i11.Future<_i2.Result<List<_i12.Person>, _i2.BackError>>.value(
                _FakeResult_0<List<_i12.Person>, _i2.BackError>(
          this,
          Invocation.method(
            #call,
            [],
            {#parameters: parameters},
          ),
        )),
      ) as _i11.Future<_i2.Result<List<_i12.Person>, _i2.BackError>>);
}

/// A class which mocks [ScrollPosition].
///
/// See the documentation for Mockito's code generation for more information.
class MockScrollPosition extends _i1.Mock implements _i9.ScrollPosition {
  MockScrollPosition() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ScrollPhysics get physics => (super.noSuchMethod(
        Invocation.getter(#physics),
        returnValue: _FakeScrollPhysics_1(
          this,
          Invocation.getter(#physics),
        ),
      ) as _i3.ScrollPhysics);

  @override
  _i4.ScrollContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeScrollContext_2(
          this,
          Invocation.getter(#context),
        ),
      ) as _i4.ScrollContext);

  @override
  bool get keepScrollOffset => (super.noSuchMethod(
        Invocation.getter(#keepScrollOffset),
        returnValue: false,
      ) as bool);

  @override
  _i5.ValueNotifier<bool> get isScrollingNotifier => (super.noSuchMethod(
        Invocation.getter(#isScrollingNotifier),
        returnValue: _FakeValueNotifier_3<bool>(
          this,
          Invocation.getter(#isScrollingNotifier),
        ),
      ) as _i5.ValueNotifier<bool>);

  @override
  double get minScrollExtent => (super.noSuchMethod(
        Invocation.getter(#minScrollExtent),
        returnValue: 0.0,
      ) as double);

  @override
  double get maxScrollExtent => (super.noSuchMethod(
        Invocation.getter(#maxScrollExtent),
        returnValue: 0.0,
      ) as double);

  @override
  bool get hasContentDimensions => (super.noSuchMethod(
        Invocation.getter(#hasContentDimensions),
        returnValue: false,
      ) as bool);

  @override
  double get pixels => (super.noSuchMethod(
        Invocation.getter(#pixels),
        returnValue: 0.0,
      ) as double);

  @override
  bool get hasPixels => (super.noSuchMethod(
        Invocation.getter(#hasPixels),
        returnValue: false,
      ) as bool);

  @override
  double get viewportDimension => (super.noSuchMethod(
        Invocation.getter(#viewportDimension),
        returnValue: 0.0,
      ) as double);

  @override
  bool get hasViewportDimension => (super.noSuchMethod(
        Invocation.getter(#hasViewportDimension),
        returnValue: false,
      ) as bool);

  @override
  bool get haveDimensions => (super.noSuchMethod(
        Invocation.getter(#haveDimensions),
        returnValue: false,
      ) as bool);

  @override
  bool get shouldIgnorePointer => (super.noSuchMethod(
        Invocation.getter(#shouldIgnorePointer),
        returnValue: false,
      ) as bool);

  @override
  double get devicePixelRatio => (super.noSuchMethod(
        Invocation.getter(#devicePixelRatio),
        returnValue: 0.0,
      ) as double);

  @override
  bool get allowImplicitScrolling => (super.noSuchMethod(
        Invocation.getter(#allowImplicitScrolling),
        returnValue: false,
      ) as bool);

  @override
  _i13.ScrollDirection get userScrollDirection => (super.noSuchMethod(
        Invocation.getter(#userScrollDirection),
        returnValue: _i13.ScrollDirection.idle,
      ) as _i13.ScrollDirection);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i13.AxisDirection get axisDirection => (super.noSuchMethod(
        Invocation.getter(#axisDirection),
        returnValue: _i13.AxisDirection.up,
      ) as _i13.AxisDirection);

  @override
  _i13.Axis get axis => (super.noSuchMethod(
        Invocation.getter(#axis),
        returnValue: _i13.Axis.horizontal,
      ) as _i13.Axis);

  @override
  bool get outOfRange => (super.noSuchMethod(
        Invocation.getter(#outOfRange),
        returnValue: false,
      ) as bool);

  @override
  bool get atEdge => (super.noSuchMethod(
        Invocation.getter(#atEdge),
        returnValue: false,
      ) as bool);

  @override
  double get extentBefore => (super.noSuchMethod(
        Invocation.getter(#extentBefore),
        returnValue: 0.0,
      ) as double);

  @override
  double get extentInside => (super.noSuchMethod(
        Invocation.getter(#extentInside),
        returnValue: 0.0,
      ) as double);

  @override
  double get extentAfter => (super.noSuchMethod(
        Invocation.getter(#extentAfter),
        returnValue: 0.0,
      ) as double);

  @override
  double get extentTotal => (super.noSuchMethod(
        Invocation.getter(#extentTotal),
        returnValue: 0.0,
      ) as double);

  @override
  void absorb(_i9.ScrollPosition? other) => super.noSuchMethod(
        Invocation.method(
          #absorb,
          [other],
        ),
        returnValueForMissingStub: null,
      );

  @override
  double setPixels(double? newPixels) => (super.noSuchMethod(
        Invocation.method(
          #setPixels,
          [newPixels],
        ),
        returnValue: 0.0,
      ) as double);

  @override
  void correctPixels(double? value) => super.noSuchMethod(
        Invocation.method(
          #correctPixels,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void correctBy(double? correction) => super.noSuchMethod(
        Invocation.method(
          #correctBy,
          [correction],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void forcePixels(double? value) => super.noSuchMethod(
        Invocation.method(
          #forcePixels,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void saveScrollOffset() => super.noSuchMethod(
        Invocation.method(
          #saveScrollOffset,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void restoreScrollOffset() => super.noSuchMethod(
        Invocation.method(
          #restoreScrollOffset,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void restoreOffset(
    double? offset, {
    bool? initialRestore = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #restoreOffset,
          [offset],
          {#initialRestore: initialRestore},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void saveOffset() => super.noSuchMethod(
        Invocation.method(
          #saveOffset,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  double applyBoundaryConditions(double? value) => (super.noSuchMethod(
        Invocation.method(
          #applyBoundaryConditions,
          [value],
        ),
        returnValue: 0.0,
      ) as double);

  @override
  bool applyViewportDimension(double? viewportDimension) => (super.noSuchMethod(
        Invocation.method(
          #applyViewportDimension,
          [viewportDimension],
        ),
        returnValue: false,
      ) as bool);

  @override
  bool applyContentDimensions(
    double? minScrollExtent,
    double? maxScrollExtent,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyContentDimensions,
          [
            minScrollExtent,
            maxScrollExtent,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  bool correctForNewDimensions(
    _i8.ScrollMetrics? oldPosition,
    _i8.ScrollMetrics? newPosition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #correctForNewDimensions,
          [
            oldPosition,
            newPosition,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  void applyNewDimensions() => super.noSuchMethod(
        Invocation.method(
          #applyNewDimensions,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<void> ensureVisible(
    _i13.RenderObject? object, {
    double? alignment = 0.0,
    Duration? duration = Duration.zero,
    _i14.Curve? curve = _i14.Curves.ease,
    _i9.ScrollPositionAlignmentPolicy? alignmentPolicy =
        _i9.ScrollPositionAlignmentPolicy.explicit,
    _i13.RenderObject? targetRenderObject,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #ensureVisible,
          [object],
          {
            #alignment: alignment,
            #duration: duration,
            #curve: curve,
            #alignmentPolicy: alignmentPolicy,
            #targetRenderObject: targetRenderObject,
          },
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> animateTo(
    double? to, {
    required Duration? duration,
    required _i14.Curve? curve,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #animateTo,
          [to],
          {
            #duration: duration,
            #curve: curve,
          },
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void jumpTo(double? value) => super.noSuchMethod(
        Invocation.method(
          #jumpTo,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void pointerScroll(double? delta) => super.noSuchMethod(
        Invocation.method(
          #pointerScroll,
          [delta],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<void> moveTo(
    double? to, {
    Duration? duration,
    _i14.Curve? curve,
    bool? clamp = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #moveTo,
          [to],
          {
            #duration: duration,
            #curve: curve,
            #clamp: clamp,
          },
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void jumpToWithoutSettling(double? value) => super.noSuchMethod(
        Invocation.method(
          #jumpToWithoutSettling,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.ScrollHoldController hold(_i15.VoidCallback? holdCancelCallback) =>
      (super.noSuchMethod(
        Invocation.method(
          #hold,
          [holdCancelCallback],
        ),
        returnValue: _FakeScrollHoldController_4(
          this,
          Invocation.method(
            #hold,
            [holdCancelCallback],
          ),
        ),
      ) as _i6.ScrollHoldController);

  @override
  _i7.Drag drag(
    _i7.DragStartDetails? details,
    _i15.VoidCallback? dragCancelCallback,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #drag,
          [
            details,
            dragCancelCallback,
          ],
        ),
        returnValue: _FakeDrag_5(
          this,
          Invocation.method(
            #drag,
            [
              details,
              dragCancelCallback,
            ],
          ),
        ),
      ) as _i7.Drag);

  @override
  void beginActivity(_i6.ScrollActivity? newActivity) => super.noSuchMethod(
        Invocation.method(
          #beginActivity,
          [newActivity],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didStartScroll() => super.noSuchMethod(
        Invocation.method(
          #didStartScroll,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateScrollPositionBy(double? delta) => super.noSuchMethod(
        Invocation.method(
          #didUpdateScrollPositionBy,
          [delta],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didEndScroll() => super.noSuchMethod(
        Invocation.method(
          #didEndScroll,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didOverscrollBy(double? value) => super.noSuchMethod(
        Invocation.method(
          #didOverscrollBy,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateScrollDirection(_i13.ScrollDirection? direction) =>
      super.noSuchMethod(
        Invocation.method(
          #didUpdateScrollDirection,
          [direction],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void didUpdateScrollMetrics() => super.noSuchMethod(
        Invocation.method(
          #didUpdateScrollMetrics,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool recommendDeferredLoading(_i16.BuildContext? context) =>
      (super.noSuchMethod(
        Invocation.method(
          #recommendDeferredLoading,
          [context],
        ),
        returnValue: false,
      ) as bool);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void debugFillDescription(List<String>? description) => super.noSuchMethod(
        Invocation.method(
          #debugFillDescription,
          [description],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.ScrollMetrics copyWith({
    double? minScrollExtent,
    double? maxScrollExtent,
    double? pixels,
    double? viewportDimension,
    _i13.AxisDirection? axisDirection,
    double? devicePixelRatio,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #copyWith,
          [],
          {
            #minScrollExtent: minScrollExtent,
            #maxScrollExtent: maxScrollExtent,
            #pixels: pixels,
            #viewportDimension: viewportDimension,
            #axisDirection: axisDirection,
            #devicePixelRatio: devicePixelRatio,
          },
        ),
        returnValue: _FakeScrollMetrics_6(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #minScrollExtent: minScrollExtent,
              #maxScrollExtent: maxScrollExtent,
              #pixels: pixels,
              #viewportDimension: viewportDimension,
              #axisDirection: axisDirection,
              #devicePixelRatio: devicePixelRatio,
            },
          ),
        ),
      ) as _i8.ScrollMetrics);
}

/// A class which mocks [ScrollController].
///
/// See the documentation for Mockito's code generation for more information.
class MockScrollController extends _i1.Mock implements _i17.ScrollController {
  MockScrollController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get keepScrollOffset => (super.noSuchMethod(
        Invocation.getter(#keepScrollOffset),
        returnValue: false,
      ) as bool);

  @override
  double get initialScrollOffset => (super.noSuchMethod(
        Invocation.getter(#initialScrollOffset),
        returnValue: 0.0,
      ) as double);

  @override
  Iterable<_i9.ScrollPosition> get positions => (super.noSuchMethod(
        Invocation.getter(#positions),
        returnValue: <_i9.ScrollPosition>[],
      ) as Iterable<_i9.ScrollPosition>);

  @override
  bool get hasClients => (super.noSuchMethod(
        Invocation.getter(#hasClients),
        returnValue: false,
      ) as bool);

  @override
  _i9.ScrollPosition get position => (super.noSuchMethod(
        Invocation.getter(#position),
        returnValue: _FakeScrollPosition_7(
          this,
          Invocation.getter(#position),
        ),
      ) as _i9.ScrollPosition);

  @override
  double get offset => (super.noSuchMethod(
        Invocation.getter(#offset),
        returnValue: 0.0,
      ) as double);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i11.Future<void> animateTo(
    double? offset, {
    required Duration? duration,
    required _i14.Curve? curve,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #animateTo,
          [offset],
          {
            #duration: duration,
            #curve: curve,
          },
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void jumpTo(double? value) => super.noSuchMethod(
        Invocation.method(
          #jumpTo,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void attach(_i9.ScrollPosition? position) => super.noSuchMethod(
        Invocation.method(
          #attach,
          [position],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void detach(_i9.ScrollPosition? position) => super.noSuchMethod(
        Invocation.method(
          #detach,
          [position],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.ScrollPosition createScrollPosition(
    _i3.ScrollPhysics? physics,
    _i4.ScrollContext? context,
    _i9.ScrollPosition? oldPosition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createScrollPosition,
          [
            physics,
            context,
            oldPosition,
          ],
        ),
        returnValue: _FakeScrollPosition_7(
          this,
          Invocation.method(
            #createScrollPosition,
            [
              physics,
              context,
              oldPosition,
            ],
          ),
        ),
      ) as _i9.ScrollPosition);

  @override
  void debugFillDescription(List<String>? description) => super.noSuchMethod(
        Invocation.method(
          #debugFillDescription,
          [description],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i15.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

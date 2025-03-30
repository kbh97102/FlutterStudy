# Flutter Study

## 내가 찾는 위젯이 이미 존재하는지 검색은 어떻게 하는걸까 공식문서에 있으려나
[공식문서](https://docs.flutter.dev/ui/widgets)에서도 애니메이션이나 레이아웃에 대한 소개가 있고

[Flutter Awesome](https://flutterawesome.com/tag/music-player/)처럼 플러터로 만든 각종 UI가 있는 사이트도 있다 요 사이트에서는 gitHub을 통해 코드를 볼 수 있는 것도 있어서 중간중간 막히거나 디자이너가 없는 상태에서 사이드 플젝을할 때 참고해도 좋을 것 같다


## 인터페이스나, abstact 클래스는 어떻게 관리되고 어떻게 활용하면 좋을까
kotlin와 비슷함
다만 다트는 일반 클래스가 상속도, 인터페이스 구현도 가능함.

일반 클래스가 인터페이스의 역할도할 수 있음

dart3에서는 `interface class`가 추가됨
implemens만 가능하도록 강제한 클래스

## sealed class 같은건 없을까
코틀린과 비슷함

## nestedScroll을 지원할까?
NestedScrollView와 Sliver를 통해 스크롤에 대한 다양한 기능 (StickyHeader, CoordinateLayout의 appBar)을 제공함

CustomScrollView을 통해서 모든 위젯들을 Sliver를 통해 더 다양하거나 복잡한 스크롤 UI도 구현이 가능하다

고성능의 스크롤 혹은 새로운 기능이 필요하다면 CustomScrollView를 사용해 만들면 되고 간단한 UI의 경우 NestedScrollView를 사용하면 될 것 같다

Sliver가 스크롤의 끝판왕이라고하는데 자세한건 나중에 스크롤을 직접 만들어보면서 해봐야겠다
[공식 문서](https://docs.flutter.dev/ui/layout/scrolling/slivers)에 설명이 잘되어있으니 삽질좀 해봐야겠다

## subcomposeLayout은 있을까?, 다른 뷰의 사이즈에 기반하거나 자식 뷰의 사이즈를 활용해야될 때 어떻게 할까, with ConstraintLayout

### LayoutBuilder
부모의 constraint를 활용할 수 있는 위젯, 다만 자식들의 사이즈를 측정하지는 않음
``` dart
LayoutBuilder(
  builder: (context, constraints) {
    return Text('maxHeight: ${constraints.maxHeight}');
  },
)
```

### 자식의 크기를 알고 활용하고 싶다면??
`addPostFrameCallback`을 통해 렌더링 이후 콜백을 사용하는 방법이 있다
``` dart
class _MeasureSizeState extends State<MeasureSize> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        widget.onChange(box.size);
      }
    });

    return widget.child;
  }
}
```
이후 위젯 트리에서 발생하는 알림(크기 변화, 스크롤, 제스쳐 등)을 수신하고 처리하는 `NotificationListener`와 잦은 상태변경을 방지하기 위한 debouncer를 활용해서 자식사이즈를 가지고 UI 대응이 가능하긴 하다

뭔가 부족한데?  

### 그런 당신을 위한 CustomMultiChildLayout
여러개의 자식들의 size와 position이 복잡한 연관성을 가진 경우 delegate를 통해 내가 사이즈와 위치를 결정할 수 있다. 만약 child가 하나뿐이라면 `CustomSingleChildLayout`의 사용을 추천한다 
[공식 문서](https://api.flutter.dev/flutter/widgets/CustomMultiChildLayout-class.html)에서 문서와 테스트해볼 공간이 있으니 차후 커스텀 레이아웃이 필요한 경우 테스트 해보려한다

# 자주 사용되는 패턴은 뭘까? MVVM? MVI?
공식문서에서도 MVVM을 소개해주고 있고 각자 프로젝트에 맞춰 MVVM, MVI 사용하는 듯 하다

# 자주 사용되는 DI 라이브러리는 뭘까
GetIt + Injectable 조합은 hilt와 유사하게 사용할 수 있다고하고 
상태 관리 라이브러리인 Riverpod,Provider 에서도 DI를 지원한다고하니 알아봐야겠다

# 상태관리는 어떤 라이브러리를 주로 사용할 까
Provider, Bloc, Riverpod 정도가 많이 보이는데 
이번에는 Riverpod를 공부해볼 예정


* 통신은 retrofit이 자주 쓰일까?
* 화면이동은 플러터가 제공해주는 Navigation만 사용하는 걸까?
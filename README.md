## build_runner

flutter에서 조금 더 편하게 json 을 핸들링 할 수 있게 도와주는 dependencies 터미널 환경에서

```dart
flutter packages pub run build_runner build
```

를 적용시켜주게 되면 .dart의 파일 확장자명을 가진 클래스가 하나 생기게 된다.

단 `flutter packages pub run build_runner build` 를 시도하기전에 먼저 해줘야 하는것이 있다. data클래스 안에서 다음과 같이 하나 추가해줘야한다.

```dart
part 'dormitory_response.g.dart';
```

.g의 앞 부분은 데이터클래스 파일명을 따라간다. 즉 데이터 파일명이 test.dart 면 build_runner 해주기전 `test.dart` 파일 안에 `part 'test.g.dart';` 이렇게 해줘야 한다. -> 여러번 사용하다 보니 part test.g.dart 입력하주면 `flutter packages pub run build_runner build` 실행시 같은 디렉토리에 파일이 생성 되는것이다.

## @JsonSerializable

build_runner와 주로 함께 쓰이는 dependencies는 @JsonSerializable이다

클래스에 대한 JSON 코드를 생성하거나 클래스에서 생성하려면으로 어노테이션을 @JsonSerializable로 최상위에 단다.

```dart
@JsonSerializable()
class DormitoryMeals {
  @JsonKey(name: '아침(빵x)')
  ...
}
```

JsonSerializable생성 된 코드를 구성 하기 위해 인수를 제공 할 수 있다. 개별 필드에 어노테이션을 달고 @JsonKey사용자 정의 인수를 제공 하여 개별 필드를 사용자 정의 할 수도 있다.

## SimpleAnimation

플러터 패키지 중 에서 simple animation 이라는 패키지가 있다. 해당 패키지는 애니메이션 구현을 도와주는 패키지이다.

이번 프로젝트에는 두 가지 방법으로 사용 하였다

위쪽에서 아래로 나타나는 애니메이션)

```Dart
class CustomFadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  CustomFadeAnimation({
    this.delay,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
```

가운데에서 점점 올라오는 애니메이션)

```Dart
class CustomSlideAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  CustomSlideAnimation({
    this.child,
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final tween = MultiTrackTween(
      [
        Track('translateY').add(
            Duration(milliseconds: 1500), Tween(begin: height * 0.4, end: 0.0),
            curve: Curves.easeOut)
      ],
    );
    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Transform.translate(
        offset: Offset(
          0,
          animation["translateY"],
        ),
        child: child,
      ),
    );
  }
}
```

## FutureBuild 한번만 호출하게 만들기

Stateful widget 에서 UI를 업데이트 시켜주면 주로 사용하는 StatefulWidget에 내장되어 있는 함수 setState(){} 하지만 해당 함수는 전체 UI를 업데이트 즉 build 함수를
다시 호출 시키는것으로 알고 있다. 그로인해 build 함수 안에 FutureBuilder 클래스가 있다면 다시 재 호출하게 된다.
보통 FutureBuilder는 http에서 비동기처리로 데이터를 가져와 위젯으로 뿌려줄 때 사용하게 되는데 setState를 쓸 때마다 build가 호출되면 계속해서 http 에 리퀘스트 하게 될것이다.
즉, 필요없는 요청이 많아짐! 해당 이슈를 해결하고자 구글에 검색 중 본인과 같은 문제를 해결하고자 하는 사람을 발견, [블로그](https://idlecomputer.tistory.com/326)에 들어가보니 해당 글쓴이는 async 패키지안에 AsyncMemoizer클래스를 사용

해당 클래스는 async를 한번만 실행하고 결과값을 캐시에 저장 재 호출할 때 캐시에 저장되어있는 데이터를 리턴 해주는 클래스이다.

그로인해 코드는

```Dart
FutureBuilder(
        future: dormitoryMeals.getMealList(),
        builder: (context, mealsData) {
          ...
        }
)
```

에서

```Dart
FutureBuilder(
        future: _memorizer.runOnce(() {
          dormitoryMeals.getMealList();
        }),
        builder: (context, mealsData) {
          ...
        }
)
```

로 future 부분을 변경시켜 주었다.

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

.g의 앞 부분은 데이터클래스 파일명을 따라간다. 즉 데이터 파일명이 test.dart 면 build_runner 해주기전 `test.dart` 파일 안에 `part 'test.g.dart';` 이렇게 해줘야 한다.

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


# Stream

비동기 데이터 시퀸스를 제공, 순차적으로 비동기 이벤트를 처리함

이 시큄스에는 사용자 이벤트, 파일에서 읽은 데이터 등이 포함됨

스트림은 `await for`, `listen()`을 통해 처리 가능

``` Dart
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

void main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); // 55
}
```

countStream함수로 Stream을 반환하는데 여기서 `yield`를 통해서 데이터를 내보낸다 

`yield*`는 스트림 전체를 반환한다고 보면 된다. 재귀함수에 사용하면 성능상 이점이 있다고 하는데 좀 더 찾아봐야할 것 같다.

### 에러 이벤트
스트림은 에러 또한 성공한 데이터처럼 에러도 전달한다. 대부분의 스트림들은 첫 에러가 발생한 시점에서 종료되지만, 여러 에러가 발생해도 스트림이 종료되지 않도록 설정할 수 있다.

에러 처리는 `try-catch`를 활용한다.

### Stream 종류
#### Single subscription stream
이벤트들은 정확한 순서로 전달되어야하고, 누락 없이 수신받아야 함, 예를 들면 파일을 읽거나 웹 요청을 수신하는 경우 

이 스트림은 한번만 구독가능

나중에 다시 구독하면 init event를 놓칠 수 있고, 그럼 나머지 스트림의 데이터가 의미없어질 수 있음

스트림을 구독하기 시작하면 데이터는 chunk 단위로 수신됨


#### Broadcast stream

개별 메세지를 하나씩 처리하기 위한 스트림, 예를 들면 브라우저에서 유저의 마우스 이벤트 처리 같은 곳

언제든 스트림을 구독할 수 있고 구독 중에만 이벤트를 수신함

여러 리스너가 동시에 구독할 수 있고 이전 구독을 취소한 뒤에도 재구독 가능


### Stream 변형



### Stream 생성 
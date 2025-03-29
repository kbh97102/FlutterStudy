# FlutterTest

# 노마드코더 플러터 기초 강의
클론코딩을 하면서 생각나는 점들을 하나씩 정리해보자
노션이 되든 .md파일로 하든
기초 강의를 마친 시점에서는 아래와 같은 질문들이 생겨났고 공부하면서 생기는 것들은 이후 추가로 작성

# 기초 강의를 들으며 생긴 질문들 
### 플러터 관련
* 테스트는 어떻게 진행될까
* 컴포넌트 분리를해도 compose에 비하면 가독성이 바닥을 치는데 개선할 방법이 없을까
* 디자인 시스템처럼 텍스트 스타일이나 색상을 관리하고 사용하기 좋은 방법은 없을까
* compose에서 stable, immutableCollection처럼 최적화 하는 방법은 const 활용 말고는 없을까?
* measure, place하는 방식은 어떻게 이루어질까
* stateful widget에서 하나만 변경되어도 build의 모든 컴포넌트들이 다시 그려질까?
* api 통신간에 json파싱을 더 보기좋고 쉽게하는 방식은 없을까 gson처럼
* theme을 어떻게 잘 활용할 수 있을까
* late의 경우 코틀린의 lateinit과 비슷한데 초기화되었는지 어떻게 검사할 수 있을까
* setState말고 상태관리는 어떻게 할 수 있을까
* 자주 사용되는 패턴은 뭘까? MVVM? MVI?
* 자주 사용되는 DI 라이브러리는 뭘까
* 통신은 retrofit이 자주 쓰일까?
* 화면이동은 플러터가 제공해주는 Navigation만 사용하는 걸까?
* 제공해주는 위젯이 아닌 커스텀 위젯은 어떻게 만드는걸까
* 내가 찾는 위젯이 이미 존재하는지 검색은 어떻게 하는걸까 공식문서에 있으려나
* 인터페이스나, abstact 클래스는 어떻게 관리되고 어떻게 활용하면 좋을까
* sealed class 같은건 없을까
* nestedScroll을 지원할까?
* coordinateLayout은 있을까?
* subcomposeLayout은 있을까?, 다른 뷰의 사이즈에 기반하거나 자식 뷰의 사이즈를 활용해야될 때 어떻게 할까 
* constraintLayout은 있을까?
* Pager은 어떻게 되어있을까
* infinity scroll은 어떻게 해야할까?
* page call은 어떻게 해야할까 page: Int, index: Int 이런거
* 이미지로딩은 Image.network로 충분할까? glide같은거 안쓰려나
* FutureBuilder처럼 api 통신과 같이 연계할 방법이 더 있을까?
  * 에러 처리를 일반화된 함수로 통제해서 하고싶은데 커스텀 뷰로 만들 방법은 없을까

### 모듈 관련
* 네이티브 모듈을 만들어서 적용하고 싶은데 KMM처럼 인터페이스를 만들고 각각의 네이티브 모듈에서 개발을 진행하는 걸까?

### [비동기 관련](async_study.md)
* ~~비동기 처리는 async, await이 끝일까? async+도 있던데 이건 뭘까~~
* ~~kotlin flow, coroutine같은 개념은 없는 걸까?~~
* ~~쓰레드는 어떻게 동작하는 걸까~~
* ~~Dispatcher.Main, IO, Default같은 개념은 없는 걸까~~
* ~~비동기 시 에러 처리는 어떻게 이루어질까~~


# 신경쓰이는 점들
* iOS, AOS의 세팅을 따로 해주어야 한다

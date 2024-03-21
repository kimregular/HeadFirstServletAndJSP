# Head First JSP & Servlet

책을 읽으며 해당 개념을 학습한다.

## 진행경과
- 240319
  - mvc 모델 적용
  - JSP 맛보기
  - 챕터 3 완료

- 240320
  - 초간단 트러블슈팅 내용 추가 
  - 지금까지 진행한 챕터별 readme.md 파일 추가
  - 간략한 톰캣 디렉토리 구조 도식화 첨부(mermaid)

- 240321
  - Ch3 readme.md 내용 추가


## 트러블슈팅
### 01. tomcat 실행하기
#### 요구사항
기본적인 터미널 명령어

#### 상황
톰캣을 다운로드 받은 상황이다. 이후 톰캣을 테스트 구동하여 `localhost:8080` 페이지에 접근 가능한지 확인하고 싶다.

#### 문제
1. macOS 기준, 톰캣을 어떻게 실행하는지 모르겠다.
2. 어찌저찌 실행 방법은 찾았으나 권한 없음 오류가 발생한다.

#### 해결 방법
1. 터미널을 통해 톰캣이 위치한 폴더에 접근한다. -> ls 명령어, cd 명령어
   `/Users/regularkim/tools/apache-tomcat-8.5.99` 나는 이 주소에 톰캣을 두기로했다.
2. `./startup.sh` 명령어를 입력한다. -> 에러발생!
```zsh
./startup.sh
zsh: permission denied: ./startup.sh
```
3. 모든 .sh 확장자 파일에 700 권한을 부여한다. -> 별다른 반응이 없다면 성공!
```zsh
chmod 700 ./*.sh
```
4. 다시 `./startup.sh` 명령어를 실행한다.
```zsh
./shutdown.sh
Using CATALINA_BASE:   /Users/regularkim/tools/apache-tomcat-8.5.99
Using CATALINA_HOME:   /Users/regularkim/tools/apache-tomcat-8.5.99
Using CATALINA_TMPDIR: /Users/regularkim/tools/apache-tomcat-8.5.99/temp
Using JRE_HOME:        /Users/regularkim/Library/Java/JavaVirtualMachines/openjdk-21.0.2/Contents/Home
Using CLASSPATH:       /Users/regularkim/tools/apache-tomcat-8.5.99/bin/bootstrap.jar:/Users/regularkim/tools/apache-tomcat-8.5.99/bin/tomcat-juli.jar
Using CATALINA_OPTS:
NOTE: Picked up JDK_JAVA_OPTIONS:  --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
```

### 02. java 버전 변경
#### 요구 사항
- 기본적인 vim 명령어
- 기본적인 터미널 명령어

#### 상황
1. macOS 환경의 자바 버전이 너무 낮다거나 너무 높아 변경하고 싶다.

#### 문제
1. macOS 기준, 자바 버전 변경을 어떻게 하는지 모르겠다.

#### 해결방법
1. zsh 에서 `java -version` 명령어를 입력하고 현재 버전을 확인한다.
```zsh
java -version
openjdk version "21.0.2" 2024-01-16
OpenJDK Runtime Environment (build 21.0.2+13-58)
OpenJDK 64-Bit Server VM (build 21.0.2+13-58, mixed mode, sharing)
```
2. `/usr/libexec/java_home -v` 명령어를 입력하고 현재 설치되어 있는 자바를 확인한다.
```zsh
/usr/libexec/java_home -V
Matching Java Virtual Machines (1):
    21.0.2 (arm64) "Oracle Corporation" - "OpenJDK 21.0.2" /Users/regularkim/Library/Java/JavaVirtualMachines/openjdk-21.0.2/Contents/Home
/Users/regularkim/Library/Java/JavaVirtualMachines/openjdk-21.0.2/Contents/Home
```
`Matching Java Virtual Machines (1):` 라인의 결과를 보면 설치된 자바가 1개 뿐임을 알 수 있다.

3. 원하는 버전의 자바를 설치한다.

1. 다시 설치되어 있는 자바를 확인한다.
```zsh
/usr/libexec/java_home -V
Matching Java Virtual Machines (2):
    21.0.2 (arm64) "Oracle Corporation" - "OpenJDK 21.0.2" /Users/regularkim/Library/Java/JavaVirtualMachines/openjdk-21.0.2/Contents/Home
    1.8.0_402 (arm64) "Azul Systems, Inc." - "Zulu 8.76.0.17" /Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
/Users/regularkim/Library/Java/JavaVirtualMachines/openjdk-21.0.2/Contents/Home
```
`Matching Java Virtual Machines (2):` 개수가 2로 늘었다!

5. 버전 변경을 위해 `vim ~/.zshrc` 명령어를 입력한다.

6. 원하는 부분에 `export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_402)` 명령어를 입력한다.
   알파벳 i 를 누르면 수정이 가능하다.
7. esc 버튼을 눌려 수정을 마친다.
8. `:w` 명령어로 수정한 파일을 저장할 수 있다. 명령어를 입력한다.
9. `:q` 명령어로 vim 편집기에서 나갈 수 있다. 명령어를 입력한다.
10. `source ~/.zshrc` 명령어로 수정 사항을 반영한다.
11. `java -version` 명령어로 현재 컴퓨터의 자바 버전을 확인한다.
```zsh
java -version
openjdk version "1.8.0_402"
OpenJDK Runtime Environment (Zulu 8.76.0.17-CA-macos-aarch64) (build 1.8.0_402-b06)
OpenJDK 64-Bit Server VM (Zulu 8.76.0.17-CA-macos-aarch64) (build 25.402-b06, mixed mode)
```
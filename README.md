# [ Email & Google 로그인 기능 구현  ]

## [ 사용한 기술 ]

- firebaseCore [ https://firebase.google.com/docs/auth/ios/start?hl=ko&authuser=0 ]

- firebaseAuth

- GoogleSignIn

   -> File - Add Packages..    Add [ https://github.com/firebase/firebase-ios-sdk ]



## [ Point ]


- Google Login 연동할 때, 필요한 설정 
  
  1. Firebase 연동할 때 설치한 GoogleService-Info 파일을 열어보면 
     REVERSED_CLIENT_ID  의 Value 값을 복사한다.
     
  2. Info - URL Types 에 + 를 해준 후 URL Schemes 에 복사한 값으 넣어준다.



- Google Login 에 필요한 라이브러리 GoogleSignIn 은 따로 Podfile 에 추가해줘야 한다.

  1. Podfile > Add pod 'GoogleSignIn'

  2. Project Terminal - pod install 선언
  



## [ Add ]

- 생명주기 정리

    [ https://jjhkie.tistory.com/entry/lifecycle-Nabee ]

- error.localizedDescription 

   [ https://developer.apple.com/documentation/foundation/nserror/1414418-localizeddescription ]


- Email Login
  > auth().createUser

  > auth().signIn

  > auth().signOut()

- endEditing( bool ) 

   [ https://jjhkie.tistory.com/entry/keyboardDown-Nabee ]

- Google Login

[ https://firebase.google.com/docs/auth/ios/google-signin?hl=ko&authuser=0  ]
  

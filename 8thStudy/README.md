# 여덟번째 스터디

## 정보 저장 방법에 대해

---

이번시간에는 사용자 정보를 저장하는데 어떤 방식으로 저장하는게 가장 안전하고 효율적인가에 대한 궁금증을 가지고 apple에서 기본적으로 제공하는 데이터 저장 방법에 대해 공부해왔습니다.

우선 기본적으로 애플에서 제공하는 것을 알아보자면 UserDefaults, KeyChain, Core Data가 있습니다.

하나 하나 알아보자면, UserDefaults는 key-value 쌍으로 어플리케이션에 저장하는 것을 도와주는 하나의 인터페이스, 



<img src="img/01.png" width="500">

Keychain은 키체인이라는 암호화된 데이터 베이스에 사용자 데이터의 작은 비트를 저장하는 메커니즘을 앱에 제공하여 이 문제를 해결할수있도록 도와주는 기능을 가지고 있습니다.

CoreData의 경우에는 간단하게 설명해서 객체들의 관계를 관리하기 위한 프레임 워크입니다. 일반적으로 사용하는 데이터베이스 툴들과 동일하게 데이터들을 로드하게 될때 데이터들을 필터링 하는데 사용하는 쿼리 기능또한 제공을 합니다.



이러한 특징을 살펴보았을때, 각각 데이터 저장방법이 적절하게 사용되는 방법들이 있습니다. 

UserDefaults의 경우에는 하나의 key에 하나의 값밖에 저장이 되지 않다보니 작은 텍스트, 숫자, 배열 데이터들을 저장하는데 최적화 되어있습니다. 예를 들어 사용자가 설정하게 되는 설정값을 저장하면 됩니다. 

Keychain의 경우에는 아이디, 암호, 앱 내 구매 상태, 코인등 민감한 데이터를 저장하는 데 적합합니다. 

마지막으로 CoreData는 위 두개와는 다른 많은 데이터 또는 앞으로 확장 가능성이 있는 목록들을 저장하는데 사용하기에 적합합니다. 



그리고 간단하게 사용법을 살펴볼 수 있는 UserDefaults와 KeyChain사용법에 대해 알아보겠습니다.

userdefaults에서 저장할수있는 값은  [`NSData`](https://developer.apple.com/documentation/foundation/nsdata), [`NSString`](https://developer.apple.com/documentation/foundation/nsstring), [`NSNumber`](https://developer.apple.com/documentation/foundation/nsnumber), [`NSDate`](https://developer.apple.com/documentation/foundation/nsdate), [`NSArray`](https://developer.apple.com/documentation/foundation/nsarray), or [`NSDictionary`](https://developer.apple.com/documentation/foundation/nsdictionary) 을 저장할 수 있습니다.

~~~swift
UserDefaults.standard.set( Value, forKey: "Key") // Value에 Key에 대한 값을 저장하는 메소드
                
UserDefaults.standard.string(forKey: "Key") 
UserDefaults.standard.integer(forKey: "Key") 		// key에 대한 값을 해당하는 자료형으로 불러오는 메소드
UserDefaults.standard.array(forKey: "Key")

UserDefaults.standard.removeObject(forkey: "Key")  // key에 저장되어있는 값과 key을 지우는 메소드
~~~

와 같이 간단하게 저장을 해 사용할 수 있는 방법이 있습니다.





Keychain의 경우에는 애플이 제공하는 API를 사용할수도 있지만 제 경우에는 라이브러리에 비해 사용하기 불편한 점이 있어

[KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess) 라는 라이브러리를 사용합니다.







참고 자료

[UserDefault](https://developer.apple.com/documentation/foundation/userdefaults)

[Key Chain](https://developer.apple.com/documentation/security/keychain_services)

[Core Data](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html)

[When to use UserDefaults, Keychain, or Core Data](https://fluffy.es/persist-data/)

[Securing user data with Keychain for iOS](https://medium.com/ios-os-x-development/securing-user-data-with-keychain-for-ios-e720e0f9a8e2)

[Problem with using UserDefaults vs Keychain](https://forums.developer.apple.com/thread/97231)
# 여섯번째 스터디

## about Log

---

### 로그

이번 스터디에서는 로그 확인하는 방법에 대해서 준비를 했습니다.

로그를 확인할 수있는 메소드는 크게 4가지가 있습니다

1. NSLog
2. Base Log
3. Special Literal Log
4. Custom Log

위 5가지 방법에 대해 알아보도록 합시다!! :)

아래에서 확인하기 위한 값들은 이렇게 설정해두었습니다.

~~~swift
    var intTest : Int              = 123
    var intTestArr : [Int]         = [123,123,123,123,123]
    var stringTest : String        = "테스트입니다."
    var stringTestArray : [String] = ["123","234","345","456","567","678"]
    var testLabel                  = UILabel()

~~~

---



1. [NSLog](https://developer.apple.com/documentation/foundation/1395275-nslog?language=occ)

~~~objective-c
void NSLog(NSString *format, ...);
~~~



Object-C에서부터 log를 확인하기위해 사용하던 메소드로 사용하는 방법은 다음과 같습니다.

~~~swift
    func NSlogTest(){
        print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
        NSLog("NSLog : \(intTest)")
        NSLog("NSLog : \(intTestArr)")
        NSLog("NSLog : \(stringTest)")
        NSLog("NSLog : \(stringTestArray)")
        NSLog("NSLog : \(testLabel)")
    }
~~~

결과 값은

~~~swift
function : NSlogTest(),
line : 52,
column : 75,
dsohandle : 0x0000000101b9d000
2020-03-06 18:21:19.017464+0900 LogTest[2344:229760] NSLog : 123
2020-03-06 18:21:19.017731+0900 LogTest[2344:229760] NSLog : [123, 123, 123, 123, 123]
2020-03-06 18:21:19.017904+0900 LogTest[2344:229760] NSLog : 테스트입니다.
2020-03-06 18:21:19.018038+0900 LogTest[2344:229760] NSLog : ["123", "234", "345", "456", "567", "678"]
2020-03-06 18:21:19.018247+0900 LogTest[2344:229760] NSLog : <UILabel: 0x7f906a410be0; frame = (0 0; 0 0); userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600003bc4f50>>

~~~

NSLog는 print메소드에 비하면 느리지만 타임스탬프와 식별자를 추가해 보여주지만 print는 보여주지 않으며, NSLog는 장치의 콘솔과 디버거 콘솔 둘 다 보여주지만 print는 디버거 콘솔에만 값을 표시해줍니다.

---



2. baseLog

base Log의 방법은 print, debugPrint, dump와 같이 있습니다

---
   
   
[print](https://developer.apple.com/documentation/swift/1541053-print)

~~~swift
func print(_ items: Any..., separator: String = " ", terminator: String = "\n")
~~~

   
     
~~~swift
       func printTest() {
           print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
           print("print : ", intTest)
           print("print : ", intTestArr)
           print("print : ", stringTest)
        print("print : ", stringTestArray)
           print("print : ", testLabel)
       }
~~~
   
   ```swift
   function : printTest(),
   line : 43,
   column : 75,
   dsohandle : 0x0000000101b9d000
   print :  123
   print :  [123, 123, 123, 123, 123]
print :  테스트입니다.
   print :  ["123", "234", "345", "456", "567", "678"]
print :  <UILabel: 0x7f906a410be0; frame = (0 0; 0 0); userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600003bc4f50>>
   ```

   평소에 사용 하던 것 처럼 사용하시면 됩니다 

   ---
   
   

   [debugPrint](https://developer.apple.com/documentation/swift/1539920-debugprint)

   ~~~swift
func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n")
   ~~~
   
   
   
   
   
   ~~~swift
   func debugPrintTest(){
       print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
       debugPrint("debutPrint : ",intTest)
       debugPrint("debutPrint : ",intTestArr)
       debugPrint("debutPrint : ",stringTest)
       debugPrint("debutPrint : ",stringTestArray)
       debugPrint("debutPrint : ",testLabel)
   }
   ~~~
   
   ```swift
   function : debugPrintTest(),
   line : 70,
   column : 75,
   dsohandle : 0x0000000109981000
"debutPrint : " 123
   "debutPrint : " [123, 123, 123, 123, 123]
"debutPrint : " "테스트입니다."
   "debutPrint : " ["123", "234", "345", "456", "567", "678"]
"debutPrint : " <UILabel: 0x7f9cba753960; frame = (0 0; 0 0); userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000302ee40>>
   ```
   
   print와 다른점은 해당하는 object의 상세 내역까지 출력해줍니다. 이런 이유로 print메소드에 비해 조금 느리기는 하지만.

   공식문서에서는 디버그를 목적으로 사용할 때 debugPrint사용을 권장하고 있습니다.

   ---

   

   [dump](https://developer.apple.com/documentation/swift/1539127-dump)

~~~swift
@discardableResult func dump<T>(_ value: T, name: String? = nil, indent: Int = 0, maxDepth: Int = .max, maxItems: Int = .max) -> T
~~~

- `value`

    log를 확인 할 값을 넣어줄 parameter

- `name`

    기본 값은 nil이며 로그에서 무슨 이름으로 나왔으면 좋겠는지 지정해주는 parameter

   >  print("int1 : ", int1)에서 "int1 : "과 같은 설명을 해주기 위한 파라미터로 사용가능합니다

   

- `indent`
   
    기본 값은 0이며 출력되는 각 라인의 스페이스를 지정해주는 parameter
   
~~~swift
    dump(stringTestArray,name: "String1", indent: 1)
    dump(stringTestArray,name: "String2", indent: 2)
    dump(stringTestArray,name: "String3", indent: 3)
    dump(stringTestArray,name: "String3", indent: 1)
~~~


~~~swift
      ▿ String1: 6 elements
        - "123"
        - "234"
        - "345"
        - "456"
        - "567"
        - "678"
       ▿ String2: 6 elements
         - "123"
         - "234"
         - "345"
         - "456"
         - "567"
         - "678"
        ▿ String3: 6 elements
          - "123"
          - "234"
          - "345"
          - "456"
          - "567"
          - "678"
      ▿ String3: 6 elements
        - "123"
        - "234"
        - "345"
        - "456"
     - "567"
        - "678"
   
   ~~~

- `maxDepth`

    기본 값은 Int.max 이며 출력되었으면 하는 depth를 지정해주는 parameter 
   
    깊이가 출력되는 dump 파일의 특성상 지정해줄 수있다
   
- `maxItems`
   
    기본 값은 Int.max 이며 출력 될 자식의 갯수를 지정해주는 parameter
   
     
   
  
   
   ~~~swift
       func dumpTest(){
           print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
           dump(intTest)
           dump(intTestArr)
           dump(stringTest)
           dump(stringTestArray)
           dump(testLabel)
       }
   ~~~
   
   ```swift
   function : dumpTest(),
   line : 61,
   column : 75,
   dsohandle : 0x0000000101b9d000
   - 123
   ▿ 5 elements
     - 123
     - 123
     - 123
     - 123
     - 123
   - "테스트입니다."
   ▿ 6 elements
     - "123"
     - "234"
     - "345"
     - "456"
     - "567"
     - "678"
   - <UILabel: 0x7f906a410be0; frame = (0 0; 0 0); userInteractionEnabled = NO; layer = <_UILabelLayer: 0x600003bc4f50>> #0
     - super: UIView
       - super: UIResponder
         - super: NSObject
   ```

---



3. Special Literal 

Special Literal log에서는 5가지의 log 확인 방법이 있습니다

- #file : 해당 코드가 어느 파일에서 call 되는지
- #function : 해당 코드가 어느 function에서 call 되는지
- #line : 해당 코드가 몇 번째 Line에서 call 되는지
- #column : 해당 코드가 line의 몇번째 column에서 실행되는지
- #dsohandle : 해당 코드의 포인터 위치

와 같은 방법으로 해당하는 정보를 확인 할 수 있습니다.

~~~swift
    func specialLiteralTest(){
        print("\n\nfile : \(#file),\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
    }
~~~

~~~swift
file : /Users/user/Desktop/Programming/testCode/LogTest/LogTest/ViewController.swift,
function : specialLiteralTest(),
line : 79,
column : 93,
dsohandle : 0x0000000109981000
~~~

이를 이용해 custom Log를 만들면 효율적으로 log를 확인 할 수 있습니다.

---



4. custom Log

메소드 만들기

~~~Swift
public func logger(
    _ contents: Any...,
    header : String                = "",
    _ file : String                = #file,
    _ function : String            = #function,
    _ line : Int                   = #line,
    _ dsohandle : UnsafeRawPointer = #dsohandle
    ) {

    let fileUrl                    = URL(fileURLWithPath: file)
    let fileName                   = fileUrl.deletingPathExtension().lastPathComponent
    let header                     = header.isEmpty ? "" : "[ \(header) ] - "
    let content                    = contents.reduce("") { $0 + " " + String(describing: $1) }

    let str                        = """
    👻👻👻
    \(fileName) / \(header) / \(function)
    \(content)
    👻👻👻
    """

    print(str)
}
~~~



호출

~~~swift
let picker = UIImagePickerController()

logger(picker)
~~~

결과 값

~~~swift
👻👻👻
SetProfileVC /  / viewDidLoad()
 <UIImagePickerController: 0x7f93dd855800>
👻👻👻
~~~

---







> ### 결론
>
> 위와 같은 결과 값을 이용해 다양한 log를 확인할 수 있고 필요한 상황에 적절히 이용을 하면 의미 있는 정보를 얻을수 있습니다
>
> 

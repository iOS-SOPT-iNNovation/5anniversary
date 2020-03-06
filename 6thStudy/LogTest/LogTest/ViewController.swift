//
//  ViewController.swift
//  LogTest
//
//  Created by Junhyeon on 2020/03/06.
//  Copyright © 2020 Junhyeon. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    var intTest : Int              = 123
    var intTestArr : [Int]         = [123,123,123,123,123]

    var stringTest : String        = "테스트입니다."
    var stringTestArray : [String] = ["123","234","345","456","567","678"]
    var viewTest = UIView()

    var testLabel                  = UILabel()

    let fileName                   = #file// /Users/user/Desktop/Programming/testCode/LogTest/LogTest/ViewController.swift
    let functioName                = #function// ViewController
    let findLine                   = #line// 24
    let column                     = #column// 38
    let dsohandle                  = #dsohandle// 0x00000001045a3000

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        print("\n\nfile : \(fileName)\nfunction : \(functioName),\nline : \(findLine),\ncolumn\(column),\ndsohandle : \(dsohandle)")


        printTest()
        NSlogTest()
        dumpTest()
        debugPrintTest()
        specialLiteralTest()
    }

    func printTest() {
        print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
        print("print : ", intTest)
        print("print : ", intTestArr)
        print("print : ", stringTest)
        print("print : ", stringTestArray)
        print("print : ", testLabel)
    }

    func NSlogTest(){
        print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
        NSLog("NSLog : \(intTest)")
        NSLog("NSLog : \(intTestArr)")
        NSLog("NSLog : \(stringTest)")
        NSLog("NSLog : \(stringTestArray)")
        NSLog("NSLog : \(testLabel)")
    }

    func dumpTest(){
        print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
        dump(intTest)
        dump(intTestArr)
        dump(stringTest)
        dump(stringTestArray,name: "String1", maxDepth: 1,maxItems: 1)
        dump(stringTestArray,name: "String2", maxDepth: 2,maxItems: 2)
        dump(stringTestArray,name: "String3", maxDepth: 3,maxItems: 3)
        dump(view)
        dump(viewTest)
        dump(testLabel)
    }

    func debugPrintTest(){
        print("\n\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
        debugPrint("debutPrint : ",intTest)
        debugPrint("debutPrint : ",intTestArr)
        debugPrint("debutPrint : ",stringTest)
        debugPrint("debutPrint : ",stringTestArray)
        debugPrint("debutPrint : ",testLabel)
    }

    func specialLiteralTest(){
        print("\n\nfile : \(#file),\nfunction : \(#function),\nline : \(#line),\ncolumn : \(#column),\ndsohandle : \(#dsohandle)")
    }

}


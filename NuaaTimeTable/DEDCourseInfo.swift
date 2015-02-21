//
//  CourseInfo.swift
//  NuaaTimeTable
//
//  Created by ljlin on 15/2/13.
//  Copyright (c) 2015年 ljlin. All rights reserved.
//

import UIKit
import Dollar

class DEDCourseInfo: NSObject, LLKVCoding {
    
    var kcm    = String()
    var jsm    = String()
    var xiaoqu = String()
    var roomid = String()
    var week   : Int = 0
    var unit   : Int = 0
    var lsjs   : Int = 0
    var weeks  = [Int]()

    var title    : String { return "\(self.kcm) \(self.jsm)" }
    var location : String { return "\(self.roomid)@\(self.xiaoqu)"}
    var time     : String { return "周\(self.week)第\(self.unit)-\(self.unit+self.lsjs)节"}
    
    class var keys : [String] {
        return ["kcm","jsm","xiaoqu","roomid","week","unit","lsjs","weeks","title","location","time"]
    }
    class var keysForStringProperty : [String] {
        return Array(DEDCourseInfo.keys[0...3])
    }
    class var keysForIntProperty : [String] {
        return Array(DEDCourseInfo.keys[4...6])
    }
    
    init(XML:AEXMLElement) {
        super.init()
        $.each(DEDCourseInfo.keysForStringProperty,{ self.setValue(XML[$0].value,        forKeyPath: $0)})
        $.each(DEDCourseInfo.keysForIntProperty,   { self.setValue(XML[$0].value.toInt(),forKeyPath: $0)})
        var weekStringArray : [String] = XML["weeks"].value.componentsSeparatedByString(",")
        self.weeks = weekStringArray.map({$0.toInt()!})
    }
}

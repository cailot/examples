//
//  M7k37Util.swift
//  M7k373n9
//
//  Created by Jin Seo on 2015. 4. 28..
//  Copyright (c) 2015년 Jin Seo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class M7k37Util {

//    class var DELEMETER = ":"
    class func splitByDelemeter(data: String) -> [String]
    {
        let dataArr = data.componentsSeparatedByString(":")
        
//        var values:[String] =  []
        
        var values = [dataArr[0].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            , dataArr[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        ]
        return values
    }

}
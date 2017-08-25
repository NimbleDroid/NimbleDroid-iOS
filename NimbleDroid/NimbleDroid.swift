//
//  NimbleDroid.swift
//  NimbleDroid
//
//  Created by Thomas Huzij on 5/8/17.
//  Copyright © 2017 NimbleDroid. All rights reserved.
//

public class NDScenario : NSObject {
    public class func begin(bookendID : String) {
        NSLog("NDScenario.begin %@ %f", bookendID, NSDate.init().timeIntervalSince1970 * 1000000)
    }

    public class func end(bookendID : String) {
        NSLog("NDScenario.end %@ %f", bookendID, NSDate.init().timeIntervalSince1970 * 1000000)
    }
}

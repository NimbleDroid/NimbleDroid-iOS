//
//  NimbleDroid.swift
//  NimbleDroid
//
//  Created by Thomas Huzij on 5/8/17.
//  Copyright © 2017 NimbleDroid. All rights reserved.
//

import Foundation

public class NDScenario : NSObject {
    static var coldStartup = false
    static var initialized = false
    static var scenario : String? = nil

    @objc public class func setup() {
        if initialized {
            NSLog("NDScenario already initialized")
            return
        }
        let processInfo = ProcessInfo.processInfo
        let arguments = processInfo.arguments
        let processIdentifier = processInfo.processIdentifier
        if let scenarioIndex = arguments.index(of: "--ndScenario") {
            if let bookendIndex = arguments.index(scenarioIndex, offsetBy: 1, limitedBy: arguments.endIndex - 1) {
                scenario = arguments[bookendIndex]
                NSLog("NDScenario initialized pid %d scenario %@", processIdentifier, scenario!)
            } else {
                NSLog("NDScenario failed to initialize pid %d, --ndScenario missing bookendID", processIdentifier)
            }
        } else if arguments.contains("--ndColdStartup") {
            coldStartup = true
            NSLog("NDScenario initialized pid %d coldStartup", processIdentifier)
        } else {
            NSLog("NDScenario initialized pid %d", processIdentifier)
        }
        initialized = true
    }

    @objc class func warnSetup() {
        NSLog("NDScenario is not initialized, please call setup in application:willFinishLaunchingWithOptions:")
    }

    @objc public class func begin(bookendID : String, timeInterval : TimeInterval) {
        if !initialized {
            warnSetup()
        }
        NSLog("NDScenario.begin %@ %f", bookendID, timeInterval * 1000000)
        fflush(stderr)
        if bookendID == scenario {
            raise(SIGSTOP)
        }
    }

    @objc public class func begin(bookendID : String) {
        begin(bookendID: bookendID, timeInterval: NSDate.init().timeIntervalSince1970)
    }

    @objc public class func end(bookendID : String, timeInterval : TimeInterval) {
        if !initialized {
            warnSetup()
        }
        NSLog("NDScenario.end %@ %f", bookendID, timeInterval * 1000000)
        fflush(stderr)
        if bookendID == scenario {
            raise(SIGSTOP)
        }
    }

    @objc public class func end(bookendID : String) {
        end(bookendID: bookendID, timeInterval: NSDate.init().timeIntervalSince1970)
    }

    @objc public class func coldStartupEnd() {
        if !initialized {
            warnSetup()
        }
        var stopTime = timeval()
        gettimeofday(&stopTime, nil)
        let pid = getpid()
        let mib = [CTL_KERN, KERN_PROC, KERN_PROC_PID, pid]
        var proc = kinfo_proc()
        var size = MemoryLayout<kinfo_proc>.size
        sysctl(UnsafeMutablePointer<Int32>(mutating: mib) , UInt32(mib.count), &proc, &size, nil, 0)
        let startTime = proc.kp_proc.p_un.__p_starttime
        let beginTime = Double(startTime.tv_sec) * 1000000.0 + Double(startTime.tv_usec)
        let endTime = Double(stopTime.tv_sec) * 1000000.0 + Double(stopTime.tv_usec)
        NSLog("NDScenario.coldStartupEnd %f %f", beginTime, endTime)
        fflush(stderr)
        if coldStartup {
            raise(SIGSTOP)
        }
    }
}

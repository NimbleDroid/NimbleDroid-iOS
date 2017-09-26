//
//  NimbleDroid.swift
//  NimbleDroid
//
//  Created by Thomas Huzij on 5/8/17.
//  Copyright © 2017 NimbleDroid. All rights reserved.
//

public class NDScenario : NSObject {
    static var enabled = false

    public class func setup() {
        if ProcessInfo.processInfo.arguments.contains("ndProfile") {
            enabled = true
        }
    }

    public class func begin(bookendID : String) {
        if enabled {
            raise(SIGSTOP)
            NSLog("NDScenario.begin %@ %f", bookendID, NSDate.init().timeIntervalSince1970 * 1000000)
        }
    }

    public class func end(bookendID : String) {
        if enabled {
            NSLog("NDScenario.end %@ %f", bookendID, NSDate.init().timeIntervalSince1970 * 1000000)
            raise(SIGSTOP)
        }
    }

    public class func coldStartupEnd() {
        if enabled {
            let endTime = NSDate.init().timeIntervalSince1970 * 1000000
            let pid = getpid()
            let mib = [CTL_KERN, KERN_PROC, KERN_PROC_PID, pid]
            var proc = kinfo_proc()
            var size = MemoryLayout<kinfo_proc>.size
            sysctl(UnsafeMutablePointer<Int32>(mutating: mib) , UInt32(mib.count), &proc, &size, nil, 0)
            let tv_sec = Double(proc.kp_proc.p_un.__p_starttime.tv_sec)
            let tv_usec = Double(proc.kp_proc.p_un.__p_starttime.tv_usec)
            let startTime = tv_sec * 1000000.0 + tv_usec
            NSLog("NDScenario.coldStartupEnd %f %f", startTime, endTime)
            raise(SIGSTOP)
        }
    }
}

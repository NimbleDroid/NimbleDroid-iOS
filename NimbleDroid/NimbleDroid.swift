import Foundation

public class NDScenario : NSObject {
    @objc public class func begin(bookendID : String) {
        NSLog("HeadSpinV1 Label.start name:%@", bookendID)
        fflush(stderr)
    }

    @objc public class func begin(bookendID : String, category : String, data : String) {
        NSLog("HeadSpinV1 Label.start name:%@ label_type:page-load-request category:%@ data:%@", bookendID, category, data)
        fflush(stderr)
    }

    @objc public class func end(bookendID : String) {
        NSLog("HeadSpinV1 Label.end name:%@", bookendID)
        fflush(stderr)
    }

    @objc public class func end(bookendID : String, data : String) {
        NSLog("HeadSpinV1 Label.end name:%@ data:%@", bookendID, data)
        fflush(stderr)
    }

    @objc public class func instant(bookendID : String) {
        NSLog("HeadSpinV1 Label.instant name:%@", bookendID)
        fflush(stderr)
    }

    @objc public class func instant(bookendID : String, category : String, data : String) {
        NSLog("HeadSpinV1 Label.instant name:%@ label_type:page-load-request category:%@ data:%@", bookendID, category, data)
        fflush(stderr)
    }

    @objc public class func setup() {
        NSLog("NDScenario.setup() is deprecated and will be removed in a future version")
        fflush(stderr)
    }

    @objc public class func begin(bookendID : String, timeInterval : TimeInterval) {
        NSLog("NDScenario.begin(bookendID:timeInterval:) is deprecated and will be removed in a future verison")
        fflush(stderr)
    }

    @objc public class func end(bookendID : String, timeInterval : TimeInterval) {
        NSLog("NDScenario.end(bookendID:timeInterval:) is deprecated and will be removed in a future verison")
        fflush(stderr)
    }

    @objc public class func coldStartupEnd() {
        NSLog("NDScenario.coldStartupEnd() is deprecated and will be removed in a future version")
        fflush(stderr)
    }
}

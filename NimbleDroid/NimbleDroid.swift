import Foundation

public class NDScenario : NSObject {
    @objc public class func begin(bookendID : String, type : String? = nil, category : String? = nil, data : String? = nil) {
        let nameParam = bookendID
        var typeParam = ""
        var categoryParam = ""
        var dataParam = ""
        if type != nil {
            typeParam = " label_type:\(type!)"
        }
        if category != nil {
            categoryParam = " category:\(category!)"
        }
        if data != nil {
            dataParam = " data:\(data!)"
        }
        NSLog("HeadSpinV1 Label.start name:%@%@%@%@", nameParam, typeParam, categoryParam, dataParam)
        //NSLog("HeadSpinV1 Label.start name:%@ label_type:page-load-request category:%@ data:%@", bookendID, category, data)
        fflush(stderr)
    }

    @objc public class func end(bookendID : String, data : String? = nil) {
        let nameParam = bookendID
        var dataParam = ""
        if data != nil {
            dataParam = " data:\(data!)"
        }
        NSLog("HeadSpinV1 Label.end name:%@%@", nameParam, dataParam)
        fflush(stderr)
    }

    @objc public class func instant(bookendID : String, type : String? = nil, category : String? = nil, data : String? = nil) {
        let nameParam = bookendID
        var typeParam = ""
        var categoryParam = ""
        var dataParam = ""
        if type != nil {
            typeParam = " label_type:\(type!)"
        }
        if category != nil {
            categoryParam = " category:\(category!)"
        }
        if data != nil {
            dataParam = " data:\(data!)"
        }
        NSLog("HeadSpinV1 Label.instant name:%@%@%@%@", nameParam, typeParam, categoryParam, dataParam)
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

import Foundation
import UIKit

class Event {
    var name: String
    var date: Double
    
    init(json: [String: Any]) {
        name = json["name"] as? String ?? ""
        date = json["date"] as? Double ?? 0
    }
    
    // Hacemos un dateformat para que salga de forma correcta con una función.
    static func createDateTime(timestamp: Double) -> String {
        var time: Double = 0
        if timestamp > 1000000000000 && timestamp < 1000000000000000 {
            time = timestamp / 1000
        }
        else if timestamp > 1000000000000000 {
            time = timestamp / 1000000
        }
        else {
            time = timestamp
        }
        let date1 = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0100") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date1)
        return strDate
    }
}

import Foundation
import UIKit

class Cantante: Decodable{
    var name: String
    var genre: String
    var pic: String
    init(json: [String: Any]){
        name = json["name"] as? String ?? ""
        genre = json["genre"] as? String ?? ""
        pic = json["pic"] as? String ?? ""
    }
}

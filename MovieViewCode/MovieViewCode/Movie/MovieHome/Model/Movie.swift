import Foundation
import UIKit

struct Movie: Codable {
    var poster_path: String = ""
    var title: String = ""
    var overview: String = ""
    
    func posterUrl() -> URL? {
        return URL(string: "\(ConfigUrl.imageBaseURL)" + "\(poster_path)")
    }
}

struct MovieList: Decodable {
    let results:[Movie]
}



import Foundation
import UIKit

struct Movie: Codable, Equatable {
    var poster_path: String = ""
    var title: String = ""
    var release_date: String = ""
    var vote_average: Double = 0.0
    var overview: String = ""
    
    func posterUrl() -> URL? {
        return URL(string: "\(ConfigUrl.imageBaseURL)" + "\(poster_path)")
    }
}

struct MovieList: Decodable {
    let results:[Movie]
}



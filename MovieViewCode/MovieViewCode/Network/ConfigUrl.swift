import UIKit

//https://developer.themoviedb.org/docs/getting-started

struct ConfigUrl {
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let apiKey = "api_key=" + (ProcessInfo.processInfo.environment["API_TOKEN"] ?? "") // Enter your TMDB token.
    static let language = "&language=pt-BR"
    static let popular = "movie/popular?"
    static let page = "&page=1"
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    static let brasil = "&language=pt-BR&page=1&region=BR"
}

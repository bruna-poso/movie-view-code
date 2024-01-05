import Foundation

public protocol MovieServiceProtocol {
    var url: URL { get }
    var method: HttpMethod { get }
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum MovieService: Equatable {
    case popular
    case details
}

extension MovieService: MovieServiceProtocol {
    var url: URL {
        switch self {
        case .popular:
            return URL(string: "\(ConfigUrl.baseUrl)\(ConfigUrl.popular)\(ConfigUrl.apiKey)\(ConfigUrl.brasil)")!
        case .details:
            return URL(string: "\(ConfigUrl.baseUrl)\(ConfigUrl.popular)\(ConfigUrl.apiKey)\(ConfigUrl.brasil)")!
        }
    }
    var method: HttpMethod {
        switch self {
        case .popular, .details:
            return .get
        }
    }
}





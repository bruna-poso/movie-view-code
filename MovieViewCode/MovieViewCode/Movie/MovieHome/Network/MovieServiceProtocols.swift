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

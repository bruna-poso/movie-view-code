import Foundation

@testable import MovieViewCode

final class APIClientMock: APIClientType {
    
    private(set) var requestCount = 0
    private(set) var expectedService: MovieService?
    
    var result: ((Result<Any, Error>) -> Void)?
    
    func request<T: Decodable>(_ resource: MovieService, decodingType: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        requestCount += 1
        expectedService = resource
        result = { result in
            if let decodedData = result as? Result<T, Error> {
                completion(decodedData)
            }
        }
    }
}

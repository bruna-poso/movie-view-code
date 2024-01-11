import Quick
import Nimble
import Foundation

@testable import MovieViewCode

final class MovieRepositoryTests: QuickSpec {
    override class func spec() {
        var httpMock: APIClientMock!
        var sut: MovieRepository!

        beforeEach {
            httpMock = APIClientMock()
            sut = MovieRepository(http: httpMock)
        }
        
        describe("#fetchMovies") {
            beforeEach {
                sut.fetchMovies { _ in }
            }
            
            it("has to call request with properly service") {
                expect(httpMock.requestCount).to(equal(1))
                expect(httpMock.expectedService).to(beAKindOf(MovieService.self))
            }
        }
    }
}

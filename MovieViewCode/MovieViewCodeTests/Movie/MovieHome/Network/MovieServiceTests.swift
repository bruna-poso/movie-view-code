import Quick
import Nimble
import Foundation

@testable import MovieViewCode

final class MovieServiceTests: QuickSpec {
    override class func spec() {

        describe("when type is popular") {
            context("when creating URL") {
                it("should have the correct popular URL") {
                    let url = MovieService.popular.url
                    let expectedURL = URL(string: "\(ConfigUrl.baseUrl)\(ConfigUrl.popular)\(ConfigUrl.apiKey)\(ConfigUrl.brasil)")!
                    expect(url).to(equal(expectedURL))
                }
            }

            context("HTTP method") {
                it("should be GET for popular") {
                    let method = MovieService.popular.method
                    expect(method).to(equal(HttpMethod.get))
                }
            }
        }

        describe("when type is details") {
            context("when creating URL") {
                it("should have the correct popular URL") {
                    let url = MovieService.details.url
                    let expectedURL = URL(string: "\(ConfigUrl.baseUrl)\(ConfigUrl.popular)\(ConfigUrl.apiKey)\(ConfigUrl.brasil)")!
                    expect(url).to(equal(expectedURL))
                }
            }

            context("HTTP method") {
                it("should be GET for popular") {
                    let method = MovieService.details.method
                    expect(method).to(equal(HttpMethod.get))
                }
            }
        }
    }
}

import Quick
import Nimble
import Nimble_Snapshots
import Foundation

@testable import MovieViewCode

final class MovieTableViewCellTests: QuickSpec {
    override class func spec() {
        var sut: MovieTableViewCell!

        beforeEach {
            sut = MovieTableViewCell()
            sut.frame = CGRect(x: 0, y: 0, width: 620, height: 130)
        }

        describe("#show") {
            beforeEach {
                sut.show(movie: Movie(poster_path: "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
                                      title: "The Hunger Games: The Ballad of Songbirds & Snakes",
                                      overview: "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12."))
            }

            it("has build the layout properly") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}

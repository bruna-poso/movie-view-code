import Quick
import Nimble
import Foundation

@testable import MovieViewCode

final class MovieDetailViewControllerTests: QuickSpec {
    override class func spec() {
        var sut: MovieDetailViewController!
        var viewSpy: MovieDetailViewSpy!
        let movie = Movie(poster_path: "//99IaUjY4hXdGlYVcnr4GjzTzFBL.jpg",
                          title: "The Hunger Games: The Ballad of Songbirds & Snakes",
                          overview: "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.")
        
        beforeEach {
            viewSpy = MovieDetailViewSpy()
            sut = MovieDetailViewController(movie: movie, contentView: viewSpy)
            _ = sut.view
        }
        
        describe("#loadView") {
            it("view must be MovieDetailViewSpy") {
                expect(sut.view).to(beAKindOf(MovieDetailViewSpy.self))
            }
        }
        
        describe("#viewDidLoad") {
            it("has to call show from contentView") {
                expect(viewSpy.showCount).to(equal(1))
                expect(viewSpy.expectedViewModel).to(equal(movie))
            }
        }
    }
}

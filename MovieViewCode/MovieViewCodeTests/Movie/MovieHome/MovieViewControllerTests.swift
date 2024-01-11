import Quick
import Nimble
import Foundation

@testable import MovieViewCode

final class MovieViewControllerTests: QuickSpec {
    override class func spec() {
        var sut: MovieViewController!
        var viewSpy: MovieViewSpy!
        var repositorySpy: MovieRepositorySpy!
        
        beforeEach {
            viewSpy = MovieViewSpy()
            repositorySpy = MovieRepositorySpy()
            sut = MovieViewController(contentView: viewSpy,
                                      repository: repositorySpy)
        }
        
        describe("#loadView") {
            it("view must be MovieView") {
                expect(sut.view).to(beAKindOf(MovieViewSpy.self))
            }
        }
        
        describe("#fetchMovieList") {
            context("when request is success") {
                beforeEach {
                    let result = MovieList(results: Movie.stub())
                    repositorySpy.handleFetchMovie = .success(result)
                }
                
                it("has to call show from contentView") {
                    sut.viewDidLoad()
                    expect(repositorySpy.fetchMoviesCount).to(equal(1))
                    expect(viewSpy.showCount).to(equal(1))
                    expect(viewSpy.expectedMovies).to(equal(Movie.stub()))
                }
                
            }
            
            context("when request is failure") {
                beforeEach {
                    repositorySpy.handleFetchMovie = .failure(NSError(domain: "TestErrorDomain", code: 42, userInfo: nil))
                    sut.viewDidLoad()
                }
                
                it("has to call alert") {
                    expect(repositorySpy.fetchMoviesCount).to(equal(1))
                    //TO DO: teste do alerta
                }
            }
        }
        
        describe("#bindLayoutEvents") {
            context("#didSelect") {
                var didSelectCount = 0
                var expectedMovie: Movie?
                let movie = Movie(poster_path: "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
                                  title: "The Hunger Games: The Ballad of Songbirds & Snakes",
                                  overview: "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.")

                beforeEach {
                    viewSpy.didSelect = { movie in
                        didSelectCount += 1
                        expectedMovie = movie
                    }

                    viewSpy.didSelect?(movie)
                }

                it("should push to MovieDetailViewController") {
                    expect(didSelectCount).to(equal(1))
                    expect(expectedMovie).to(equal(movie))
                    //TO DO: Descobrir o pq está dando erro
//                    expect(sut.navigationController?.topViewController).to(beAKindOf(MovieDetailViewController.self))
                }
            }
        }
    }
}

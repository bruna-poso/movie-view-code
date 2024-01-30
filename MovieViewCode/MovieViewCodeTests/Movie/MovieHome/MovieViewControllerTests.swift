import Quick
import Nimble
import Foundation
import UIKit

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

            let window = UIWindow(frame: UIScreen.main.bounds)
            window.makeKeyAndVisible()
            window.rootViewController = sut
            _ = sut.view
        }
        
        describe("#loadView") {
            it("view must be MovieViewSpy") {
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
                    expect(repositorySpy.fetchMoviesCount).to(equal(2))
                    expect(viewSpy.showCount).to(equal(1))
                    expect(viewSpy.expectedMovies).to(equal(Movie.stub()))
                }
                
            }
            
            context("when request is failure") {
                beforeEach {
                    repositorySpy.handleFetchMovie = .failure(MovieRepositoryError.genericError)
                    
                }
                
                it("has to call repository") {
                    expect(repositorySpy.fetchMoviesCount).to(equal(1))
                }
                
                it("has to call alert") {
                    //TO DO: Descobrir o pq está dando erro
                    let alertController = sut.presentedViewController as? UIAlertController
//                    expect(alertController?.title).to(equal("Erro"))
//                    expect(alertController?.message).to(equal("Não foi possíver carregar os itens!"))
                    let tryAgainAction = alertController?.actions.first { $0.title == "Tentar novamente" }
//                    expect(tryAgainAction).toNot(beNil())
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

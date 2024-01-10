import Quick
import Nimble
import UIKit

@testable import MovieViewCode

final class MovieTableViewDataSourceTests: QuickSpec {
    override class func spec() {
        var sut: MovieTableViewDataSource!
        var tableViewMock: UITableViewMock!
        let movieList = Movie.stub()
        
        beforeEach {
            tableViewMock = UITableViewMock()
            sut = MovieTableViewDataSource(movieList: movieList)
        }
        
        describe("#numberOfRowsInSection") {
            it("has to return movieList count") {
                expect(sut.tableView(tableViewMock, numberOfRowsInSection: 0)).to(equal(6))
            }
        }
        
        describe("#cellForRowAt") {
            var cell: UITableViewCell!
            
            beforeEach {
                tableViewMock.register(MovieTableViewCell.self, forCellReuseIdentifier: "cellId")
                cell = sut.tableView(tableViewMock, cellForRowAt: IndexPath(row: 0, section: 0))
            }

            it("has to return MovieTableViewCell type") {
                expect(cell).to(beAKindOf(MovieTableViewCell.self))
            }
        }
        
        describe("#didSelectRowAt") {
            var hasCalledDidSelect = false
            var sentMovie: Movie?
            
            beforeEach {
                sut.didSelect = { movie in
                    hasCalledDidSelect = true
                    sentMovie = movie
                }
                
                let indexPath = IndexPath(row: 1, section: 0)
                sut.tableView(tableViewMock, didSelectRowAt: indexPath)
                tableViewMock.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
            }
            
            it("has to call hasCalledDidSelect") {
                expect(hasCalledDidSelect).to(beTrue())
                expect(sentMovie).to(equal(movieList[1]))
            }
        }
    }
}

import Quick
import Nimble
import Nimble_Snapshots
import Foundation

@testable import MovieViewCode

final class MovieViewTests: QuickSpec {
    override class func spec() {
        var sut: MovieView!
        
        beforeEach {
            sut = MovieView()
            sut.frame = CGRect(x: 0, y: 0, width: 620, height: 640)
        }
        
        describe("#show") {
            beforeEach {
                sut.show(movies: Movie.stub())
            }
            
            it("has build the layout properly") {
                expect(sut).to(haveValidSnapshot())
            }
        }
        
//        describe("#bindLayoutEvents") {
//            context("didSelect") {
//                var didSelectCount = 0
//                
//                beforeEach {
//                    sut.didSelect = {
//                        didSelectCount += 1
//                    }
//                }
//            }
//        }
    }
}

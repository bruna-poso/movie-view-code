import Quick
import Nimble
import Nimble_Snapshots
import Foundation

@testable import MovieViewCode

final class MovieStarViewTests: QuickSpec {
    override class func spec() {
        var sut: MovieStarView!
        
        beforeEach {
            sut = MovieStarView()
            sut.frame = CGRect(x: 0, y: 0, width: 120, height: 20)
        }
        
        describe("#show") {
            beforeEach {
                sut.show(voteAverage: 8.2018)
            }
            
            it("has build the layout properly") {
               expect(sut).to(haveValidSnapshot())
            }
        }
    }
}

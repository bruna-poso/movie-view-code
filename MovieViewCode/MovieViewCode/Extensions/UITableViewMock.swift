import UIKit

final class UITableViewMock: UITableView {
    private(set) var hasCalledRegister = false
    
    override func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        hasCalledRegister = true
        super.register(cellClass, forCellReuseIdentifier: identifier)
    }

    private(set) var reloadRowsNumberOfCalls = 0
    private(set) var sentIndexPath: [IndexPath]?
    private(set) var sentAnimation: UITableView.RowAnimation?
    
    override func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        reloadRowsNumberOfCalls += 1
        sentIndexPath = indexPaths
        sentAnimation = animation
        super.reloadRows(at: indexPaths, with: animation)
    }
}

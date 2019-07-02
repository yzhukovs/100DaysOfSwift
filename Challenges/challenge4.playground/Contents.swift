import UIKit

extension String {

    func fuzzyContains(_ a: String) -> Bool {
         return self.uppercased().range(of: a.uppercased()) != nil
}
}
"Hello Word".fuzzyContains("blah")

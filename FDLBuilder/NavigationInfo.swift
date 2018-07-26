import Foundation
import Firebase

extension FDLBuilder {
    public final class NavigationInfo {
        let params = DynamicLinkNavigationInfoParameters()

        public var isForcedRedirectEnabled: Bool = false {
            didSet {
                params.isForcedRedirectEnabled = isForcedRedirectEnabled
            }
        }
    }
}

import Foundation
import Firebase

extension FDLBuilder {
    public final class NavigationInfo {
        let params = DynamicLinkNavigationInfoParameters()

        public var isForcedRedirectEnabled: Bool = false {
            didSet {
                print(params.isForcedRedirectEnabled)
                params.isForcedRedirectEnabled = isForcedRedirectEnabled
            }
        }
    }
}

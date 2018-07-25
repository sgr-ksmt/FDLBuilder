import Foundation
import Firebase

extension FDLBuilder {
    public final class OtherPlatform {
        let params = DynamicLinkOtherPlatformParameters()

        public var fallbackUrl: URL? {
            didSet {
                params.fallbackUrl = fallbackUrl
            }
        }
    }
}

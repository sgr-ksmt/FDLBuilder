import Foundation
import FirebaseDynamicLinks

extension FDLBuilder {
    public final class OtherPlatform {
        let params = DynamicLinkOtherPlatformParameters()

        public var fallbackUrl: URLConvertible? {
            didSet {
                params.fallbackUrl = fallbackUrl?.__url
            }
        }
    }
}

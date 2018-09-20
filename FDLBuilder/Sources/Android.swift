import Foundation
import FirebaseDynamicLinks

extension FDLBuilder {
    public final class Android {
        let params: DynamicLinkAndroidParameters
        public let packageName: String
        init(packageName: String) {
            self.packageName = packageName
            params = DynamicLinkAndroidParameters(packageName: packageName)
        }

        public var fallbackURL: URLConvertible? {
            didSet {
                params.fallbackURL = fallbackURL?.__url
            }
        }

        public var minimumVersion: Int = 0 {
            didSet {
                params.minimumVersion = minimumVersion
            }
        }
    }
}

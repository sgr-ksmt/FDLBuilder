import Foundation
import Firebase

extension FDLBuilder {
    public final class Android {
        let params: DynamicLinkAndroidParameters
        public let packageName: String
        init(packageName: String) {
            self.packageName = packageName
            params = DynamicLinkAndroidParameters(packageName: packageName)
            print(params.minimumVersion)
        }

        public var fallbackURL: URL? {
            didSet {
                params.fallbackURL = fallbackURL
            }
        }

        public var minimumVersion: Int = 0 {
            didSet {
                params.minimumVersion = minimumVersion
            }
        }
    }
}

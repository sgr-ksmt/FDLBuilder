import Foundation
import Firebase

extension FDLBuilder {
    public final class iOS {
        let params: DynamicLinkIOSParameters
        public let bundleID: String

        init(bundleID: String) {
            self.bundleID = bundleID
            params = DynamicLinkIOSParameters(bundleID: bundleID)
        }

        public var appStoreID: String? {
            didSet {
                params.appStoreID = appStoreID
            }
        }

        public var fallbackURL: URLConvertible? {
            didSet {
                params.fallbackURL = fallbackURL?.__url
            }
        }

        public var customScheme: String? {
            didSet {
                params.customScheme = customScheme
            }
        }

        public var iPadBundleID: String? {
            didSet {
                params.iPadBundleID = iPadBundleID
            }
        }

        public var iPadFallbackURL: URLConvertible? {
            didSet {
                params.iPadFallbackURL = iPadFallbackURL?.__url
            }
        }

        public var minimumAppVersion: String? {
            didSet {
                params.minimumAppVersion = minimumAppVersion
            }
        }
    }
}

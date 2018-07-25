import Foundation
import Firebase

extension FDLBuilder {
    public final class AppStore {
        let params = DynamicLinkItunesConnectAnalyticsParameters()

        public var affiliateToken: String? {
            didSet {
                params.affiliateToken = affiliateToken
            }
        }

        public var campaignToken: String? {
            didSet {
                params.campaignToken = campaignToken
            }
        }

        public var providerToken: String? {
            didSet {
                params.providerToken = providerToken
            }
        }
    }
}

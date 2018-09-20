import Foundation
import FirebaseDynamicLinks

extension FDLBuilder {
    public final class Analytics {
        let params = DynamicLinkGoogleAnalyticsParameters()
        public var source: String? {
            didSet {
                params.source = source
            }
        }
        public var medium: String? {
            didSet {
                params.medium = medium
            }
        }
        public var campaign: String? {
            didSet {
                params.campaign = campaign
            }
        }
        public var term: String? {
            didSet {
                params.term = term
            }
        }
        public var content: String? {
            didSet {
                params.content = content
            }
        }
    }
}

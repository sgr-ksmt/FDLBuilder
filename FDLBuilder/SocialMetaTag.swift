import Foundation
import Firebase

extension FDLBuilder {
    public final class SocialMetaTag {
        let params = DynamicLinkSocialMetaTagParameters()

        public var title: String? {
            didSet {
                params.title = title
            }
        }

        public var descriptionText: String? {
            didSet {
                params.descriptionText = descriptionText
            }
        }
        public var imageURL: URLConvertible? {
            didSet {
                params.imageURL = imageURL?.__url
            }
        }
    }
}

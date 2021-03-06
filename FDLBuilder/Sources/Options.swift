import Foundation
import FirebaseDynamicLinks

extension FDLBuilder {
    public final class Options {
        let options = DynamicLinkComponentsOptions()

        public var pathLength: ShortDynamicLinkPathLength = .default {
            didSet {
                options.pathLength = pathLength
            }
        }
    }
}

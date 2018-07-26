import Foundation
import Firebase

public final class FDLBuilder {
    public enum URLLength {
        case short, long
    }
    let component: DynamicLinkComponents
    let initialLink: URL
    public private(set) var analytics: Analytics?
    public private(set) var ios: iOS?
    public private(set) var appStore: AppStore?
    public private(set) var android: Android?
    public private(set) var socialMetaTag: SocialMetaTag?
    public private(set) var navigationInfo: NavigationInfo?
    public private(set) var otherPlatform: OtherPlatform?
    public private(set) var options: Options?

    public init(link: URLConvertible, domain: String) {
        guard let link = link.__url else {
            fatalError("invalid url")
        }
        initialLink = link
        component = DynamicLinkComponents(link: link, domain: domain)
    }

    @discardableResult
    public func analytics(_ block: (Analytics) -> Analytics?) -> Self {
        return _configure(&analytics, block, .init())
    }

    @discardableResult
    public func iOS(bundleID: String, _ block: (iOS) -> iOS?) -> Self {
        return _configure(&ios, block, .init(bundleID: bundleID))
    }

    @discardableResult
    public func appStore(_ block: (AppStore) -> AppStore?) -> Self {
        return _configure(&appStore, block, .init())
    }

    @discardableResult
    public func android(packageName: String, _ block: (Android) -> Android?) -> Self {
        return _configure(&android, block ,.init(packageName: packageName))
    }

    @discardableResult
    public func socialMetaTag(_ block: (SocialMetaTag) -> SocialMetaTag?) -> Self {
        return _configure(&socialMetaTag, block, .init())
    }

    @discardableResult
    public func navigationInfo(_ block: (NavigationInfo) -> NavigationInfo?) -> Self {
        return _configure(&navigationInfo, block, .init())
    }

    @discardableResult
    public func otherPlatform(_ block: (OtherPlatform) -> OtherPlatform?) -> Self {
        return _configure(&otherPlatform, block, .init())
    }

    @discardableResult
    public func options(_ block: (Options) -> Options?) -> Self {
        return _configure(&options, block, .init())
    }

    @discardableResult
    public func link(_ link: URLConvertible) -> Self {
        guard let link = link.__url else {
            fatalError("invalid url")
        }
        component.link = link
        return self
    }

    @discardableResult
    public func resetLink() -> Self {
        component.link = initialLink
        return self
    }

    public func longURL() -> URL? {
        applyParameters()
        return component.url
    }

    public func build(_ length: URLLength, completion: @escaping DynamicLinkShortenerCompletion) {
        applyParameters()
        switch length {
        case .short:
            component.shorten(completion: completion)
        case .long:
            completion(component.url, nil, nil)
        }
    }

    private func _configure<T>(_ value: inout T?, _ block: (T) -> T?, _ initial: T) -> Self {
        value = block(initial)
        return self
    }

    private func applyParameters() {
        component.analyticsParameters = analytics?.params
        component.iOSParameters = ios?.params
        component.iTunesConnectParameters = appStore?.params
        component.androidParameters = android?.params
        component.socialMetaTagParameters = socialMetaTag?.params
        component.navigationInfoParameters = navigationInfo?.params
        component.otherPlatformParameters = otherPlatform?.params
        component.options = options?.options
    }
}

import Foundation

public protocol URLConvertible {
    var __url: URL? { get }
}

extension String: URLConvertible {
    public var __url: URL? {
        return URL(string: self)
    }
}

extension URL: URLConvertible {
    public var __url: URL? {
        return self
    }
}

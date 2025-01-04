import Foundation

/// The location of a bundle to use for looking up localized strings, such as the main bundle, or a bundle at a specific file URL.
///
/// This is a typealias for ``Foundation/LocalizedStringResource/BundleDescription``.
///
/// ## Topics
///
/// ### Operators
///
/// - ``Foundation/LocalizedStringResource/BundleDescription/!=(_:_:)-4fz74``
/// - ``Foundation/LocalizedStringResource/BundleDescription/!=(_:_:)-9olan``
/// - ``Foundation/LocalizedStringResource/BundleDescription/==(_:_:)-4cei2``
/// - ``Foundation/LocalizedStringResource/BundleDescription/==(_:_:)-4lipv``
///
///
/// ### Initializers
///
/// - ``Foundation/LocalizedStringResource/BundleDescription/init(_:)``
public typealias BundleDescription = LocalizedStringResource.BundleDescription

// MARK: - Equatable

extension BundleDescription: @retroactive Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		switch (lhs, rhs) {
			case let (.atURL(lhs), .atURL(rhs)): lhs == rhs
			case let (.forClass(lhs), .forClass(rhs)): lhs == rhs
			case (.main, .main): true
			default: lhs.resolveBundle() == rhs.resolveBundle()
		}
	}
}

// MARK: - Codable

extension BundleDescription: @retroactive Decodable, @retroactive Encodable {
	// Encode multiple properties for maximum compatibility.

	private enum CodingKeys: CodingKey {
		case identifier
		case `class`
		case url
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		let decodedIdentifier: String? = try container.decodeIfPresent(String.self, forKey: .identifier)
		let decodedURL: URL = try container.decode(URL.self, forKey: .url)
		let decodedClassName: String? = try container.decodeIfPresent(String.self, forKey: .class)

		let decodedClass: AnyClass? = if let decodedClassName {
			NSClassFromString(decodedClassName)
		} else {
			nil
		}

		let bundle: Bundle? = if let bundle = Bundle(url: decodedURL) {
			bundle
		} else if let decodedIdentifier, let bundle = Bundle(identifier: decodedIdentifier) {
			bundle
		} else if let decodedClass {
			Bundle(for: decodedClass)
		} else {
			nil
		}

		if let bundle {
			self.init(bundle)
		} else {
			self = .atURL(decodedURL).simplified()
		}
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		let encodingIdentifier: String?
		let encodingURL: URL
		let encodingClass: AnyClass?

		switch self {
			case .main:
				let bundle = Bundle.main
				encodingIdentifier = bundle.bundleIdentifier
				encodingURL = bundle.bundleURL
				encodingClass = bundle.classForCoder
			case let .forClass(`class`):
				let bundle = Bundle(for: `class`)
				encodingIdentifier = bundle.bundleIdentifier
				encodingURL = bundle.bundleURL
				encodingClass = `class`
			case let .atURL(url):
				let bundle = Bundle(url: url)
				encodingIdentifier = bundle?.bundleIdentifier
				encodingURL = url
				encodingClass = bundle?.principalClass
			case let other:
				Self.fatalError(caseNotImplemented: other)
		}

		let encodingClassName: String? = if let encodingClass {
			NSStringFromClass(encodingClass)
		} else {
			nil
		}

		try container.encodeIfPresent(encodingIdentifier, forKey: .identifier)
		try container.encode(encodingURL, forKey: .url)
		try container.encodeIfPresent(encodingClassName, forKey: .class)
	}
}

// MARK: - BundleResolvable

extension BundleDescription: BundleResolvable {
	public func resolveBundle() -> Bundle? {
		switch self {
			case .main:
				Bundle.main
			case let .forClass(`class`):
				Bundle(for: `class`)
			case let .atURL(url):
				Bundle(url: url)
			case let other:
				Self.fatalError(caseNotImplemented: other)
		}
	}
}

// MARK: - BundleDescriptionResolvable

extension BundleDescription: BundleDescriptionResolvable {
	public func resolveBundleDescription() -> BundleDescription {
		self
	}
}

// MARK: - Operators

public extension BundleDescription {
	static func != (lhs: Bundle, rhs: Self) -> Bool {
		lhs != rhs.resolveBundle()
	}

	static func != (lhs: Self, rhs: Bundle) -> Bool {
		lhs.resolveBundle() != rhs
	}

	static func == (lhs: Self, rhs: Bundle) -> Bool {
		lhs.resolveBundle() == rhs
	}

	static func == (lhs: Bundle, rhs: Self) -> Bool {
		lhs == rhs.resolveBundle()
	}
}

// MARK: - Convenience

public extension BundleDescription {
	/// Create a bundle description from a
	/// [`Bundle`]( https://developer.apple.com/documentation/foundation/bundle ).
	///
	/// - Parameter bundle:
	init(_ bundle: Bundle) {
		self = if bundle == Bundle.main {
			.main
		} else if let `class` = bundle.principalClass {
			.forClass(`class`)
		} else {
			.atURL(bundle.bundleURL)
		}
	}
}

// MARK: -

private extension BundleDescription {
	func simplified() -> Self {
		switch self {
			case .main:
				return self
			case .forClass,
			     .atURL:
				break
			case let other:
				Self.fatalError(caseNotImplemented: other)
		}

		return if let bundle = resolveBundle() {
			Self(bundle)
		} else {
			self
		}
	}
}

// MARK: - Errors

private extension BundleDescription {
	/// - Parameters:
	///   - enumerationCase: The enumeration case that caused the error.
	///   - function: The function where the error occurred.
	///   This uses the
	///   [`#function`]( https://developer.apple.com/documentation/swift/function() )
	///   macro by default.
	///   - file: The file where the error occurred.
	///   This uses the
	///   [`#file`]( https://developer.apple.com/documentation/swift/file() )
	///   macro by default.
	///   - line: The line where the error occurred.
	///   This uses the
	///   [`#line`]( https://developer.apple.com/documentation/swift/line() )
	///   macro by default.
	static func fatalError(
		caseNotImplemented enumerationCase: Self,
		function: StaticString = #function,
		file: StaticString = #file,
		line: UInt = #line
	) -> Never {
		Swift.fatalError(
			"""
			`\(enumerationCase)` is not currently supported in `\(function)`.
			\(unintendedCrashSuffix)
			""",
			file: file,
			line: line
		)
	}
}

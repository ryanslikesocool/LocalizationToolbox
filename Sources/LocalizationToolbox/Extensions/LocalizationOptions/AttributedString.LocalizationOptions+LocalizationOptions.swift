import Foundation

extension AttributedString.LocalizationOptions: LocalizationOptions {
	public init(replacements: [any CVarArg]) {
		self.init()
		self.replacements = replacements
	}
}

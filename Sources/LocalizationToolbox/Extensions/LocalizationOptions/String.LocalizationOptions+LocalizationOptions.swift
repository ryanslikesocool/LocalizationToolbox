import Foundation

extension String.LocalizationOptions: LocalizationOptions {
	public init(replacements: [any CVarArg]) {
		self.init()
		self.replacements = replacements
	}
}

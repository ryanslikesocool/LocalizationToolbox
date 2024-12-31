#if canImport(SwiftUI)
import SwiftUI

public extension Picker where
	Label == Text
{
	/// Creates a picker that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`](https://developer.apple.com/documentation/swiftui/text)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of selecting an option.
	///   - selection: A binding to a property that determines the currently-selected option.
	///   - content: A view that contains the set of options.
	nonisolated init(
		_ title: LocalizedStringResource,
		selection: Binding<SelectionValue>,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: title), selection: selection, content: content)
	}

	/// Creates a picker bound to a collection of bindings that generates its label from a string resource.
	///
	/// If the wrapped values of the collection passed to sources are not all the same, some styles render the selection in a mixed state.
	/// The specific presentation depends on the style.
	/// For example, a Picker with a menu style uses dashes instead of checkmarks to indicate the selected values.
	///
	/// This initializer creates a
	/// [`Text`](https://developer.apple.com/documentation/swiftui/text)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of selecting an option.
	///   - sources: A collection of values used as the source for displaying the Picker’s selection.
	///   - selection: The key path of the values that determines the currently-selected options.
	///   When a user selects an option from the picker, the values at the key path of all items in the `sources` collection are updated with the selected option.
	///   - content: A view that contains the set of options.
	nonisolated init<C>(
		_ title: LocalizedStringResource,
		sources: C,
		selection: KeyPath<C.Element, Binding<SelectionValue>>,
		@ViewBuilder content: () -> Content
	) where C : RandomAccessCollection {
		self.init(String(localized: title), sources: sources, selection: selection, content: content)
	}
}

// TODO: Add overloads for the following initializers:
// init(_:image:selection:content:)
// init(_:image:sources:selection:content:)
// init(_:systemImage:selection:content:)
// init(_:systemImage:sources:selection:content:)
// init(_:image:selection:content:currentValueLabel:)
// init(_:image:sources:selection:content:currentValueLabel:)
// init(_:selection:content:currentValueLabel:)
// init(_:sources:selection:content:currentValueLabel:)
// init(_:systemImage:selection:content:currentValueLabel:)
// init(_:systemImage:sources:selection:content:currentValueLabel:)

#endif
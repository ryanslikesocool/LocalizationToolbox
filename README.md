# LocalizationTable
String localization conveniences for Swift.

## Installation (Swift Package Manager)
Add the following entry to your package dependencies...
```swift
.package(url: "https://github.com/ryanslikesocool/LocalizationTable.git", from: "0.0.1"),
```
...and as a dependency to your targets.
```swift
.target(
	name: "MyTarget",
	dependencies: [
		"LocalizationTable",
	]
),
```

## Usage

```swift
import Foundation
import LocalizationTable
import SwiftUI

// declare once...

extension LocalizationTableResource {
	static let myLocalizationTable = Self("MyLocalizationTable")
	
	static let myOtherLocalizationTable = Self(
		"MyOtherLocalizationTable",
		bundle: .main,
		locale: .current
	)
}

// ...use everywhere!

Swift.String(localized: "KEY1", table: .myLocalizationTable)

Foundation.AttributedString(localized: "KEY2", table: .myOtherLocalizationTable)

Foundation.LocalizedStringResource("KEY3", table: .myLocalizationTable)

SwiftUI.Text("KEY4", table: .myOtherLocalizationTable)
```

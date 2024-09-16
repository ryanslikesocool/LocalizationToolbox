# LocalizationTable
Localization conveniences for Swift.

## Installation (Swift Package Manager)
Add the following entry to your package dependencies.
```swift
.package(url: "https://github.com/ryanslikesocool/LocalizationTable.git", from: "0.0.1"),
```

## Usage

```swift
import LocalizationTable

extension LocalizationTableResource { 
	// declare once...
	static let myLocalizationTable: Self = "MyLocalizationTable"
}

// use everywhere!
String(localized: "LOCALIZATION_KEY", table: .myLocalizationTable)
```

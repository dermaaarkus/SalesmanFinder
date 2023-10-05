# SalesmanFinder

1&1 Coding Challenge

The project was build with Xcode 15 for iOS 17 and later. It was a fun and nice task to work on 🥳

![Simulator Screenshot - iPhone 15 Pro - 2023-10-05 at 16 10 51](https://github.com/dermaaarkus/SalesmanFinder/assets/7196958/6c386e17-50a1-4a88-b0be-9dfa69c037cb)

---

# Documentation

## Comments
I left some `// TODO:` and `// NOTE` comments in the code to make it easier for the reviewer of my submitted challenge.

## Code Coverage
The code coverage is about 98% in the final state of my work. Aiming for 100% doesn't make sense in my opinion and leads to write complex and/or not necessary unit test. On the other hand also a high code converage does not necessarily cover all edge cases, e.g. iterating on arrays with zero value, one value, many values.

I used `assertionFailure` in cases where no error can occur unless the developer did something wrong. `assertionFailure` crashes in debug, but not in production, so I prefer this over writing unit tests for those not existing error cases.

## Design
Unfortunatly I had some trouble with the given design:

1. The design has had buttons, that were not described in the requirements:
  - Navigate back button
  - Microphone in the right position of the search text field
2. The design didn't use the modern approach to have the search bar included in the navigation bar. SwiftUI gives us new options to do so and it's recommend to stay up to date to the Apple framework. With the modern approach I couldn't fulfill the blue color properly, so I removed it again. But I did a screenshot and paste the code here in this section.
3. No custom font's were provided, but in the Android design, that was accessable for me, they use `Roboto`.
4. In Adobe Xd I could not access the color of the gray circle properly, so I guessed from the other colors.
5. In Adobe Xd the gray cicle was not designed properly, e.g. the height was 41 and width 42 pixels.
6. In Adobe Xd the color set has no names, so I gave them some names in the `StyleGuide` helper myself.
7. In SwiftUI I couldn't find out why the `DisclosureGroup` arrow on the trailing position has some transparency. Instead of spending more time for this detail, I left a comment in code, sorry!

### Bullet Point 2
```swift
NavigationStack {
    ScrollView {
        LazyVStack {
            ForEach(viewModel.salesmen) { salesman in
                SearchSalesmanView(salesman: salesman)
            }
        }
    }
    .navigationTitle("Addresses")
    .toolbarBackground(StyleGuide.companyColor, for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
}
```

![Simulator Screenshot - iPhone 15 Pro - 2023-10-05 at 13 31 04](https://github.com/dermaaarkus/SalesmanFinder/assets/7196958/0cfbea31-1868-4bec-8f23-93072da42a46)


## Other
I did not use the optional framework `Realm`, because I like to keep it simple and easy to understand for only one scene in the app.

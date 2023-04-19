![Thumbnail](./thumbnail.png)
# ConditionalSwiftUI
A Library that makes SwiftUI conditional statements easy

## Usage

### .if
This method applies the given transform if the given condition evaluates to true.
```swift
Text("Hello, World!")
    .if(someCondition) { view in
        view
            .foregroundColor(.red)
            .background(Color.yellow)
    }
```

### if with else
same with `.if` but with `else`
```swift
Text("Hello, World!")
    .if(someCondition) { view in
        view
            .foregroundColor(.red)
            .background(Color.yellow)
    }, else: { view in
        view
            .foregroundColor(.blue)
    }
```

### ifLet
same with if, but it takes an optional value instead of a boolean and unwraps it

```swift
struct ContentView: View {
    @State private var color: Color? = nil
    
    var body: some View {
        Text("Hello World")
            .ifLet(color) { color, view in
                view
                    .foregroundColor(color)
            }
    }
}
```

### ifLet with else
same with `.ifLet` but with `else`

```swift
struct ContentView: View {
    @State private var color: Color? = nil
    
    var body: some View {
        Text("Hello World")
            .ifLet(color) { color, view in
                view
                    .foregroundColor(color)
            }, else: { view in
                view
                    .foregroundColor(.red)
            }
    }
}
```
### extractView
this method extracts the view like in the `.if` statement, especially useful when using `if #available()` statement

```swift
Toggle("I'm a conditionally modified Toggle!", isOn: .constant(true))
    .extractView { view in
        Group {
            if #available(iOS 15.0, *) {
                view
                    .tint(.indigo)
            }
            else {
                view
                    .toggleStyle(SwitchToggleStyle(tint: .init(.systemIndigo)))
            }
        }
    }
```

### Implementation, and its drawbacks
This implementaion is not new, and it's been used widely for the time being so be aware that it could cause you some trouble with animations, as described in this [article](https://www.objc.io/blog/2021/08/24/conditional-view-modifiers/), so be cautious about it when using this library.

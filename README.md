# Swift box implementation

A [box](http://exploring.liftweb.net/master/index-C.html) implementation for Swift.

This is useful when some values can contain errors, for example when
fetching some model from an API.

## Installation

Add

```
pod 'SwiftBox'
```

to your PodFile.

## Usage

You can create a `Box` by using

```swift
let fullBox = Box<String>("foo")
let failureBox = Box<String>(NSError(domain: "foo", code: 2, userInfo: nil)) // will be failure
let emptyBox = Box<String>.Empty
```

You can then use your box:

```swift
if box.isFull() {
	let myString = box>! // == box.value!
}
if box.isFailure() {
	let myError = box.failure!
}

if let str = box.value {
	useMyString(str)
}

switch box {
case Box.Full(let wrappedStr):
    useMyString(wrappedStr.value) // == wrappedStr.v
case Box.Failure(let err):
    handleError(err)
case Box.Empty:
    break
}
```

## Example

```swift
class User {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

class MyClass {
    var user: Box<User>
    
    init() {
        self.user = Box.Empty
    }
    
    func showUser(u: User) {
        // do something
    }
    
    func handleError(err: NSError) {
        // handle your error
    }
    
    func tryShowUser() {
        switch user {
        case Box.Full(let wrappedUser):
            showUser(wrappedUser.value) // == wrappedUser.v
        case Box.Failure(let err):
            handleError(err)
        case Box.Empty:
            break
        }
    }
}
```
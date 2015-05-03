# Swift box implementation

A [box](http://exploring.liftweb.net/master/index-C.html) implementation for Swift.

This is useful when some values can contain errors, for example when
fetching some model from an API.

## Example

```swift
public class User {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

public class MyClass {
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
        case Box.Full(let u):
            showUser(u.v)
        case Box.Failure(let err):
            handleError(err)
        case Box.Empty:
            break
        }
    }
}
```
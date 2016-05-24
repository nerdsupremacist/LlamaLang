# LlamaLang
Repository for the Llama Programming Language.
This is a Programming Language I'm defining since I wanted to try out Python and always wanted to make one. ;)

So far it's really simple:

### Datatypes:

* Number (float or int)
* String
* Bool
* Function

#### Define a variable:

```
let myString = "My String"
let myNumber = 42
let isLlamaAwesome = true
```

#### Write a Comment:

Llama only allows for one line comments

```

// This is a comment

let myVar = 42 // This is an inline Comment

```

#### Define a function

```
let square = x -> x * x
```

so that:

```
square 25 // 625 (Number)
```

Functions are obviously First Class Citizens:

```
let redundant = f x -> f (f (f x))
let yell = x -> x + "!"
let hello = "Hello"

redundant (yell) hello // "Hello!!!"
```

#### Mathematical Operations Supported:

```
let a = 1
let b = 2

a + b
a - b
a * b
a / b
a ** b
```

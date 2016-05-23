# LlamaLang
Repository for the Llama Programming Language.
This is a Programming Language I'm defining since I wanted to try out Python and always wanted to make one. ;)

So far it's really simple:

### Datatypes:

* Number (float or int)
* String
* Function

Define a variable:

```
let var = "My Variable"
```

Define a function

```
let square = x -> x * x
```

Functions are obviously First Class Citizens:

```
let redundant = f x -> f (f (f x))
```

Mathematical Operations Supported:

```
let a = 1
let b = 2

a + b
a - b
a * b
a / b
a ** b
```

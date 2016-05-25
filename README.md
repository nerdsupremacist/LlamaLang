![alt text](https://raw.githubusercontent.com/mathiasquintero/LlamaLang/master/logo.png "Small logo I made while I had time ;)")

# Llama Programming Language
Repository for the Llama Programming Language.
This is a Programming Language I'm defining since I wanted to try out Python and always wanted to make one. ;)

It's still a work in progress.
For any cool ideas just make an issue and feel free to fork this project and work on it as you like.

As soon as I'm done with the Interpreter I will probably get a few friends and write a full compiler.

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

redundant yell hello // "Hello!!!"
```

#### Control

To take decisions you can use if then else and recursion to create very complex programs

For instance take this small function to calculate the n Factorial:

```
let fac = n ->
  if n = 0 then
    0
  else
    n * (fac (n-1))
```

*Note: Our Interpreter can only take one line at the time for now.*

#### More Examples

It works great with tail recursion. For example if you want to calculate the n-th Result of the Fibonacci Sequence:

```
let helper = n a b -> if n = 0 then b else helper (n-1) (a+b) a

let fib = n -> helper n 1 0
```

#### Mathematical Operations Supported:

```
let a = 1
let b = 2

a + b
a - b
a * b
a / b
a ** b // Stands for a^b
```

#### Compare Data

```
let a = 5
let b = 4

a = b // false (That's right a single one)
a != b // true
```

#### Boolean Logic

```
let a = true
let b = false
a & b // false
a | b // true
```

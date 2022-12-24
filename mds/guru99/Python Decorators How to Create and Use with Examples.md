# Python Decorators: How to Create and Use with Examples



## Introduction

Everything in the python programming language is an object. First-class objects are objects that can be dynamically created, destroyed, passed as a parameter to a procedure/function, returned as a value from a procedure/function. In languages like c++ and Java everythig is not a first-class object but in python everything is. Which means that functions and classes themselves can be passed as parameters.

```python
def day_based_greeting():
    print("Good Afternoon")

def greeting(func):
    print("Hello, John")
    func()

greeting(day_based_greeting)


```

*Listing 1.0*

Notice how that `day_based_greeting` has been passed into `greeting` without the brackets. The brackets indicate that it is being called.

The output will be:

```shellsession
Hello, John
Good Afternoon
```

### Inner functions

Functions can also be declared inside other functions.

```python
from datetime import datetime

def say_hello(name):
    hour = datetime.now().hour

    print(f"Hello, {name}")

    def day_based_greeting():
        greeting = ''
        if hour > 18:
            greeting = "Good Evening"
        elif hour < 12:
            greeting = "Good Morning"
        else:
            greeting = "Good Afternoon"

        print(greeting)

    day_based_greeting()


say_hello('Guido')
```

*Listing 1.1*

Outputs:

```shellsession
Hello, Guido
Good Morning
```

In Listing 1.1, we have an inner function `day_based_greeting` inside the function `say_hello`. The variable `hour` is accessible to `day_based_greeting` but `greeting` isn't accessible to the `say_hello` function. In essence all variables, including parameters passed to the outer function are accessible to the inner function without being explicitedly passed to it.

## Introduction to Decorators

What if we wanted this kind of greeting whenever we want to say hello and whenever we want to bid farewell. We could just move our function out and call it from another function say `bid_farewell()`.What if we wanted to be sure, whoever we wanted to say hello to was a registered user, we would need some functions to run before, we run our `say_hello` before we run our `day_based_greeting`.

```python
from datetime import datetime


def day_based_greeting():
    hour = datetime.now().hour
    greeting = ''
    if hour > 18:
        greeting = "Good Evening"
    elif hour < 12:
        greeting = "Good Morning"
    else:
        greeting = "Good Afternoon"

    print(greeting)


def is_user_registered(username: str) -> bool:
    registered_users = ('Guildo', 'Guru99', 'Ampofo')
    print(f'is user registered: {username in registered_users}')


def say_hello(name):
    print(f"Hello, {name}")


user = 'Ruby'
is_user_registered(user)
say_hello(user)
day_based_greeting()

```

```shellsession
is user registered: False
Hello, Ruby
Good Afternoon
```

Python offers a new syntax known as decorators where we decorate a function/class with another function/class using the `@` symbol. Using this syntax we can handle processes before and after a function/class is called and even its inputs and what happens to its outputs.

But first we have to utilize the concept of inner functions first. So our example can be re-written as:



## How to add arguments to decorators in Python

## Returning values from decorated functions

## Reusing a decorator on multiple functions

## Multiple decorators on a single function

## A decorator within a function

## Preserving function metadata

## Decorating a class

## classes as decorators

## Built-in Fancy Decorators

## Stateful Decorators

## Example use cases of decorators

## Where you don't need decorators

## Summary

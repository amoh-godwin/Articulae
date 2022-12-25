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

It is used extensively in web programming and Gui programming in python.

With it python calls the decorator function and passes in the decorated and then assigns the return value to the decorated function as:

```python

def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")
    return lambda : print('What I return is the decorated function')

@decorator
def decorated():
    print("I have been well decorated")

```

Listing 2.1

Just runing the code in Listing 2.1, without calling the decorated function, you will see that python has called the decorator function, so it will output

```shellsession
I am for decoration
I have received decorated as a prameter
```

Because, under the hood, python is calling the decorator and assigning its return value to the decorated as:

```python
decorated = decorator(decorated)
```

So now when we run the decorated, we can see that it run our lambda function which was return by the decorator:

```python
...


@decorator
def decorated():
    print("I have been well decorated")


decorated()
```

This will print

```shellsession
I am for decoration
I have received decorated as a prameter
What I return is the decorated function
```

If we want to run the decorated function we can return that rather, since the decorator received it as a parameter.

```python

def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")
    return func

@decorator
def decorated():
    print("I have been well decorated")


decorated()
```

Now when we run we would see

```shellsession
I am for decoration
I have received decorated as a prameter
I have been well decorated
```

With this you can see that we can control when a function runs just by decorating it.

But now a problem arises. What if we want to control what happens after the function runs. We can, if we utilize the concept of inner functions. 

With inner functions we return our inner function to the decorated, when it gets called we call the decorated and then handle other processes after its done executing.

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    def inner_function():
        func()
        print('we are still here after running the decorated')

    return inner_function

...
```

this outputs

```shellsession
I am for decoration
I have received decorated as a prameter
I have been well decorated
we are still here after running the decorated
```

But now another problem arises. What happens to parameters that will be passed to the decorated function.



---

So our example can be re-written as:

```python
from time import time

def record_history(func):

    def inner_caller():
        start = time()
        func()
        end = time()
        diff = end - start
        print(f"function: {func.__name__} was called. It ran for {diff} secs")
    return inner_caller

@record_history
def delete():
    print('Deleting a file')

delete()


```

Listing 2.1

```shellsession
Deleting a file
function: delete was called. It ran for 0.0 secs
```

Although python has a module for timing code expressions, I wanted you to see the actual function being run on its on line. So we can time a function using the timeit module as;

```python
from timeit import timeit

def record_history(func):

    def inner_caller():
        diff = timeit(func, number=1)
        print(f"function: {func.__name__} was called. It ran for {diff} secs")
    return inner_caller

...


```

What is going on under the hood is python is writing the function as:

---



## How to add arguments to decorators in Python

You see, once you are returning a function as the decorated, when the decorated gets called all the parameters it is called with will be passed to the function you are returning, it is the decorated now.

```python

def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    return func # this will receive the parameters, when called


@decorator
def decorated(name, sister):
    print(f"Name is: {name}, My sister is: {sister}")


decorated('John', 'Jane')

```

This will print

```python
I am for decoration
I have received decorated as a prameter
Name is: John, My sister is: Jane
```

So when you are returning an inner function, you must also receive the parameters in the inner function and also pass it in when you call the decorated in the inner function as:

```python

def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    def inner_function(x, y):
        func(x, y)
        print('I am done with all I want to do')

    return inner_function

```

This will return

```shellsession
I am for decoration
I have received decorated as a prameter
Name is: John, My sister is: Jane
I am done with all I want to do
```

pass

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
